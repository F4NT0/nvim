package main

import (
	"fmt"
	"os"
	"strings"

	tea "github.com/charmbracelet/bubbletea"
	"github.com/charmbracelet/lipgloss"
)

// ── step machine ─────────────────────────────────────────────────────────────

type step int

const (
	stepWelcome      step = iota // intro screen
	stepChecking                 // running checks (async)
	stepChecksDone               // results table + next action
	stepInstallingDeps           // running winget for missing tools
	stepDepsInstalled            // confirmation that deps were installed
	stepChooseDir                // pick destination dir
	stepCustomDir                // user types a custom dir
	stepConfirmOverwrite         // existing config -> backup or cancel
	stepDeploying                // copying files
	stepLazySync                 // nvim --headless +Lazy! sync
	stepDone                     // success
	stepError                    // failure
)

// ── messages ─────────────────────────────────────────────────────────────────

type checksDoneMsg struct{ checks []checkResult }
type depsDoneMsg struct{ results []installResult }
type deployDoneMsg struct {
	dest string
	err  error
}
type lazyDoneMsg struct{ err error }

// ── model ────────────────────────────────────────────────────────────────────

type model struct {
	width, height int
	step          step

	checks       []checkResult
	depsResults  []installResult

	// Destination selection
	dirChoice int    // 0 = default, 1 = custom
	inputBuf  string // typed path when dirChoice == 1
	destDir   string

	// Deploy state
	srcDir       string
	deployedDir  string
	deployErr    error
	lazyErr      error
	backupExists bool
}

func newModel() model {
	return model{
		step:    stepWelcome,
		srcDir:  configSrcDir(),
	}
}

func (m model) Init() tea.Cmd { return nil }

// ── update ───────────────────────────────────────────────────────────────────

func (m model) Update(msg tea.Msg) (tea.Model, tea.Cmd) {
	switch msg := msg.(type) {

	case tea.WindowSizeMsg:
		m.width, m.height = msg.Width, msg.Height
		return m, nil

	case checksDoneMsg:
		m.checks = msg.checks
		m.step = stepChecksDone
		return m, nil

	case depsDoneMsg:
		m.depsResults = msg.results
		m.step = stepDepsInstalled
		return m, nil

	case deployDoneMsg:
		if msg.err != nil {
			m.deployErr = msg.err
			m.step = stepError
			return m, nil
		}
		m.deployedDir = msg.dest
		m.step = stepLazySync
		return m, runLazyCmd()

	case lazyDoneMsg:
		m.lazyErr = msg.err
		m.step = stepDone
		return m, nil

	case needConfirmMsg:
		m.step = stepConfirmOverwrite
		return m, nil

	case tea.KeyMsg:
		return m.handleKey(msg)
	}
	return m, nil
}

func (m model) handleKey(msg tea.KeyMsg) (tea.Model, tea.Cmd) {
	key := msg.String()

	// Global quit
	if key == "ctrl+c" {
		return m, tea.Quit
	}

	switch m.step {

	case stepWelcome:
		if key == "enter" || key == " " {
			m.step = stepChecking
			return m, runChecksCmd()
		}
		if key == "q" {
			return m, tea.Quit
		}

	case stepChecksDone:
		switch key {
		case "i", "I":
			if len(missingInstallable(m.checks)) == 0 {
				// nothing to install -> jump straight to deploy step
				m.step = stepChooseDir
				return m, nil
			}
			m.step = stepInstallingDeps
			return m, runInstallCmd(m.checks)
		case "enter", " ":
			if hasBlockingFailure(m.checks) {
				return m, tea.Quit
			}
			m.step = stepChooseDir
		case "q":
			return m, tea.Quit
		}

	case stepDepsInstalled:
		if key == "enter" || key == " " {
			// Re-run checks so the user sees up-to-date state, then proceed.
			m.step = stepChecking
			return m, runChecksCmd()
		}
		if key == "q" {
			return m, tea.Quit
		}

	case stepChooseDir:
		switch key {
		case "up", "k":
			if m.dirChoice > 0 {
				m.dirChoice--
			}
		case "down", "j":
			if m.dirChoice < 1 {
				m.dirChoice++
			}
		case "enter":
			if m.dirChoice == 1 {
				m.inputBuf = ""
				m.step = stepCustomDir
				return m, nil
			}
			m.destDir = defaultDestDir()
			return m, m.maybeConfirm()
		case "esc", "q":
			return m, tea.Quit
		}

	case stepCustomDir:
		switch key {
		case "enter":
			d := strings.TrimSpace(m.inputBuf)
			if d == "" {
				return m, nil
			}
			m.destDir = d
			return m, m.maybeConfirm()
		case "esc":
			m.step = stepChooseDir
		case "backspace", "ctrl+h":
			if len(m.inputBuf) > 0 {
				m.inputBuf = m.inputBuf[:len(m.inputBuf)-1]
			}
		default:
			if len(msg.Runes) > 0 {
				m.inputBuf += string(msg.Runes)
			}
		}

	case stepConfirmOverwrite:
		switch strings.ToLower(key) {
		case "y", "enter":
			m.backupExists = true
			m.step = stepDeploying
			return m, runDeployCmd(m.srcDir, m.destDir, true)
		case "n":
			m.step = stepDeploying
			return m, runDeployCmd(m.srcDir, m.destDir, false)
		case "esc", "q":
			return m, tea.Quit
		}

	case stepDone, stepError:
		return m, tea.Quit
	}
	return m, nil
}

// maybeConfirm decides whether to ask for backup or jump straight to deploy.
func (m model) maybeConfirm() tea.Cmd {
	if dirExists(m.destDir) {
		entries, _ := os.ReadDir(m.destDir)
		if len(entries) > 0 {
			// Need user input — switch via a synthetic message.
			return func() tea.Msg { return needConfirmMsg{} }
		}
	}
	return runDeployCmd(m.srcDir, m.destDir, false)
}

type needConfirmMsg struct{}

// ── tea.Cmd factories ────────────────────────────────────────────────────────

func runChecksCmd() tea.Cmd {
	return func() tea.Msg { return checksDoneMsg{checks: runAllChecks()} }
}

func runInstallCmd(checks []checkResult) tea.Cmd {
	return func() tea.Msg { return depsDoneMsg{results: installMissing(checks)} }
}

func runDeployCmd(src, dest string, backup bool) tea.Cmd {
	return func() tea.Msg {
		err := deployConfig(src, dest, backup)
		return deployDoneMsg{dest: dest, err: err}
	}
}

func runLazyCmd() tea.Cmd {
	return func() tea.Msg {
		err := runLazySync()
		return lazyDoneMsg{err: err}
	}
}

// ── view ─────────────────────────────────────────────────────────────────────

func (m model) View() string {
	w := m.width
	if w < 60 {
		w = 80
	}
	boxW := w - 8
	if boxW > 92 {
		boxW = 92
	}

	titleStyle    := lipgloss.NewStyle().Foreground(cGreen).Bold(true)
	subtitleStyle := sty(cBlue)
	mutedStyle    := sty(cMuted)

	header := lipgloss.JoinVertical(lipgloss.Left,
		titleStyle.Render(asciiTitle),
		subtitleStyle.Render("  Bootstrap installer for the Neovim configuration"),
		mutedStyle.Render("  Validates prerequisites, installs missing tooling, deploys the config"),
		"",
	)

	var content string
	switch m.step {
	case stepWelcome:
		content = m.viewWelcome(boxW)
	case stepChecking:
		content = box(boxW,
			sty(cOrange).Bold(true).Render(" Checking prerequisites..."),
			"",
			mutedStyle.Render("  Please wait while your environment is verified."),
		)
	case stepChecksDone:
		content = m.viewChecks(boxW)
	case stepInstallingDeps:
		content = box(boxW,
			sty(cOrange).Bold(true).Render(" Installing missing tools via winget..."),
			"",
			mutedStyle.Render("  This window will continue when winget finishes."),
			mutedStyle.Render("  Some packages may open separate UAC prompts."),
		)
	case stepDepsInstalled:
		content = m.viewDepsInstalled(boxW)
	case stepChooseDir:
		content = m.viewChooseDir(boxW)
	case stepCustomDir:
		content = m.viewCustomDir(boxW)
	case stepConfirmOverwrite:
		content = m.viewConfirmOverwrite(boxW)
	case stepDeploying:
		content = box(boxW,
			sty(cOrange).Bold(true).Render(" Deploying configuration..."),
			"",
			mutedStyle.Render("  Copying files to "+m.destDir),
		)
	case stepLazySync:
		content = box(boxW,
			sty(cOrange).Bold(true).Render(" Syncing plugins (nvim --headless +Lazy! sync)..."),
			"",
			mutedStyle.Render("  lazy.nvim is downloading every plugin spec."),
			mutedStyle.Render("  First-time installs can take a minute or two."),
		)
	case stepDone:
		content = m.viewDone(boxW)
	case stepError:
		content = box(boxW,
			sty(cRed).Bold(true).Render(" ✖ Installation failed"),
			"",
			sty(cRed).Render("  "+m.deployErr.Error()),
			"",
			mutedStyle.Render("  Press any key to exit"),
		)
	}

	full := lipgloss.JoinVertical(lipgloss.Left, header, content)
	return lipgloss.NewStyle().
		Background(cBg).
		Foreground(cFg).
		Padding(1, 3).
		Width(w).
		Render(full)
}

func (m model) viewWelcome(w int) string {
	mutedStyle := sty(cMuted)
	srcLine := ""
	if m.srcDir != "" {
		srcLine = sty(cGreen).Render("  ✔ Source config: ") + sty(cBlue).Render(m.srcDir)
	} else {
		srcLine = sty(cRed).Render("  ✖ Could not auto-detect the source configuration directory")
	}
	return box(w,
		sty(cAccent).Bold(true).Render(" Welcome to the Neovim configuration installer"),
		"",
		mutedStyle.Render("  This installer will:"),
		mutedStyle.Render("    1. Check that every prerequisite is installed (winget can fill the gaps)"),
		mutedStyle.Render("    2. Copy the Neovim configuration to %LOCALAPPDATA%\\nvim"),
		mutedStyle.Render("    3. Run `nvim --headless +Lazy! sync` so every plugin is ready"),
		"",
		srcLine,
		"",
		mutedStyle.Render("  Enter: continue   q: quit"),
	)
}

func (m model) viewChecks(w int) string {
	mutedStyle := sty(cMuted)
	rows := []string{
		sty(cAccent).Bold(true).Render(" Prerequisite check"),
		"",
	}
	for _, c := range m.checks {
		rows = append(rows, renderCheck(c))
	}
	rows = append(rows, "")

	missing := missingInstallable(m.checks)
	if hasBlockingFailure(m.checks) {
		rows = append(rows,
			sty(cRed).Render("  Some REQUIRED tools are missing. Press 'i' to install via winget,"),
			sty(cRed).Render("  or 'q' to abort and install them by hand."),
			"",
			mutedStyle.Render("  i: install missing   q: quit"),
		)
	} else if len(missing) > 0 {
		rows = append(rows,
			sty(cYellow).Render("  Some optional tools are missing — install via winget?"),
			"",
			mutedStyle.Render("  i: install missing   Enter: continue anyway   q: quit"),
		)
	} else {
		rows = append(rows,
			sty(cGreen).Render("  Everything is in place. Ready to deploy."),
			"",
			mutedStyle.Render("  Enter: continue   q: quit"),
		)
	}
	return box(w, rows...)
}

func (m model) viewDepsInstalled(w int) string {
	mutedStyle := sty(cMuted)
	rows := []string{
		sty(cAccent).Bold(true).Render(" winget results"),
		"",
	}
	for _, r := range m.depsResults {
		if r.err != nil {
			rows = append(rows, sty(cRed).Render("   ✖ ")+sty(cFg).Render(r.label)+sty(cRed).Render(" — "+r.err.Error()))
		} else {
			rows = append(rows, sty(cGreen).Render("   ✔ ")+sty(cFg).Render(r.label))
		}
	}
	rows = append(rows, "")
	rows = append(rows, mutedStyle.Render("  Enter: re-run prerequisite checks   q: quit"))
	return box(w, rows...)
}

func (m model) viewChooseDir(w int) string {
	mutedStyle := sty(cMuted)
	opts := []string{
		"%LOCALAPPDATA%\\nvim  (recommended)",
		"Custom directory",
	}
	rows := []string{
		sty(cAccent).Bold(true).Render(" Choose destination directory"),
		mutedStyle.Render("  This is where init.lua, lua/ and KEYMAPS.md will be deployed."),
		"",
	}
	for i, o := range opts {
		if i == m.dirChoice {
			rows = append(rows, sty(cOrange).Render("  > ")+sty(cBlue).Bold(true).Render(o))
		} else {
			rows = append(rows, mutedStyle.Render("    "+o))
		}
	}
	rows = append(rows, "", mutedStyle.Render("  ↑↓: select   Enter: confirm   q: quit"))
	return box(w, rows...)
}

func (m model) viewCustomDir(w int) string {
	mutedStyle := sty(cMuted)
	cur := sty(cBlue).Background(cBlue).Foreground(cBg).Render(" ")
	return box(w,
		sty(cAccent).Bold(true).Render(" Custom destination path"),
		"",
		mutedStyle.Render("  Type the full path where the configuration should be placed."),
		"",
		sty(cBlue).Render("  > ")+sty(cFg).Render(m.inputBuf)+cur,
		"",
		mutedStyle.Render("  Enter: confirm   Esc: back   Ctrl+C: quit"),
	)
}

func (m model) viewConfirmOverwrite(w int) string {
	mutedStyle := sty(cMuted)
	return box(w,
		sty(cOrange).Bold(true).Render(" Existing configuration detected"),
		"",
		mutedStyle.Render("  ")+sty(cBlue).Render(m.destDir)+mutedStyle.Render(" already contains files."),
		"",
		sty(cFg).Render("  Back up the existing config to ")+sty(cBlue).Render(m.destDir+".backup")+sty(cFg).Render("?"),
		"",
		mutedStyle.Render("  y / Enter: backup and replace   n: overwrite without backup   q: quit"),
	)
}

func (m model) viewDone(w int) string {
	mutedStyle := sty(cMuted)
	lines := []string{
		sty(cGreen).Bold(true).Render(" ✔ Neovim configuration deployed successfully!"),
		"",
		mutedStyle.Render("  Location : ") + sty(cBlue).Render(m.deployedDir),
	}
	if m.backupExists {
		lines = append(lines, mutedStyle.Render("  Backup   : ")+sty(cBlue).Render(m.deployedDir+".backup"))
	}
	if m.lazyErr != nil {
		lines = append(lines, "",
			sty(cYellow).Render("  Plugin sync reported an error:"),
			sty(cRed).Render("  "+m.lazyErr.Error()),
			mutedStyle.Render("  Run `nvim` and inspect `:Lazy log` for details."),
		)
	} else {
		lines = append(lines, "",
			sty(cGreen).Render("  All plugins were synchronised by lazy.nvim."),
		)
	}
	lines = append(lines, "",
		sty(cAccent).Render("  Next steps:"),
		mutedStyle.Render("    1. Open a new terminal so PATH updates take effect."),
		mutedStyle.Render("    2. Run `nvim` — the dashboard should appear."),
		mutedStyle.Render("    3. Press :Khelp for the keymap manual."),
		"",
		mutedStyle.Render("  Press any key to exit"),
	)
	return box(w, lines...)
}

// renderCheck formats a single check result with a colour badge.
func renderCheck(c checkResult) string {
	var badge string
	switch c.status {
	case checkOK:
		badge = lipgloss.NewStyle().Foreground(cBg).Background(cGreen).Bold(true).Padding(0, 1).Render("OK")
	case checkWarn:
		badge = lipgloss.NewStyle().Foreground(cBg).Background(cYellow).Bold(true).Padding(0, 1).Render("WARN")
	case checkFail:
		badge = lipgloss.NewStyle().Foreground(cFg).Background(cRed).Bold(true).Padding(0, 1).Render("FAIL")
	}
	label := sty(cAccent).Bold(true).Render(fmt.Sprintf("%-17s", c.label))
	msg := sty(cMuted).Render(c.message)
	return "  " + badge + " " + label + " " + msg
}

// ── main ─────────────────────────────────────────────────────────────────────

func main() {
	if _, err := tea.NewProgram(newModel(), tea.WithAltScreen()).Run(); err != nil {
		fmt.Fprintln(os.Stderr, "installer error:", err)
		os.Exit(1)
	}
}

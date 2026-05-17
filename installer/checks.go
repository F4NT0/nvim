package main

import (
	"fmt"
	"os/exec"
	"regexp"
	"strconv"
	"strings"
)

// checkStatus represents the outcome of a single prerequisite check.
type checkStatus int

const (
	checkOK   checkStatus = iota // installed, recent enough
	checkWarn                    // installed but outdated / not ideal
	checkFail                    // missing — required to proceed
)

// checkResult is what each `check*` function returns.
type checkResult struct {
	label   string      // human-readable name (e.g. "Neovim")
	status  checkStatus // ok / warn / fail
	message string      // detail to display
	wingetID string     // package id for `winget install` (empty == not auto-installable)
	required bool       // if true, a failure blocks the install
}

// runAllChecks performs every prerequisite check sequentially.
// Order here matches the order they appear in the TUI.
func runAllChecks() []checkResult {
	return []checkResult{
		checkPowerShell(),
		checkNeovim(),
		checkGit(),
		checkDotNet(),
		checkNode(),
		checkPython(),
		checkRipgrep(),
		checkLazygit(),
		checkGCC(),
		checkNerdFont(),
		checkNetCoreDbg(),
	}
}

// ── individual checks ────────────────────────────────────────────────────────

func checkNeovim() checkResult {
	const label = "Neovim"
	const minMajor, minMinor = 0, 11
	res := checkResult{label: label, wingetID: "Neovim.Neovim", required: true}

	bin, err := exec.LookPath("nvim")
	if err != nil {
		res.status, res.message = checkFail, "Not installed — required (>= 0.11)"
		return res
	}
	out, err := exec.Command(bin, "--version").Output()
	if err != nil {
		res.status, res.message = checkWarn, "Found but version could not be determined"
		return res
	}
	major, minor := parseSemver(string(out), `NVIM v(\d+)\.(\d+)`)
	versionStr := fmt.Sprintf("v%d.%d", major, minor)
	if major == 0 && minor == 0 {
		res.status, res.message = checkWarn, "Installed (unknown version)"
		return res
	}
	if major < minMajor || (major == minMajor && minor < minMinor) {
		res.status = checkWarn
		res.message = fmt.Sprintf("%s installed — please upgrade to %d.%d+", versionStr, minMajor, minMinor)
		return res
	}
	res.status, res.message = checkOK, fmt.Sprintf("%s installed", versionStr)
	return res
}

func checkGit() checkResult {
	res := checkResult{label: "Git", wingetID: "Git.Git", required: true}
	if _, err := exec.LookPath("git"); err != nil {
		res.status, res.message = checkFail, "Not installed — needed to fetch plugins"
		return res
	}
	out, _ := exec.Command("git", "--version").Output()
	res.status, res.message = checkOK, strings.TrimSpace(string(out))
	return res
}

func checkPowerShell() checkResult {
	res := checkResult{label: "PowerShell", required: true, wingetID: "Microsoft.PowerShell"}
	if bin, err := exec.LookPath("pwsh"); err == nil {
		out, _ := exec.Command(bin, "-NoProfile", "-Command", "$PSVersionTable.PSVersion.ToString()").Output()
		res.status, res.message = checkOK, "pwsh "+strings.TrimSpace(string(out))
		return res
	}
	if _, err := exec.LookPath("powershell"); err == nil {
		res.status = checkWarn
		res.message = "Windows PowerShell 5 found — pwsh 7+ recommended"
		return res
	}
	res.status, res.message = checkFail, "Not installed"
	return res
}

func checkDotNet() checkResult {
	res := checkResult{label: ".NET SDK", wingetID: "Microsoft.DotNet.SDK.9", required: false}
	bin, err := exec.LookPath("dotnet")
	if err != nil {
		res.status, res.message = checkWarn, "Not installed — required for C# / Roslyn LSP"
		return res
	}
	out, err := exec.Command(bin, "--list-sdks").Output()
	if err != nil {
		res.status, res.message = checkWarn, "dotnet found but no SDKs reported"
		return res
	}
	lines := strings.Split(strings.TrimSpace(string(out)), "\n")
	if len(lines) == 0 || lines[0] == "" {
		res.status, res.message = checkWarn, "dotnet runtime present but no SDK installed"
		return res
	}
	res.status, res.message = checkOK, fmt.Sprintf("%d SDK(s) installed", len(lines))
	return res
}

func checkNode() checkResult {
	res := checkResult{label: "Node.js", wingetID: "OpenJS.NodeJS.LTS", required: false}
	if bin, err := exec.LookPath("node"); err == nil {
		out, _ := exec.Command(bin, "--version").Output()
		res.status, res.message = checkOK, "Node "+strings.TrimSpace(string(out))
		return res
	}
	res.status, res.message = checkWarn, "Not installed — needed for some LSPs (typescript, yaml, json)"
	return res
}

func checkPython() checkResult {
	res := checkResult{label: "Python 3", wingetID: "Python.Python.3.12", required: false}
	for _, name := range []string{"python", "python3"} {
		if bin, err := exec.LookPath(name); err == nil {
			out, _ := exec.Command(bin, "--version").Output()
			res.status, res.message = checkOK, strings.TrimSpace(string(out))
			return res
		}
	}
	res.status, res.message = checkWarn, "Not installed — required by some Mason tools"
	return res
}

func checkRipgrep() checkResult {
	res := checkResult{label: "Ripgrep", wingetID: "BurntSushi.ripgrep.MSVC", required: true}
	if bin, err := exec.LookPath("rg"); err == nil {
		out, _ := exec.Command(bin, "--version").Output()
		head := strings.SplitN(strings.TrimSpace(string(out)), "\n", 2)[0]
		res.status, res.message = checkOK, head
		return res
	}
	res.status, res.message = checkFail, "Not installed — required by telescope live_grep & todo-comments"
	return res
}

func checkLazygit() checkResult {
	res := checkResult{label: "Lazygit", wingetID: "JesseDuffield.Lazygit", required: false}
	if _, err := exec.LookPath("lazygit"); err == nil {
		out, _ := exec.Command("lazygit", "--version").Output()
		head := strings.SplitN(strings.TrimSpace(string(out)), "\n", 2)[0]
		res.status, res.message = checkOK, head
		return res
	}
	res.status, res.message = checkWarn, "Not installed — Ctrl+L (LazyGit) will not work"
	return res
}

func checkGCC() checkResult {
	res := checkResult{label: "C compiler", wingetID: "MSYS2.MSYS2", required: false}
	for _, name := range []string{"gcc", "clang", "cl"} {
		if _, err := exec.LookPath(name); err == nil {
			res.status, res.message = checkOK, name+" found on PATH"
			return res
		}
	}
	res.status, res.message = checkWarn, "Not installed — treesitter parsers may fail to build"
	return res
}

func checkNetCoreDbg() checkResult {
	res := checkResult{label: "netcoredbg (DAP)", required: false}
	if _, err := exec.LookPath("netcoredbg"); err == nil {
		res.status, res.message = checkOK, "On PATH"
		return res
	}
	// Try the conventional install location used by lua/plugins/lsp/nvim-dap.lua
	if fileExists(`C:\Tools\netcoredbg\netcoredbg.exe`) {
		res.status, res.message = checkOK, `Found at C:\Tools\netcoredbg`
		return res
	}
	res.status, res.message = checkWarn, "Not installed — needed only for C# debugging"
	return res
}

func checkNerdFont() checkResult {
	res := checkResult{label: "Nerd Font", required: false}
	out, err := exec.Command("reg", "query",
		`HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Fonts`).Output()
	if err != nil {
		out, _ = exec.Command("reg", "query",
			`HKCU\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Fonts`).Output()
	} else {
		extra, _ := exec.Command("reg", "query",
			`HKCU\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Fonts`).Output()
		out = append(out, extra...)
	}
	fontList := strings.ToLower(string(out))
	strict := regexp.MustCompile(`nerd|jetbrainsmono\s*nf|fira\s*code|cascadia\s*code`)
	if strict.MatchString(fontList) {
		res.status, res.message = checkOK, "Nerd Font detected"
		return res
	}
	res.status, res.message = checkWarn, "No Nerd Font detected — icons will render as boxes"
	return res
}

// ── helpers ──────────────────────────────────────────────────────────────────

func parseSemver(s, pattern string) (int, int) {
	re := regexp.MustCompile(pattern)
	m := re.FindStringSubmatch(s)
	if len(m) < 3 {
		return 0, 0
	}
	maj, _ := strconv.Atoi(m[1])
	min, _ := strconv.Atoi(m[2])
	return maj, min
}

// missingInstallable returns checks that failed or warned AND have a winget id.
func missingInstallable(checks []checkResult) []checkResult {
	out := []checkResult{}
	for _, c := range checks {
		if c.wingetID == "" {
			continue
		}
		if c.status == checkFail || c.status == checkWarn {
			out = append(out, c)
		}
	}
	return out
}

// hasBlockingFailure reports whether any required check failed.
func hasBlockingFailure(checks []checkResult) bool {
	for _, c := range checks {
		if c.required && c.status == checkFail {
			return true
		}
	}
	return false
}

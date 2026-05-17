package main

import "github.com/charmbracelet/lipgloss"

// Palette mirrors lua/config/theme.lua so the installer and the editor share
// the same look-and-feel.
var (
	cBg     = lipgloss.Color("#0d1117")
	cBgAlt  = lipgloss.Color("#161b22")
	cFg     = lipgloss.Color("#c9d1d9")
	cMuted  = lipgloss.Color("#6e7681")
	cGreen  = lipgloss.Color("#3fb950")
	cBlue   = lipgloss.Color("#58a6ff")
	cOrange = lipgloss.Color("#e8912d")
	cRed    = lipgloss.Color("#ff7b72")
	cYellow = lipgloss.Color("#d29922")
	cBorder = lipgloss.Color("#c9d1d9") // pleasant white border on dark bg
	cAccent = lipgloss.Color("#e6edf3")
)

// sty is a thin helper for inline coloured text.
func sty(c lipgloss.Color) lipgloss.Style { return lipgloss.NewStyle().Foreground(c) }

// box renders a rounded panel using the shared border colour.
func box(width int, lines ...string) string {
	inner := lipgloss.JoinVertical(lipgloss.Left, lines...)
	return lipgloss.NewStyle().
		Border(lipgloss.RoundedBorder()).
		BorderForeground(cBorder).
		Background(cBg).
		Padding(1, 3).
		Width(width).
		Render(inner)
}

const asciiTitle = `
 ███╗   ██╗██╗   ██╗██╗███╗   ███╗    ███████╗███████╗████████╗██╗   ██╗██████╗
 ████╗  ██║██║   ██║██║████╗ ████║    ██╔════╝██╔════╝╚══██╔══╝██║   ██║██╔══██╗
 ██╔██╗ ██║██║   ██║██║██╔████╔██║    ███████╗█████╗     ██║   ██║   ██║██████╔╝
 ██║╚██╗██║╚██╗ ██╔╝██║██║╚██╔╝██║    ╚════██║██╔══╝     ██║   ██║   ██║██╔═══╝
 ██║ ╚████║ ╚████╔╝ ██║██║ ╚═╝ ██║    ███████║███████╗   ██║   ╚██████╔╝██║
 ╚═╝  ╚═══╝  ╚═══╝  ╚═╝╚═╝     ╚═╝    ╚══════╝╚══════╝   ╚═╝    ╚═════╝ ╚═╝`

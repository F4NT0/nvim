--[[ ============================================================================
SHARED COLOUR PALETTE
============================================================================
Single source of truth for every colour used across the configuration.
Plugins import this module instead of hard-coding hex values, so changing
the theme everywhere is a one-line edit.

Palette: GitHub Dark inspired, easy on the eyes for long sessions.
============================================================================ ]]

return {
  -- Backgrounds
  bg          = "#0d1117",   -- primary background (replaces the old blue #101329)
  bg_alt      = "#161b22",   -- elevated surfaces (popups, statusline, sidebar)
  bg_float    = "#0d1117",   -- floating windows
  bg_selected = "#1f6feb22", -- subtle highlight for selected items

  -- Foregrounds
  fg          = "#c9d1d9",   -- primary text — also used as the "pleasant white" border
  fg_strong   = "#e6edf3",   -- titles, focused elements
  fg_muted    = "#6e7681",   -- comments, hints, inactive

  -- Borders (pleasant white tones for all plugins)
  border         = "#c9d1d9", -- main border colour: bright but never harsh on dark bg
  border_muted   = "#30363d", -- subtle separators (statusline divider, etc.)

  -- Semantic accents
  green       = "#3fb950",   -- success, additions, "ok"
  blue        = "#58a6ff",   -- info, links, focus
  orange      = "#e8912d",   -- warnings, prompts
  red         = "#ff7b72",   -- errors, deletions
  yellow      = "#d29922",   -- caution, modifications
  purple      = "#bc8cff",   -- C# / .NET accent
  cyan        = "#39c5cf",   -- hints, types

  -- Git statuses (gitsigns / neo-tree)
  git_added    = "#3fb950",
  git_modified = "#d29922",
  git_deleted  = "#ff7b72",
  git_renamed  = "#58a6ff",
  git_untracked = "#bc8cff",
}

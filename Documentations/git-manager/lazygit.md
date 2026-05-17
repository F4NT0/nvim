# lazygit.nvim

Embeds the `lazygit` TUI inside a Neovim floating window.

## Overview

`lazygit.nvim` is a thin wrapper around the [`lazygit`](https://github.com/jesseduffield/lazygit) TUI. It opens lazygit in a floating window (90% of the screen, rounded borders) so the full staging / committing / branching workflow is one keystroke away. The Go installer in this repository checks whether `lazygit` is on PATH and offers to install it automatically.

## Repository

<https://github.com/kdheepak/lazygit.nvim>

## Requirements

- `lazygit` on PATH (`winget install JesseDuffield.Lazygit` or `choco install lazygit`).
- `plenary.nvim` (declared as a dependency).

## Commands

- `:LazyGit` — open lazygit at the cwd.
- `:LazyGitCurrentFile` — open lazygit at the repo containing the current file.
- `:LazyGitConfig` — open lazygit's config file.
- `:LazyGitFilter` — open the lazygit log filter.
- `:LazyGitFilterCurrentFile` — log filter for the current file.

## Keymaps

| Shortcut | Action | Notes |
| --- | --- | --- |
| `<C-l>` | Open lazygit in a floating window | Plugin-local |

## Tips

- Lazygit has its own contextual help: press `?` inside the TUI to see every binding.
- The dashboard also exposes lazygit through the `Ctrl + L` entry.

> Source: lua/plugins/git-manager/lazygit.lua

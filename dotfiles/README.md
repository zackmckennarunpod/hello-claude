# Dotfiles

Minimal, opinionated configs for terminal-based AI agent workflows.

## What's Included

| File | Purpose |
|------|---------|
| `.tmux.conf` | Tmux config with vim-style bindings, Ctrl+A prefix |
| `.config/ghostty/config` | Ghostty terminal settings |
| `.config/karabiner/karabiner.json` | Caps Lock → Escape/Ctrl (optional) |

## Quick Install

```bash
./dotfiles/install.sh
```

With Karabiner keyboard customization:
```bash
./dotfiles/install.sh --with-karabiner
```

## Key Bindings

### Tmux (prefix = Ctrl+A)

| Action | Keys |
|--------|------|
| Split horizontal | `Ctrl+A` then `-` |
| Split vertical | `Ctrl+A` then `\|` |
| Navigate panes | `Ctrl+h/j/k/l` |
| Resize panes | `Ctrl+A` then `H/J/K/L` |
| Zoom pane | `Ctrl+A` then `m` |
| New window | `Ctrl+A` then `c` |
| Reload config | `Ctrl+A` then `r` |
| Session picker | `Ctrl+A` then `s` |
| LazyGit | `Ctrl+A` then `g` |

### Karabiner (optional)

| Action | Keys |
|--------|------|
| Escape | Tap `Caps Lock` |
| Control | Hold `Caps Lock` |
| Tmux prefix | `Caps Lock + A` |

With Karabiner, `Caps Lock + A` becomes `Ctrl+A` which is the tmux prefix. So:
- `Caps Lock + A`, then `|` = vertical split
- `Caps Lock + A`, then `-` = horizontal split

## Customization

These are starter configs. Fork and modify to your liking:

- **Change tmux prefix**: Edit `.tmux.conf` line 3
- **Change Ghostty theme**: Edit `.config/ghostty/config`
- **Disable Karabiner rules**: Remove rules from `karabiner.json`

## Dependencies

- tmux 3.0+
- Ghostty (or use your preferred terminal)
- Karabiner-Elements (optional, macOS only)
- JetBrainsMono Nerd Font (for icons)

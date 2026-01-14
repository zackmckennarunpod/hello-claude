#!/bin/bash
# Dotfiles installer for lazy-agent
# Symlinks configs to appropriate locations

set -e

DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

echo "Installing dotfiles from $DOTFILES_DIR"

# --- tmux ---
if [ -f ~/.tmux.conf ]; then
    echo "  Backing up existing ~/.tmux.conf to ~/.tmux.conf.backup"
    mv ~/.tmux.conf ~/.tmux.conf.backup
fi
ln -sf "$DOTFILES_DIR/.tmux.conf" ~/.tmux.conf
echo "  Linked ~/.tmux.conf"

# --- Ghostty ---
mkdir -p ~/.config/ghostty
if [ -f ~/.config/ghostty/config ]; then
    echo "  Backing up existing Ghostty config"
    mv ~/.config/ghostty/config ~/.config/ghostty/config.backup
fi
ln -sf "$DOTFILES_DIR/.config/ghostty/config" ~/.config/ghostty/config
echo "  Linked ~/.config/ghostty/config"

# --- Karabiner (optional) ---
if [ "$1" = "--with-karabiner" ] || [ "$INSTALL_KARABINER" = "true" ]; then
    mkdir -p ~/.config/karabiner
    if [ -f ~/.config/karabiner/karabiner.json ]; then
        echo "  Backing up existing Karabiner config"
        mv ~/.config/karabiner/karabiner.json ~/.config/karabiner/karabiner.json.backup
    fi
    ln -sf "$DOTFILES_DIR/.config/karabiner/karabiner.json" ~/.config/karabiner/karabiner.json
    echo "  Linked ~/.config/karabiner/karabiner.json"
else
    echo "  Skipping Karabiner (use --with-karabiner to include)"
fi

# --- TPM (Tmux Plugin Manager) ---
if [ ! -d ~/.tmux/plugins/tpm ]; then
    echo "  Installing TPM (Tmux Plugin Manager)..."
    git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
    echo "  TPM installed. Run 'prefix + I' in tmux to install plugins."
else
    echo "  TPM already installed"
fi

echo ""
echo "Done! Restart your terminal or run:"
echo "  tmux source ~/.tmux.conf"
echo ""
echo "Note: Tmux prefix is Ctrl+A (not Ctrl+B)"

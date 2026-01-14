#!/bin/bash
# Lazy Agent - Interactive Setup
# Run this instead of manually editing config.json

set -e

# Colors
GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

echo ""
echo -e "${BLUE}╔═══════════════════════════════════════╗${NC}"
echo -e "${BLUE}║      ${GREEN}Lazy Agent Setup Wizard${BLUE}          ║${NC}"
echo -e "${BLUE}╚═══════════════════════════════════════╝${NC}"
echo ""

# Check if gum is installed for pretty prompts
if command -v gum &> /dev/null; then
    USE_GUM=true
else
    USE_GUM=false
    echo -e "${YELLOW}Tip: Install 'gum' for a prettier experience: brew install gum${NC}"
    echo ""
fi

# Helper function for prompts
prompt() {
    local question="$1"
    local default="$2"

    if [ "$USE_GUM" = true ]; then
        gum input --placeholder "$default" --prompt "$question "
    else
        read -p "$question [$default]: " answer
        echo "${answer:-$default}"
    fi
}

confirm() {
    local question="$1"

    if [ "$USE_GUM" = true ]; then
        gum confirm "$question" && echo "true" || echo "false"
    else
        read -p "$question [y/N]: " answer
        [[ "$answer" =~ ^[Yy] ]] && echo "true" || echo "false"
    fi
}

choose() {
    local question="$1"
    shift
    local options=("$@")

    if [ "$USE_GUM" = true ]; then
        echo "$question" >&2
        printf '%s\n' "${options[@]}" | gum choose
    else
        echo "$question"
        select opt in "${options[@]}"; do
            echo "$opt"
            break
        done
    fi
}

# Gather info
echo "Let's personalize your setup..."
echo ""

NAME=$(prompt "What's your name?" "Developer")
ROLE=$(choose "What's your role?" "engineering" "product" "design" "leadership")

echo ""
echo "Which optional tools do you want?"
echo ""

INSTALL_GASTOWN=$(confirm "Install Gastown (multi-agent workspaces)?")
INSTALL_BEADS=$(confirm "Install Beads (git-backed issue tracking)?")
INSTALL_PLAYWRIGHT=$(confirm "Install Playwright (browser automation)?")
INSTALL_KARABINER=$(confirm "Install Karabiner (Caps Lock → Escape/Ctrl)?")
INSTALL_GCALCLI=$(confirm "Install gcalcli (Google Calendar CLI)?")
INSTALL_POWERTOOLS=$(confirm "Install terminal power tools (fzf, bat, eza)?")

# Generate config.json
echo ""
echo -e "${GREEN}Generating config.json...${NC}"

cat > config.json << EOF
{
  "user": {
    "name": "$NAME",
    "role": "$ROLE"
  },
  "dotfiles": {
    "use_included": true,
    "install_karabiner": $INSTALL_KARABINER
  },
  "setup": {
    "skip_steps": [],
    "optional_tools": {
      "gastown": $INSTALL_GASTOWN,
      "beads": $INSTALL_BEADS,
      "linear_mcp": true,
      "notion_mcp": true,
      "playwright": $INSTALL_PLAYWRIGHT,
      "gcalcli": $INSTALL_GCALCLI,
      "terminal_power_tools": $INSTALL_POWERTOOLS
    }
  },
  "preferences": {
    "shell": "zsh",
    "editor": "neovim",
    "theme": "dark"
  }
}
EOF

echo -e "${GREEN}Created config.json${NC}"
echo ""

# Ask about installing dotfiles now
if [ "$(confirm "Install dotfiles now?")" = "true" ]; then
    if [ "$INSTALL_KARABINER" = "true" ]; then
        ./dotfiles/install.sh --with-karabiner
    else
        ./dotfiles/install.sh
    fi
fi

echo ""
echo -e "${GREEN}Setup complete!${NC}"
echo ""
echo "Next steps:"
echo "  1. Run: claude"
echo "  2. Say: help me get started"
echo ""
echo "Claude will guide you through the rest of the setup."

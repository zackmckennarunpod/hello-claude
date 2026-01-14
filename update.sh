#!/bin/bash
# Lazy Agent - Update Script
# Pull latest changes and update configs

set -e

GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
NC='\033[0m'

echo ""
echo -e "${BLUE}╔═══════════════════════════════════════╗${NC}"
echo -e "${BLUE}║      ${GREEN}Lazy Agent Update${BLUE}                ║${NC}"
echo -e "${BLUE}╚═══════════════════════════════════════╝${NC}"
echo ""

# Check if we're in a git repo
if [ ! -d .git ]; then
    echo -e "${RED}Error: Not in a git repository${NC}"
    echo "Please run this from the lazy-agent directory"
    exit 1
fi

# Store current branch
CURRENT_BRANCH=$(git rev-parse --abbrev-ref HEAD)

# Check for local changes
if ! git diff-index --quiet HEAD --; then
    echo -e "${YELLOW}Warning: You have local changes${NC}"
    echo "Stashing them before update..."
    git stash
    STASHED=true
else
    STASHED=false
fi

# Fetch latest
echo "Fetching latest changes..."
git fetch origin

# Check if we're on main or need to switch
if [ "$CURRENT_BRANCH" != "main" ]; then
    echo -e "${YELLOW}You're on branch '$CURRENT_BRANCH'${NC}"
    read -p "Switch to main for updates? [y/N]: " switch
    if [[ "$switch" =~ ^[Yy] ]]; then
        git checkout main
    fi
fi

# Pull latest
echo "Pulling latest..."
git pull origin main

# Show what changed
echo ""
echo -e "${GREEN}Changes pulled:${NC}"
git log --oneline -5

# Re-apply dotfiles if they changed
if git diff --name-only HEAD~1 | grep -q "^dotfiles/"; then
    echo ""
    echo -e "${YELLOW}Dotfiles were updated!${NC}"
    read -p "Re-install dotfiles? [y/N]: " reinstall
    if [[ "$reinstall" =~ ^[Yy] ]]; then
        if [ -f config.json ] && grep -q '"install_karabiner": true' config.json; then
            ./dotfiles/install.sh --with-karabiner
        else
            ./dotfiles/install.sh
        fi
    fi
fi

# Restore stashed changes
if [ "$STASHED" = true ]; then
    echo ""
    echo "Restoring your local changes..."
    git stash pop
fi

echo ""
echo -e "${GREEN}Update complete!${NC}"
echo ""
echo "What's new:"
echo "  - Check README.md for any new features"
echo "  - Run 'claude' and ask about new capabilities"

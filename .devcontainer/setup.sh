#!/bin/bash

echo "========================================="
echo "  Setting up test environment"
echo "========================================="

# Install system dependencies
sudo apt-get update
sudo apt-get install -y tmux zsh golang-go

# Install Claude Code
echo "Installing Claude Code..."
npm install -g @anthropic-ai/claude-code

# Install Gastown
echo "Installing Gastown..."
go install github.com/steveyegge/gastown/cmd/gt@latest
echo 'export PATH="$HOME/go/bin:$PATH"' >> ~/.bashrc
export PATH="$HOME/go/bin:$PATH"

# Install Beads
echo "Installing Beads..."
go install github.com/steveyegge/beads/cmd/bd@latest

# Install Playwright
echo "Installing Playwright..."
npm install -g playwright
npx playwright install chromium --with-deps 2>/dev/null || echo "Playwright browsers: install manually if needed"

# Install dotfiles from this repo
echo "Installing dotfiles..."
if [ -f "./dotfiles/install.sh" ]; then
    ./dotfiles/install.sh
else
    echo "Dotfiles not found in current directory"
fi

# Note: MCP servers (Linear, Notion) use OAuth and are added via:
#   claude mcp add --transport http linear https://mcp.linear.app/mcp --scope user
#   claude mcp add --transport http notion https://mcp.notion.com/mcp --scope user

echo ""
echo "========================================="
echo "  Ready to test!"
echo "========================================="
echo ""
echo "Installed:"
echo "  - tmux, zsh"
echo "  - Claude Code"
echo "  - Gastown (gt)"
echo "  - Beads (bd)"
echo "  - Playwright"
echo "  - Dotfiles (tmux, ghostty)"
echo ""
echo "MCP servers (run in Claude Code):"
echo "  claude mcp add --transport http linear https://mcp.linear.app/mcp --scope user"
echo "  claude mcp add --transport http notion https://mcp.notion.com/mcp --scope user"
echo ""
echo "Run: claude"
echo "Then say: help me get started"
echo ""

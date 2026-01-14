# Tools Reference & Troubleshooting Links

Quick reference for all tools in this setup with documentation and troubleshooting resources.

---

## Ghostty (Terminal Emulator)

- **Website**: https://ghostty.org
- **Documentation**: https://ghostty.org/docs
- **GitHub**: https://github.com/ghostty-org/ghostty
- **Config Reference**: https://ghostty.org/docs/config
- **Discord**: https://discord.gg/ghostty

### Installation
```bash
brew install --cask ghostty
```

### Config Location
```
~/.config/ghostty/config
```

### Common Issues
- **Font not rendering**: Install Nerd Font: `brew install --cask font-jetbrains-mono-nerd-font`
- **Colors wrong**: Check `theme = dark` in config
- **Slow startup**: Disable unused features in config

---

## Homebrew (Package Manager)

- **Website**: https://brew.sh
- **Documentation**: https://docs.brew.sh
- **Troubleshooting**: https://docs.brew.sh/Troubleshooting
- **FAQ**: https://docs.brew.sh/FAQ

### Installation
```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

### Common Issues
- **Command not found**: Add to PATH: `eval "$(/opt/homebrew/bin/brew shellenv)"`
- **Permission errors**: `sudo chown -R $(whoami) /opt/homebrew`
- **Outdated**: `brew update && brew upgrade`

---

## Oh My Zsh (Shell Framework)

- **Website**: https://ohmyz.sh
- **GitHub**: https://github.com/ohmyzsh/ohmyzsh
- **Wiki**: https://github.com/ohmyzsh/ohmyzsh/wiki
- **Plugins List**: https://github.com/ohmyzsh/ohmyzsh/wiki/Plugins
- **Themes**: https://github.com/ohmyzsh/ohmyzsh/wiki/Themes

### Installation
```bash
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

### Config Location
```
~/.zshrc
~/.oh-my-zsh/
```

### Common Issues
- **Slow startup**: Too many plugins, reduce in `.zshrc`
- **Plugin not found**: Install to `~/.oh-my-zsh/custom/plugins/`
- **Compinit errors**: `rm ~/.zcompdump*` then restart terminal

---

## Powerlevel10k (Prompt Theme)

- **GitHub**: https://github.com/romkatv/powerlevel10k
- **Configuration Wizard**: Run `p10k configure`
- **Troubleshooting**: https://github.com/romkatv/powerlevel10k#troubleshooting
- **FAQ**: https://github.com/romkatv/powerlevel10k#faq

### Installation
```bash
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
```

### Config Location
```
~/.p10k.zsh
```

### Common Issues
- **Icons not showing**: Install Nerd Font and configure terminal to use it
- **Prompt slow in git repos**: `git config --global oh-my-zsh.hide-dirty 1`
- **Reconfigure**: `p10k configure`

---

## tmux (Terminal Multiplexer)

- **GitHub**: https://github.com/tmux/tmux
- **Wiki**: https://github.com/tmux/tmux/wiki
- **Man Page**: `man tmux`
- **Cheat Sheet**: https://tmuxcheatsheet.com
- **Getting Started**: https://github.com/tmux/tmux/wiki/Getting-Started

### Installation
```bash
brew install tmux
```

### Config Location
```
~/.tmux.conf
```

### Common Issues
- **Colors wrong**: Add `set -g default-terminal "tmux-256color"` to config
- **Keys not working**: Reload config: `tmux source-file ~/.tmux.conf`
- **Mouse not working**: Add `set -g mouse on` to config
- **Ctrl+h/j/k/l not working**: Check vim-tmux-navigator or config bindings

---

## Claude Code (AI Assistant)

- **Documentation**: https://docs.anthropic.com/en/docs/claude-code
- **GitHub**: https://github.com/anthropics/claude-code
- **Getting Started**: https://docs.anthropic.com/en/docs/claude-code/getting-started
- **Configuration**: https://docs.anthropic.com/en/docs/claude-code/configuration
- **MCP Servers**: https://docs.anthropic.com/en/docs/claude-code/mcp

### Installation
```bash
npm install -g @anthropic-ai/claude-code
```

### Config Location
```
~/.config/claude-code/settings.json
~/.claude/CLAUDE.md (global instructions)
./CLAUDE.md (project instructions)
```

### Common Issues
- **Not authenticated**: Run `claude` and follow auth prompts
- **MCP not working**: Restart Claude after config changes
- **Permission denied**: Check file permissions in project

---

## Gastown (Multi-Agent Workspaces)

- **GitHub**: https://github.com/steveyegge/gastown
- **README**: https://github.com/steveyegge/gastown#readme
- **Issues**: https://github.com/steveyegge/gastown/issues

### Installation
```bash
# Homebrew
brew tap steveyegge/gastown
brew install gt

# Or Go
go install github.com/steveyegge/gastown/cmd/gt@latest
```

### Common Issues
- **Command not found**: Add `~/go/bin` to PATH
- **Config errors**: Check `.gt/` directory in project
- **Version mismatch**: `go install github.com/steveyegge/gastown/cmd/gt@latest`

---

## Beads (Git-Backed Issue Tracker)

- **GitHub**: https://github.com/steveyegge/beads
- **README**: https://github.com/steveyegge/beads#readme
- **Issues**: https://github.com/steveyegge/beads/issues

### Installation
```bash
# Homebrew
brew install steveyegge/beads/bd

# Or Go
go install github.com/steveyegge/beads/cmd/bd@latest

# Or npm
npm install -g @beads/bd
```

### Config Location
```
.beads/ (in project root)
```

### Common Issues
- **Sync failing**: Check `LINEAR_API_KEY` environment variable
- **Init errors**: Make sure you're in a git repository
- **Permission errors**: Check Linear API key scopes

---

## Linear (Project Management)

- **Website**: https://linear.app
- **Documentation**: https://linear.app/docs
- **API Docs**: https://developers.linear.app/docs
- **API Reference**: https://developers.linear.app/docs/graphql/working-with-the-graphql-api

### API Key Setup
1. Go to https://linear.app/settings/api
2. Create Personal API Key
3. Set `LINEAR_API_KEY` environment variable

### Common Issues
- **API errors**: Check key has correct scopes
- **Rate limiting**: Linear has rate limits, wait and retry
- **Workspace access**: Ensure key is for correct workspace

---

## Linear MCP Server

- **Official MCP**: https://mcp.linear.app/mcp
- **MCP Docs**: https://docs.anthropic.com/en/docs/claude-code/mcp

### Installation (OAuth - Recommended)
```bash
claude mcp add --transport http linear https://mcp.linear.app/mcp --scope user
```

### Authentication
1. In Claude Code, type `/mcp`
2. Select Linear
3. Complete browser OAuth flow

### Verify
```bash
claude mcp list
```

### Common Issues
- **Not recognized**: Restart Claude Code after config changes
- **Auth required**: Use `/mcp` in Claude Code to authenticate
- **Re-authenticate**: `claude mcp remove linear` then add again

---

## Notion (Knowledge Base)

- **Website**: https://notion.so
- **API Docs**: https://developers.notion.com
- **API Reference**: https://developers.notion.com/reference

---

## Notion MCP Server

- **Official MCP**: https://mcp.notion.com/mcp
- **MCP Docs**: https://docs.anthropic.com/en/docs/claude-code/mcp

### Installation (OAuth - Recommended)

> **Note**: The API key approach requires workspace admin access to create integrations.
> OAuth works for everyone and is the recommended approach.

```bash
claude mcp add --transport http notion https://mcp.notion.com/mcp --scope user
```

### Authentication
1. In Claude Code, type `/mcp`
2. Select Notion
3. Complete browser OAuth flow
4. Grant access to pages you want Claude to see

### Verify
```bash
claude mcp list
```

### Common Issues
- **Not recognized**: Restart Claude Code after config changes
- **Auth required**: Use `/mcp` in Claude Code to authenticate
- **Re-authenticate**: `claude mcp remove notion` then add again
- **Can't see pages**: OAuth only grants access to pages you explicitly approve

---

## Playwright (Browser Automation)

- **Website**: https://playwright.dev
- **Documentation**: https://playwright.dev/docs/intro
- **CLI Reference**: https://playwright.dev/docs/cli
- **API Reference**: https://playwright.dev/docs/api/class-playwright
- **GitHub**: https://github.com/microsoft/playwright
- **Troubleshooting**: https://playwright.dev/docs/troubleshooting

### Installation
```bash
npm install -g playwright
npx playwright install
```

### Common Issues
- **Browser not found**: `npx playwright install chromium`
- **Linux deps missing**: `npx playwright install-deps`
- **Timeout errors**: Increase timeout in config
- **Headless issues**: Try `--headed` flag for debugging

---

## Node.js & npm

- **Website**: https://nodejs.org
- **Documentation**: https://nodejs.org/docs
- **npm Docs**: https://docs.npmjs.com

### Installation (via Homebrew)
```bash
brew install node
```

### Common Issues
- **Permission errors**: Don't use sudo with npm, fix with: `npm config set prefix ~/.npm-global`
- **Version issues**: Use nvm: https://github.com/nvm-sh/nvm
- **Cache issues**: `npm cache clean --force`

---

## Go

- **Website**: https://go.dev
- **Documentation**: https://go.dev/doc
- **Install Guide**: https://go.dev/doc/install

### Installation
```bash
brew install go
```

### Config
```bash
# Add to ~/.zshrc
export GOPATH="$HOME/go"
export PATH="$GOPATH/bin:$PATH"
```

### Common Issues
- **Command not found after go install**: Add `~/go/bin` to PATH
- **Module errors**: `go mod tidy`

---

## Git

- **Website**: https://git-scm.com
- **Documentation**: https://git-scm.com/doc
- **Book**: https://git-scm.com/book/en/v2
- **Reference**: https://git-scm.com/docs

### Common Issues
- **Auth failures**: Set up SSH keys or credential helper
- **Merge conflicts**: `git mergetool` or resolve manually
- **Undo last commit**: `git reset --soft HEAD~1`

---

## Nerd Fonts (Terminal Icons)

- **Website**: https://www.nerdfonts.com
- **GitHub**: https://github.com/ryanoasis/nerd-fonts
- **Cheat Sheet**: https://www.nerdfonts.com/cheat-sheet

### Installation
```bash
brew install --cask font-jetbrains-mono-nerd-font
```

### Common Issues
- **Icons not showing**: Configure terminal to use the Nerd Font
- **Wrong glyphs**: Font might be outdated, reinstall

---

## Environment Variables

Store sensitive keys in `~/.zshrc.local`:

```bash
# Anthropic (if needed for API access)
export ANTHROPIC_API_KEY="sk-ant-xxxxx"

# Linear API Key (only needed for Beads sync, not MCP)
export LINEAR_API_KEY="lin_api_xxxxx"
```

Then: `source ~/.zshrc`

> **Note**: Linear and Notion MCPs use browser OAuth - no API keys needed!
> The LINEAR_API_KEY is only required for Beads' `bd linear sync` feature.

---

## Quick Diagnostic Commands

```bash
# Check all tools are installed
which brew git zsh tmux claude gt bd npx

# Check versions
brew --version
git --version
tmux -V
claude --version
gt --version
bd --version
node --version
npm --version
go version
npx playwright --version

# Check MCP servers
claude mcp list

# Check PATH
echo $PATH
```

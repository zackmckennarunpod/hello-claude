# Step 8: Linear, Beads, and MCP Tools

## Overview

This step sets up:
- **Linear** - Project management and issue tracking
- **Beads** - Git-backed issue tracker that syncs with Linear
- **Linear MCP** - Claude Code integration with Linear
- **Notion MCP** - Claude Code integration with Notion

## Part 1: Beads (Git-Backed Issue Tracking)

Beads (`bd`) is a git-backed issue tracker that syncs with Linear. Issues live in your repo and sync bidirectionally.

### Install Beads

```bash
# Option 1: Homebrew (recommended)
brew install steveyegge/beads/bd

# Option 2: npm
npm install -g @beads/bd

# Option 3: Go
go install github.com/steveyegge/beads/cmd/bd@latest
```

### Verify Installation

```bash
bd --version
```

### Initialize in a Project

```bash
cd your-project
bd init
```

This creates a `.beads/` directory for tracking issues.

### Basic Beads Commands

| Command | Description |
|---------|-------------|
| `bd list` | List all issues |
| `bd create` | Create a new issue |
| `bd show ISSUE-ID` | Show issue details |
| `bd update ISSUE-ID` | Update an issue |
| `bd sync` | Sync with Linear |

## Part 2: Linear Sync Setup

### Get Linear API Key

1. Go to Linear: https://linear.app
2. Settings → API → Personal API keys
3. Create a new key with appropriate scopes
4. Save the key securely

### Configure Beads for Linear Sync

```bash
# Set your Linear API key
export LINEAR_API_KEY="lin_api_xxxxx"

# Or add to your ~/.zshrc.local
echo 'export LINEAR_API_KEY="your-key-here"' >> ~/.zshrc.local
```

### Sync with Linear

```bash
# Initial sync (pulls issues from Linear)
bd sync

# Push local issues to Linear
bd sync --push
```

## Part 3: MCP Tools for Claude Code

MCP (Model Context Protocol) tools extend Claude Code to interact with external services.

Use the `claude mcp add` CLI command to configure MCP servers. Configuration is stored in `~/.claude.json`.

### Add Linear MCP

Linear's official MCP uses browser OAuth - no API key needed!

```bash
# Add Linear MCP globally (available in all projects)
claude mcp add --transport http linear https://mcp.linear.app/mcp --scope user
```

### Add Notion MCP

Notion's official MCP also uses browser OAuth - no API key or integration setup needed!

```bash
# Add Notion MCP globally (available in all projects)
claude mcp add --transport http notion https://mcp.notion.com/mcp --scope user
```

### Verify MCP Servers

```bash
claude mcp list
```

You should see:
```
linear: https://mcp.linear.app/mcp (HTTP) - ✓ Connected
notion: https://mcp.notion.com/mcp (HTTP) - ⚠ Needs authentication
```

### Authenticate MCP Servers

For servers showing "Needs authentication":

1. Start a new Claude Code session: `claude`
2. Type `/mcp` to open the MCP authentication menu
3. Follow the browser prompts to log in

### MCP Scopes

| Scope | Flag | Config Location | Use Case |
|-------|------|-----------------|----------|
| User | `--scope user` | `~/.claude.json` | Available in all projects |
| Project | `--scope project` | `.mcp.json` in project root | Shared with team via git |
| Local | (default) | `~/.claude.json` (per-project) | Only this project, not shared |

## Part 4: Using the Integrations

### With Claude Code + Linear MCP

```
> show me my Linear issues

> create a new issue in Linear: "Add dark mode to settings page"

> update issue LIN-123 to In Progress
```

### With Claude Code + Notion MCP

```
> search my Notion for "project roadmap"

> update the Notion page "Sprint Planning" with today's notes
```

### With Beads

```
> /beads list

> /beads create "Fix login bug"

> /beads sync
```

## Verification Checklist

- [ ] `bd --version` works
- [ ] `bd init` in a test project succeeds
- [ ] `claude mcp list` shows Linear and Notion
- [ ] Linear shows "Connected" or authenticated via `/mcp`
- [ ] Notion shows "Connected" or authenticated via `/mcp`
- [ ] `bd sync` connects to Linear (if you have access)

## Troubleshooting

### MCP tools not working?

1. Verify servers are configured: `claude mcp list`
2. Start a fresh Claude Code session
3. Authenticate via `/mcp` if needed

### Beads sync failing?

1. Check API key: `echo $LINEAR_API_KEY`
2. Verify you have access to the Linear workspace
3. Run `bd sync --verbose` for detailed output

### Permission errors?

Make sure your API keys have the right scopes:
- Linear: Read/write issues, comments
- Notion: Read/write content for shared pages

## Next Steps

With these tools configured, Claude Code can:
- Read and update your Linear issues
- Access your Notion workspace
- Keep local issues synced via Beads

This creates a powerful workflow where AI assistance is integrated with your project management.

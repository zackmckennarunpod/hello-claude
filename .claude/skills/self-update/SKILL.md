# Self-Update Skill

Audit and update the lazy-agent repository to ensure all documentation, install instructions, and configurations follow current best practices.

---

## Overview

This skill performs a comprehensive audit of the lazy-agent repo:
1. Checks all referenced tool versions against current releases
2. Verifies install commands are still valid
3. Ensures documentation is accurate
4. Suggests or applies updates as needed

---

## Step 1: Environment Check

Say: "Starting lazy-agent repository audit. First, let me check the current environment..."

```bash
echo "=== System Info ==="
sw_vers 2>/dev/null || cat /etc/os-release 2>/dev/null || echo "Unknown OS"
echo ""
echo "=== Currently Installed Versions ==="
echo -n "Homebrew: " && brew --version 2>/dev/null | head -1 || echo "Not installed"
echo -n "Git: " && git --version 2>/dev/null || echo "Not installed"
echo -n "Node.js: " && node --version 2>/dev/null || echo "Not installed"
echo -n "npm: " && npm --version 2>/dev/null || echo "Not installed"
echo -n "Claude Code: " && claude --version 2>/dev/null || echo "Not installed"
echo -n "tmux: " && tmux -V 2>/dev/null || echo "Not installed"
echo -n "Neovim: " && nvim --version 2>/dev/null | head -1 || echo "Not installed"
echo -n "fzf: " && fzf --version 2>/dev/null || echo "Not installed"
echo -n "bat: " && bat --version 2>/dev/null | head -1 || echo "Not installed"
echo -n "eza: " && eza --version 2>/dev/null | head -1 || echo "Not installed"
echo -n "zoxide: " && zoxide --version 2>/dev/null || echo "Not installed"
echo -n "glow: " && glow --version 2>/dev/null || echo "Not installed"
echo -n "lazygit: " && lazygit --version 2>/dev/null | head -1 || echo "Not installed"
echo -n "gh: " && gh --version 2>/dev/null | head -1 || echo "Not installed"
echo -n "gcalcli: " && gcalcli --version 2>/dev/null || echo "Not installed"
echo -n "Go: " && go version 2>/dev/null || echo "Not installed"
```

---

## Step 2: Check Latest Versions

Say: "Now checking what the latest versions are..."

```bash
echo "=== Latest Homebrew Package Info ==="
for pkg in tmux neovim fzf bat eza zoxide glow lazygit gh gcalcli; do
    info=$(brew info $pkg 2>/dev/null | head -1)
    if [ -n "$info" ]; then
        echo "$pkg: $info"
    fi
done
```

For Claude Code, check npm:
```bash
echo ""
echo "=== Claude Code (npm) ==="
npm view @anthropic-ai/claude-code version 2>/dev/null || echo "Could not fetch"
```

---

## Step 3: Audit Step Files

Say: "Auditing the step-by-step guides in the `steps/` directory..."

For each step file, I will:
1. Read the file
2. Check if installation commands are still valid
3. Verify URLs are accessible
4. Flag any outdated version references

```bash
echo "=== Step Files ==="
ls -la steps/*.md 2>/dev/null || echo "No step files found"
```

**Audit each file:**

### steps/01-prerequisites.md
Check:
- Homebrew install command is current
- Git installation method

### steps/02-ghostty.md
Check:
- Ghostty download URL works
- Installation steps are accurate

### steps/03-zsh-and-p10k.md
Check:
- Oh My Zsh install script URL
- Powerlevel10k repo URL
- Font installation URLs

### steps/04-tmux.md
Check:
- tmux install command
- TPM (Tmux Plugin Manager) repo URL
- tmux-resurrect and tmux-continuum repos

### steps/05-claude-code.md
Check:
- npm install command
- Any API references

---

## Step 4: Audit Skills

Say: "Auditing all skills for accuracy and best practices..."

```bash
echo "=== Skills ==="
for skill in .claude/skills/*/SKILL.md; do
    echo "Checking: $skill"
done
```

For each skill, verify:
- [ ] Has clear description
- [ ] Steps are numbered
- [ ] Commands are valid
- [ ] Asks for confirmation before destructive actions
- [ ] Has troubleshooting section (for complex skills)

---

## Step 5: Audit Dotfiles

Say: "Checking dotfiles for compatibility and best practices..."

```bash
echo "=== Dotfiles ==="
ls -la dotfiles/
```

### .tmux.conf
Check:
- Plugin URLs are valid
- Key bindings are documented
- No deprecated options

### Ghostty config
Check:
- Config format is current
- Theme references exist

### Karabiner config
Check:
- JSON schema is valid
- Rules use current Karabiner format

---

## Step 6: URL Validation

Say: "Validating all external URLs referenced in the repo..."

```bash
# Extract URLs from markdown files
echo "=== URLs Found ==="
grep -roh 'https://[^)]*' steps/ .claude/skills/ README.md CLAUDE.md 2>/dev/null | sort -u | head -30
```

For each URL, attempt to verify it's still accessible:
- GitHub repos: Check they exist
- Documentation links: Verify they load
- Download links: Confirm they work

---

## Step 7: Generate Report

Say: "Generating audit report..."

Create a summary:

```markdown
# Lazy-Agent Audit Report

**Date:** [Current date]
**Audited by:** Claude Code self-update skill

## Summary

### Tools Status
| Tool | Documented Version | Current Version | Status |
|------|-------------------|-----------------|--------|
| tmux | X.X | Y.Y | ✓/⚠️/✗ |
| ... | ... | ... | ... |

### Step Files
| File | Status | Issues |
|------|--------|--------|
| 01-prerequisites.md | ✓ | None |
| ... | ... | ... |

### Skills
| Skill | Status | Issues |
|-------|--------|--------|
| onboard | ✓ | None |
| ... | ... | ... |

### Broken URLs
- [URL] - [Status]

### Recommendations
1. [Recommendation 1]
2. [Recommendation 2]
```

---

## Step 8: Apply Updates

Ask: "I've completed the audit. Would you like me to:"

1. **Show report only** - Just display findings, make no changes
2. **Fix automatically** - Update version numbers, fix URLs, apply best practices
3. **Interactive mode** - Go through each issue and ask what to do

**If they choose automatic or interactive:**

For each issue found:
1. Explain what needs to change
2. Show the diff
3. Apply the change (or ask first in interactive mode)
4. Verify the change works

---

## Step 9: Commit Changes (Optional)

If changes were made:

Ask: "Changes have been applied. Would you like me to commit them?"

If yes:
```bash
git add -A
git status
```

Say: "Here's what will be committed. Creating commit..."

```bash
git commit -m "chore: update repo via self-update audit

- Updated version references
- Fixed broken URLs
- Applied best practice improvements

Audited by: /self-update skill"
```

---

## Best Practices Checklist

This skill ensures the repo follows these best practices:

### Documentation
- [ ] All install commands are tested and working
- [ ] Version numbers are current or generic
- [ ] URLs are accessible
- [ ] Steps are clear and sequential
- [ ] Troubleshooting sections exist for complex setups

### Skills
- [ ] Each skill has a clear purpose statement
- [ ] Destructive actions require confirmation
- [ ] Skills are self-contained (don't assume context)
- [ ] Error handling is included

### Dotfiles
- [ ] Configs are well-commented
- [ ] No hardcoded paths that won't work for others
- [ ] Backup/restore instructions exist
- [ ] Sensible defaults with customization options

### Security
- [ ] No secrets or API keys in repo
- [ ] Dangerous operations are gated
- [ ] Gastown has appropriate warnings
- [ ] User consent required for system modifications

---

## Scheduling Regular Audits

Say: "Consider running `/self-update` periodically to keep this repo current. Tool versions change frequently!"

Suggested frequency:
- Monthly for version checks
- After major tool releases (new tmux, new Claude Code, etc.)
- When issues are reported
- Before sharing with new team members

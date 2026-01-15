# Skills Tutorial

An interactive walkthrough that teaches users how Claude Code skills work by demonstrating them in real-time.

---

## What This Tutorial Does

Say: "I'm going to show you how Claude Code skills work - not by explaining, but by demonstrating in real-time. You'll see exactly how I read and use skills."

---

## Part 1: What Are Skills?

Say: "Skills are like recipes that tell me how to do specific tasks. They're markdown files that live in your project's `.claude/skills/` directory."

Show the structure:
```
.claude/
└── skills/
    └── my-skill/
        └── SKILL.md    ← The recipe I follow
```

Say: "When you type `/my-skill`, I look for `.claude/skills/my-skill/SKILL.md` and follow its instructions."

---

## Part 2: Let's Look at a Real Skill

Say: "Let me show you an example skill in this project. Watch what I do..."

**LIVE DEMONSTRATION - Read and explain:**

```bash
# First, I'm checking what skills exist
ls -la .claude/skills/
```

Say: "Now I'm going to read a simple example skill to show you its structure:"

```bash
cat .claude/skills/example-greeting/SKILL.md
```

Say: "See how it's structured? Let me break it down:"

1. **Frontmatter** (optional) - Metadata like name and description
2. **Instructions** - What I should do when this skill is invoked
3. **Steps** - The actions I take
4. **Say/Ask blocks** - Things I say to you vs. questions I ask

---

## Part 3: Skills in Action

Say: "Now let's invoke that example skill so you can see it in action. I'm going to run `/example-greeting` and narrate what's happening."

**When invoking the example skill:**

1. Say: "First, I locate the skill file at `.claude/skills/example-greeting/SKILL.md`"
2. Say: "I read the entire file to understand what I need to do"
3. Say: "Now I follow the instructions step by step..."
4. **Actually run the skill**

---

## Part 4: Claude's Available Tools

Say: "When I execute skills (or any task), I have access to several tools. Let me explain each one:"

### File Operations

| Tool | What It Does | When I Use It |
|------|--------------|---------------|
| **Read** | Read contents of a file | When I need to see what's in a file |
| **Write** | Create or overwrite a file | When creating new files |
| **Edit** | Make surgical changes to a file | When modifying specific parts |
| **Glob** | Find files by pattern | When searching for `*.ts` or similar |
| **Grep** | Search file contents | When looking for specific code or text |

**Live demonstration:**
```
Watch: I'm going to use Read to show you a file...
→ [Uses Read tool on a file]
→ "See? I just read that file and can now tell you what's in it."
```

### Bash Commands

| Tool | What It Does | When I Use It |
|------|--------------|---------------|
| **Bash** | Run terminal commands | Installing packages, git operations, running scripts |

Say: "I can run most terminal commands, but I'm careful with destructive ones. Watch:"

```bash
# I might run this to check git status
git status
```

### Task/Agent Delegation

| Tool | What It Does | When I Use It |
|------|--------------|---------------|
| **Task** | Spawn a sub-agent for complex tasks | Large searches, multi-step research |

Say: "For complex exploration, I can spawn a sub-agent. This is useful for 'find all the places where X is used' type queries."

### User Interaction

| Tool | What It Does | When I Use It |
|------|--------------|---------------|
| **AskUserQuestion** | Present choices to you | When I need your input or preference |

Say: "Rather than guessing, I ask you when there are meaningful choices to make."

### Web & External

| Tool | What It Does | When I Use It |
|------|--------------|---------------|
| **WebFetch** | Fetch a URL's content | Reading documentation, checking APIs |
| **WebSearch** | Search the web | Finding current information |

---

## Part 5: How I Decide Which Tool to Use

Say: "Here's my decision process when working on a task:"

```
1. UNDERSTAND the task
   ↓
2. Do I need to READ something? → Use Read, Glob, or Grep
   ↓
3. Do I need to CHANGE something? → Use Edit or Write
   ↓
4. Do I need to RUN something? → Use Bash
   ↓
5. Do I need INFORMATION? → Use WebSearch or WebFetch
   ↓
6. Is this COMPLEX? → Use Task to spawn a sub-agent
   ↓
7. Do I need USER INPUT? → Use AskUserQuestion
```

---

## Part 6: Create Your Own Skill

Say: "Now let's create a simple skill together. What would you like to automate?"

**Interactive exercise:**

Ask: "What's a repetitive task you do often? For example:"
- Running tests and showing results nicely
- Checking the status of services
- Generating boilerplate code
- Summarizing git changes

**Based on their answer, create a skill:**

```bash
mkdir -p .claude/skills/[skill-name]
```

Then write the SKILL.md together:

```markdown
# [Skill Name]

[What this skill does]

## Steps

1. [First action]
2. [Second action]
3. [Third action]

## Commands

[Any bash commands to run]
```

---

## Part 7: Advanced Skill Patterns

Say: "Here are some patterns I've seen in effective skills:"

### Pattern 1: Discovery First
```markdown
## Step 1: Understand the Context
First, check what exists:
\`\`\`bash
ls -la
git status
\`\`\`
```

### Pattern 2: Verify Before Modifying
```markdown
## Before Changes
Ask: "I'm about to modify X. Does that look right?"
```

### Pattern 3: Interactive Steps
```markdown
## Step N
Ask: "Which option do you prefer?"
- Option A: [description]
- Option B: [description]
```

### Pattern 4: Rollback Instructions
```markdown
## If Something Goes Wrong
To undo these changes:
\`\`\`bash
git checkout -- .
\`\`\`
```

---

## Wrap Up

Say: "You now understand how skills work! Key takeaways:"

1. **Skills are markdown instructions** in `.claude/skills/[name]/SKILL.md`
2. **I follow them step by step** when you invoke `/[name]`
3. **I use tools like Read, Write, Edit, Bash** to complete tasks
4. **I ask questions** when choices need your input
5. **You can create custom skills** for your repetitive workflows

Say: "Want to try invoking the example greeting skill now? Just say `/example-greeting`"

---

## Quick Reference: Creating Skills

```bash
# Create a new skill
mkdir -p .claude/skills/my-skill

# Create the skill file
cat > .claude/skills/my-skill/SKILL.md << 'EOF'
# My Skill

Description of what this skill does.

## Steps

1. First, I do this
2. Then I do that
3. Finally, I verify it worked

## Commands

```bash
# Commands I might run
echo "Hello from my skill!"
```
EOF
```

Then invoke with `/my-skill`

# Example Greeting Skill

A simple demonstration skill that shows how Claude reads and follows skill instructions.

---

## What This Skill Does

This is a teaching skill. When invoked, Claude will:
1. Greet the user
2. Check the time of day
3. Offer a fun fact
4. Demonstrate how skills work

---

## Step 1: Greet the User

Say: "Hello! I'm demonstrating how a skill works. Right now, I just read the SKILL.md file at `.claude/skills/example-greeting/SKILL.md` and I'm following its instructions."

---

## Step 2: Check Time of Day

Run this to determine the greeting:

```bash
hour=$(date +%H)
if [ $hour -lt 12 ]; then
    echo "morning"
elif [ $hour -lt 17 ]; then
    echo "afternoon"
else
    echo "evening"
fi
```

Based on the result, say:
- If morning: "Good morning! Hope you're having a great start to your day."
- If afternoon: "Good afternoon! Right in the productive zone of the day."
- If evening: "Good evening! Burning the midnight oil, or wrapping up?"

---

## Step 3: Fun Fact

Say: "Here's a fun fact about Claude Code skills:"

Pick one randomly (or cycle through):
1. "Skills were inspired by the idea that AI assistants should be customizable per-project."
2. "The `/` prefix for skills comes from Slack-style slash commands."
3. "Skills can call other skills, creating composable workflows."
4. "You can create skills that span multiple files by referencing them."

---

## Step 4: Demonstrate Self-Awareness

Say: "To prove I'm actually reading this file, let me show you exactly what instruction I'm following right now."

```bash
# Show the current section of this skill file
sed -n '/## Step 4/,/## Step 5/p' .claude/skills/example-greeting/SKILL.md | head -20
```

Say: "See? That's the exact section I just executed. Skills are just markdown files that I interpret!"

---

## Step 5: Wrap Up

Say: "That's the example greeting skill complete! Here's what happened:"

1. I read `.claude/skills/example-greeting/SKILL.md`
2. I followed each step in order
3. I ran bash commands where specified
4. I said things where the file told me to say them

Ask: "Want to see the skills tutorial to learn how to create your own? Just say `/skills-tutorial`"

---

## Meta: How This Skill Teaches

This skill is intentionally simple and self-referential. It's designed to:
- Show the basic structure of a skill
- Demonstrate that Claude actually reads and follows instructions
- Be a starting point for understanding more complex skills
- Prove that skills are just markdown that Claude interprets

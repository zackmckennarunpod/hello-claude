# Karabiner-Elements Setup

Configure Caps Lock as Escape (tap) and Control (hold) - a quality-of-life improvement for terminal power users.

**Time estimate: 3-5 minutes**
**Status: RECOMMENDED but COMPLETELY OPTIONAL**

---

## The Problem Karabiner Solves

Say: "Let me explain why some developers swear by Karabiner, and why others skip it entirely."

### The Ergonomic Challenge

**Without Karabiner, here's what you're doing:**

1. **Escape key** - Way up in the top-left corner of your keyboard
   - In vim: You press Escape *constantly* to exit insert mode
   - Your hand leaves the home row every single time
   - Over a day of coding, that's hundreds of reaches

2. **Control key** - Bottom-left corner, requires pinky stretch
   - tmux prefix is `Ctrl+B` by default (we changed it to `Ctrl+A`, but still...)
   - Every tmux command: Stretch pinky to Ctrl, then press A, then the action
   - Common shortcuts like `Ctrl+C`, `Ctrl+D` all require that awkward pinky stretch

3. **Caps Lock key** - Prime real estate, rarely used
   - Sits right next to your home row on the left
   - Most people accidentally hit it and get STUCK IN CAPS
   - It's basically wasted keyboard space

### The Karabiner Solution

**With Karabiner, Caps Lock becomes a dual-purpose key:**

| Action | What You Press | What Happens |
|--------|----------------|--------------|
| Exit vim insert mode | Tap Caps Lock | Sends Escape |
| tmux prefix | Hold Caps Lock + A | Sends Ctrl+A |
| Cancel command | Hold Caps Lock + C | Sends Ctrl+C |
| Any Ctrl combo | Hold Caps Lock + key | Sends Ctrl+key |

**Your hands never leave the home row.**

---

## Who Should Use This?

### Karabiner is GREAT if you:
- Use vim/neovim regularly (Escape all the time)
- Use tmux daily (Ctrl+A prefix constantly)
- Care about ergonomics and RSI prevention
- Like the idea of "one key, two functions"

### Skip Karabiner if you:
- Don't use vim (Escape isn't a big deal for you)
- Rarely use tmux (occasional Ctrl+A is fine)
- Have muscle memory for default key positions
- Use a keyboard with Ctrl in a comfortable position
- Prefer to keep your system configs minimal

Ask: "Does this sound useful to you? It's completely optional - many developers work perfectly fine with default key positions."

**If they say no or seem unsure:** "No problem! You can always set this up later by asking me to 'set up karabiner'. Let's move on."

**If they say yes:** Continue below.

---

## Understanding the Key Mappings

Before we install, let me explain exactly what changes:

### Caps Lock Behavior

```
BEFORE (default):
┌─────────────┐
│  Caps Lock  │  →  TOGGLES CAPS LOCK (annoying)
└─────────────┘

AFTER (with Karabiner):
┌─────────────┐
│  Caps Lock  │  →  TAP: Escape | HOLD: Control
└─────────────┘
```

### Real Examples

**Exiting vim insert mode:**
```
BEFORE: Reach up to Escape key (leaves home row)
AFTER:  Tap Caps Lock (finger stays on home row)
```

**tmux: Split pane vertically:**
```
BEFORE: Stretch pinky to Ctrl + tap A, release, tap |
AFTER:  Hold Caps Lock + tap A, release, tap |
        (Caps Lock is RIGHT THERE next to A)
```

**Cancel a running command:**
```
BEFORE: Ctrl+C (pinky stretch)
AFTER:  Caps Lock+C (no stretch)
```

---

## Step 1: Install Karabiner

```bash
brew install --cask karabiner-elements
```

Ask: "Did it install? You might need to enter your password."

---

## Step 2: Grant Permissions

Say: "Open Karabiner-Elements from Applications (or Spotlight: Cmd+Space, type 'karabiner')."

Say: "macOS will ask for permissions. You need to:"
1. Go to **System Settings** → **Privacy & Security** → **Input Monitoring**
2. Enable **Karabiner-Elements** and **karabiner_grabber**
3. You may also need to allow it in **Accessibility**

Say: "You might need to restart Karabiner after granting permissions."

Ask: "Is Karabiner running? You should see a keyboard icon in your menu bar."

---

## Step 3: Install Our Config

Say: "Now let's install the config that sets up Caps Lock magic:"

```bash
./dotfiles/install.sh --with-karabiner
```

Or manually:
```bash
mkdir -p ~/.config/karabiner
cp "$(pwd)/dotfiles/.config/karabiner/karabiner.json" ~/.config/karabiner/karabiner.json
```

---

## Step 4: Test It Out

### Test 1: Caps Lock as Escape

Say: "Let's test! Open a file in vim:"

```bash
vim /tmp/test.txt
```

Say: "Press `i` to enter insert mode, type 'hello', then **tap Caps Lock quickly**."

Ask: "Did it exit insert mode? The cursor should change and you can't type anymore."

Say: "Type `:q!` and Enter to quit without saving."

### Test 2: Caps Lock as Control

Say: "Now hold Caps Lock and tap C in your terminal."

Ask: "Did it act like Ctrl+C? (Should show ^C or cancel)"

### Test 3: tmux Prefix (the real magic)

Say: "Start a tmux session:"

```bash
tmux new -s karabiner-test
```

Say: "Now try this sequence:"
1. Hold Caps Lock, tap A, release everything
2. Tap the `|` key

Ask: "Did you get a vertical split? That's the Caps Lock magic working!"

Say: "Exit with: Hold Caps Lock + A, then tap `d` to detach."

---

## Success!

Say: "You're all set! Here's your new keyboard superpowers:"

```
┌────────────────────────────────────────────────────┐
│  CAPS LOCK KEY                                      │
│                                                     │
│  TAP (quick press):     Sends ESCAPE               │
│  HOLD + other key:      Sends CTRL + that key      │
│                                                     │
│  Examples:                                          │
│  • Tap Caps Lock        → Escape (vim exit insert) │
│  • Caps Lock + A        → Ctrl+A (tmux prefix)     │
│  • Caps Lock + C        → Ctrl+C (cancel)          │
│  • Caps Lock + D        → Ctrl+D (EOF/logout)      │
│  • Caps Lock + Z        → Ctrl+Z (suspend)         │
└────────────────────────────────────────────────────┘
```

Say: "Give it a few days - the muscle memory kicks in fast, and then you'll wonder how you ever lived without it!"

---

## Troubleshooting

### Caps Lock not working?

1. Check Karabiner is running (menu bar icon should be visible)
2. Verify permissions in System Settings → Privacy & Security
3. Try quitting and reopening Karabiner from the menu bar
4. Check the Karabiner-Elements app → "Log" tab for errors

### Want to customize the mappings?

Open Karabiner-Elements → Complex Modifications tab. Our config adds:
- Caps Lock → Escape (tap) / Control (hold)

You can add more rules from the online library or edit the JSON directly.

### Want to disable it completely?

```bash
rm ~/.config/karabiner/karabiner.json
# Then quit Karabiner-Elements from the menu bar
```

Or just uncheck the rules in Karabiner-Elements preferences.

---

## Alternatives to Karabiner

If you don't want to install Karabiner but still want better ergonomics:

| Alternative | Pros | Cons |
|-------------|------|------|
| **macOS System Settings** | No extra software | Can only swap Caps Lock → Ctrl OR Escape, not both |
| **Keyboard with better layout** | Hardware solution | Costs money, not portable |
| **Just use defaults** | No setup required | More hand movement, potential RSI |
| **Remap in vim only** | Targeted fix | Only helps vim, not tmux/terminal |

To swap Caps Lock → Ctrl in macOS without Karabiner:
- System Settings → Keyboard → Keyboard Shortcuts → Modifier Keys
- Change Caps Lock to Control

(But you lose the tap-for-Escape feature)

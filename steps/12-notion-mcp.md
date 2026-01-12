# Step 12: Notion MCP [RECOMMENDED]

> **This step takes ~5 minutes.**
> 
> If the user's team uses Notion, this is highly recommended. Claude can then read and search Notion pages directly.
>
> Ask: "Does your team use Notion? Would you like to set up Notion integration so I can search and read your docs?"

## What is Notion MCP?

MCP (Model Context Protocol) lets Claude Code interact with Notion directly:
- Search your Notion workspace
- Read page contents
- Find documentation quickly

---

## Interactive Setup Walkthrough

Walk through these steps one at a time, waiting for confirmation.

### Step 1: Open Notion Integrations

Go to: https://www.notion.so/my-integrations

You should see "My integrations" page. Let me know when you're there.

### Step 2: Create New Integration

1. Click **"+ New integration"** button
2. You'll see a form to configure your integration

Let me know when you see the form.

### Step 3: Fill In Integration Details

Fill in these fields:

| Field | Value |
|-------|-------|
| **Name** | `Claude Code` |
| **Associated workspace** | Select your workspace (e.g., RunPod) |
| **Type** | Keep as "Internal" |
| **Logo** | Optional - skip it |

Click **"Submit"**

Let me know when you see the integration created.

### Step 4: Copy Your API Secret

After creating, you'll see your integration's settings page.

1. Look for **"Internal Integration Secret"** (or "API Key")
2. It starts with `secret_`
3. Click **"Show"** then **"Copy"**

**Save this somewhere safe** - you'll need it in a moment.

Got the secret copied? Let me know.

### Step 5: Set Capabilities (Important!)

On the same page, scroll down to **"Capabilities"**:

| Capability | Setting |
|------------|---------|
| **Read content** | ✅ Enabled |
| **Update content** | ❌ Disabled (optional) |
| **Insert content** | ❌ Disabled (optional) |
| **Read comments** | Optional |
| **Read user info** | Optional |

Click **"Save changes"** if you made any changes.

### Step 6: Share Pages with Integration

**Important:** Your integration can only see pages you explicitly share with it.

1. Open a Notion page you want Claude to access (e.g., your team's documentation)
2. Click the **"..."** menu (top right corner)
3. Click **"Add connections"** or **"Connections"**
4. Search for **"Claude Code"** (your integration name)
5. Click to add it

Repeat for other important pages. 

**Pro tip:** Share a top-level page (like "Engineering Wiki") and all sub-pages automatically get access.

Let me know when you've shared at least one page.

### Step 7: Install Notion MCP Server

Run:
```bash
npm install -g @anthropic/mcp-server-notion
```

Verify:
```bash
which mcp-server-notion
```

Let me know when installed.

### Step 8: Add API Key to Environment

Add to your `~/.zshrc.local`:
```bash
export NOTION_API_KEY="secret_xxxxx"
```

Replace `secret_xxxxx` with your actual secret.

Then reload:
```bash
source ~/.zshrc
```

Verify it's set:
```bash
echo $NOTION_API_KEY
```

Should show your secret. Let me know when done.

### Step 9: Configure Claude Code

Create or edit `~/.config/claude-code/settings.json`:

```bash
mkdir -p ~/.config/claude-code
```

Add this configuration:
```json
{
  "mcpServers": {
    "notion": {
      "command": "mcp-server-notion",
      "env": {
        "NOTION_API_KEY": "${NOTION_API_KEY}"
      }
    }
  }
}
```

Or if the file already exists with other MCP servers, add the notion section to the existing mcpServers object.

### Step 10: Restart Claude Code

Quit Claude Code completely and restart it for the MCP to load.

```bash
# Exit current session
exit

# Start fresh
claude
```

### Step 11: Test It!

Try asking:
```
> search Notion for "onboarding"
```

or

```
> what pages do I have access to in Notion?
```

If it works, you'll see Notion results!

---

## Troubleshooting

### "Cannot access page"
- You need to share the page with your integration (Step 6)
- Go to the page → "..." → "Connections" → Add "Claude Code"

### "Integration not found" 
- Check your API key is correct in `~/.zshrc.local`
- Run `echo $NOTION_API_KEY` to verify

### "MCP not loaded"
- Restart Claude Code completely
- Check `~/.config/claude-code/settings.json` is valid JSON

### "No results found"
- Make sure pages are shared with the integration
- Try searching for a specific page title you know exists

---

## What You Can Do Now

- **Search**: "Find the API documentation in Notion"
- **Read**: "What does the architecture doc say about auth?"
- **Summarize**: "Summarize the PRD for feature X"
- **Reference**: "Based on our Notion docs, how do we deploy?"

---

## Links

- Notion Integrations: https://www.notion.so/my-integrations
- Notion API Docs: https://developers.notion.com
- MCP Docs: https://docs.anthropic.com/en/docs/claude-code/mcp

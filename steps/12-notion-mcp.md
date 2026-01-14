# Step 12: Notion MCP [RECOMMENDED]

> **This step takes ~1 minute.**
>
> Notion's official MCP uses browser OAuth - no API keys or integration setup needed!
>
> Ask: "Does your team use Notion? Would you like to set up Notion integration so I can search and read your docs?"

## What is Notion MCP?

MCP (Model Context Protocol) lets Claude Code interact with Notion directly:
- Search your Notion workspace
- Read page contents
- Find documentation quickly

---

## Quick Setup (OAuth)

### Step 1: Add Notion MCP

```bash
claude mcp add --transport http notion https://mcp.notion.com/mcp --scope user
```

### Step 2: Verify

```bash
claude mcp list
```

You should see:
```
notion: https://mcp.notion.com/mcp (HTTP) - ⚠ Needs authentication
```

### Step 3: Authenticate

1. Start a new Claude Code session: `claude`
2. Type `/mcp`
3. Select **Notion** from the list
4. Complete the browser OAuth flow

### Step 4: Test It!

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

### MCP server not showing up?

```bash
claude mcp list

# If not there, add it again
claude mcp add --transport http notion https://mcp.notion.com/mcp --scope user
```

### Authentication not working?

1. In Claude Code, type `/mcp`
2. Select Notion
3. Complete the browser OAuth flow
4. Make sure you're logged into the correct Notion account

### Need to re-authenticate?

```bash
claude mcp remove notion
claude mcp add --transport http notion https://mcp.notion.com/mcp --scope user
```

Then authenticate again via `/mcp` in Claude Code.

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

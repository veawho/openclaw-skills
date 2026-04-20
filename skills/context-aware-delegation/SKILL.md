---
name: context-aware-delegation
description: Give isolated sessions (cron jobs, sub-agents, event handlers) full conversation context from your main session using sessions_history. Run cheap background tasks (Haiku) with expensive context (Sonnet-level awareness) — best of both worlds.
description_zh: Give isolted sessions （cron jobs, 子智能体s, event h和lers） full 对话 上下文 from your min session using sessions_hist或y. Run chep bckground 任务s （Hiku） 使用 expensive 上下文 （Sonnet-level wreness） — best of both w或lds.。
homepage: https://gitlab.com/rgba_research/context-aware-delegation
author: RGBA Research
metadata:
  {
    "openclaw":
      {
        "emoji": "🔗",
        "requires": { "tools": ["sessions_list", "sessions_history"] },
      },
  }
---

# Context-Aware Delegation


## 中文说明

### 简介

context-aware-delegation - Give isolated sessions (cron jobs, sub-agents, event handlers) full conversation context from your main session using sessions_history. Run cheap background tasks (Haiku) with expensive context (Sonnet-level awareness) — best of both worlds.

### 使用方法

此 Skill 已安装到 `/home/node/.openclaw/workspace/skills/context-aware-delegation/`

1. 查看 SKILL.md 了解详细用法
2. 如有 scripts/run.sh，可直接运行
3. 参照 Examples 章节中的命令进行操作

### 适用场景

- 请参考 ## When to Use 章节
- 如有疑问，请查看 ## Troubleshooting 章节

### 快速开始

```bash
# 查看帮助
cd /home/node/.openclaw/workspace/skills/context-aware-delegation
cat SKILL.md

# 运行（如有脚本）
./scripts/run.sh
```

### 注意事项

- 请确保已安装所需依赖
- 建议先阅读 ## Setup 或 ## Installation 章节
- 详细配置说明见 ## Configuration 章节
## (aka "SmartBeat")

**Problem:** Isolated sessions (cron jobs, sub-agents) can't see your main session conversation history. They're cheap (use Haiku) but blind to context.

**Solution:** Use `sessions_history` to give isolated sessions full awareness of what happened in your main chat — at a fraction of the cost of running everything in main session.

## Quick Start

### Morning Report Example

You want a daily report that includes "what we accomplished last night" — but running that in main session with Sonnet costs ~$0.30/report. Using an isolated session with Haiku costs ~$0.03, but can't see conversation history.

**Solution:** Isolated session queries main session history first.

```javascript
// Inside your cron payload.message:
"1. Query main session history: sessions_history('agent:main:telegram:direct:{userId}', limit=50)
2. Read memory files: memory/YYYY-MM-DD.md
3. Fetch weather for Austin 78721
4. Generate report combining:
   - Recent conversation highlights
   - Memory file summaries
   - Current conditions
5. Send via Telegram + email"
```

**Cost:** ~$0.03 with Haiku (10x cheaper than Sonnet main session)
**Context:** Full awareness of overnight work

## Pattern Overview

### 1. Identify Main Session Key

```bash
# List sessions to find main
sessions_list(limit=10)
# Typical main session key format:
# agent:main:telegram:direct:{userId}
# agent:main:main
```

### 2. Query History from Isolated Session

```javascript
// In cron job, sub-agent, or event handler:
sessions_history({
  sessionKey: "agent:main:telegram:direct:8264585335",
  limit: 50  // Last 50 messages
})
```

Returns conversation history even though you're in an isolated session.

### 3. Use Context + Execute Task

Your isolated session now has:
- ✅ Conversation history (what was discussed)
- ✅ Memory files (persistent notes)
- ✅ Cheap model (Haiku)
- ✅ Full tool access

## Use Cases

### Cron Jobs with Context

**Morning reports:**
```bash
Schedule: 8 AM daily
Model: Haiku (~$0.03/run)
Task: Read overnight work, check email, send summary
Context: Last 50 messages from main session
```

**End-of-day summaries:**
```bash
Schedule: 9 PM daily
Model: Haiku
Task: What got done today? What's pending?
Context: Today's full conversation
```

**Periodic check-ins:**
```bash
Schedule: Every 2 hours (9 AM - 9 PM)
Model: Haiku
Task: Anything urgent in email/calendar?
Context: Recent discussion about priorities
```

### Sub-Agent Delegation

**Background builds:**
```javascript
sessions_spawn({
  task: "Build the AREF product page based on our discussion",
  model: "haiku",
  // In the task prompt:
  // "First, query main session history to see our conversation about AREF requirements..."
})
```

**Research tasks:**
```javascript
sessions_spawn({
  task: "Research Unreal Engine integration patterns. Reference our earlier discussion about AREF goals.",
  model: "haiku"
})
```

### Event-Driven Handlers

**Webhook arrives → isolated session handles it:**
```javascript
// Webhook payload triggers isolated session
// Session logic:
"1. Query main session to see: what did J and I agree about this client?
2. Process webhook based on that context
3. Take action or notify"
```

## Cost Comparison

| Approach | Model | Context | Cost/Run | When to Use |
|----------|-------|---------|----------|-------------|
| Main session | Sonnet | Full | ~$0.30 | Complex interactive work |
| Isolated (blind) | Haiku | None | ~$0.03 | Simple scheduled tasks |
| **Context-aware delegation** | **Haiku** | **Full** | **~$0.03** | **Background tasks needing context** |

**Savings:** ~10x cheaper than main session, with same context awareness.

## Implementation Tips

### Finding Your Main Session Key

```javascript
sessions_list({ kinds: ["main"], limit: 5 })
// Or:
sessions_list({ limit: 10 })
// Look for: agent:main:telegram:direct:{yourUserId}
```

### How Much History?

- **10 messages:** Just recent context (~2KB)
- **50 messages:** Last few hours of work (~10KB)
- **100 messages:** Full day or multi-session context (~20KB)

Start with 50, adjust based on needs.

### Combining History + Memory

Best results come from:
1. **Sessions history:** Recent interactive work
2. **Memory files:** Persistent decisions/notes

```javascript
"1. sessions_history(limit=30) → what we discussed today
2. read memory/2026-02-13.md → decisions logged
3. Combine both sources for complete picture"
```

## Morning Report Recipe

Complete example for daily morning report:

**Cron Job Setup:**
```javascript
{
  schedule: { kind: "cron", expr: "0 8 * * *", tz: "America/Chicago" },
  sessionTarget: "isolated",
  payload: {
    kind: "agentTurn",
    model: "haiku",
    message: `Generate morning report:

1. Query main session: sessions_history('agent:main:telegram:direct:8264585335', limit=50)
2. Read yesterday's memory: memory/YYYY-MM-DD.md
3. Get weather: Austin 78721
4. Check email (gog or himalaya)
5. Check calendar events for today

Report format:
📍 WEATHER: [conditions]
🌙 OVERNIGHT: [from session history - what we worked on]
📝 PERSISTENT NOTES: [from memory file]
📧 EMAIL: [urgent only]
📅 CALENDAR: [today's events]
🔗 DASHBOARD: [mission control link]

Send to Telegram using message tool.

Note: Email delivery from isolated sessions requires SMTP credentials or is better handled via main session heartbeats for reliability.`
  },
  delivery: { mode: "announce", to: "8264585335", channel: "telegram" }
}
```

**Cost:** ~$0.03/report (~$1/month)
**Context:** Full overnight work awareness
**Timing:** Exact (8 AM every day)

## Limitations

**History truncation:**
- `sessions_history` returns limited content (typically last N messages)
- Very long messages may be truncated
- For deep archives, rely on memory files

**Main session must exist:**
- If main session is brand new (no messages), history is empty
- Isolated sessions can't create main session history, only read it

**Not real-time:**
- History reflects state when queried
- If main session is actively running, very latest messages might not appear immediately

## Best Practices

**1. Write good memory summaries**
Even with session history access, persistent memory files are gold. Don't rely solely on conversation history.

**2. Query only what you need**
`limit=10` for quick context, `limit=50` for substantial work, `limit=100` for deep dives.

**3. Chain tools effectively**
```javascript
sessions_history → memory_get → web_search → message
```
Context first, then action.

**4. Use Haiku for delegation, Sonnet for decisions**
- Isolated background work: Haiku
- Interactive problem-solving: Sonnet
- Morning reports/summaries: Haiku
- Architecture discussions: Sonnet

## Troubleshooting

**"Empty session history"**
- Check session key is correct: `sessions_list()`
- Main session might be new (no messages yet)
- Use `limit` parameter

**"Content truncated"**
- Reduce `limit` (fewer messages = more complete content)
- Rely on memory files for archival data

**"Isolated session can't send messages"**
- Use `message` tool, not sessions_send
- Ensure delivery.mode is set in cron config OR use message tool directly

## Related Patterns

- **Heartbeats:** Main session periodic checks (full context, main model)
- **Sub-agents:** Long-running background tasks
- **Cron jobs:** Scheduled isolated work
- **Memory files:** Persistent cross-session storage

## Credits

Discovered by RGBA Research during OpenClaw optimization work.
Published to ClawHub as open pattern for the community.

**Contact:** https://rgbaresearch.com
**License:** MIT (free to use, adapt, share)


## Performance
### Caching Strategies
- Enable caching for repeated operations
- Use LRU cache for frequently accessed data
- Consider distributed caching for scale

### Async Processing
- Use async/await for I/O bound operations
- Implement parallel processing for CPU intensive tasks
- Consider worker pools for batch processing

### Memory Optimization
- Monitor memory usage for large datasets
- Use streaming for large file processing
- Implement pagination for bulk operations

### Optimization Tips

- Use caching where applicable to reduce repeated computations
- Consider batch processing for multiple operations
- Implement async/parallel processing when possible
- Monitor memory usage for large datasets

### Best Practices

- Profile before optimizing
- Use appropriate data structures for the task
- Consider lazy loading for large resources


## Dependencies

### Required

- Python 3.8+ or Node.js 16+ (depending on skill type)
- See skill metadata for specific requirements

### Optional

- Additional dependencies may be needed for extended features
- Check official documentation for full requirements


## API Reference

### Main Functions

```python
# Initialize
skill = Skill()

# Process data
result = skill.process(input_data)

# Cleanup
skill.close()
```

### Configuration

```python
# With options
config = {"option1": "value1", "option2": "value2"}
skill = Skill(config)
```


## Architecture

### Components

1. **Core Module** - Main processing logic
2. **CLI Interface** - Command-line interaction
3. **Configuration Manager** - Settings handling
4. **Logger** - Event tracking and debugging

### Data Flow

```
Input → Validator → Processor → Formatter → Output
```


## Features

### Core Features

- Feature 1: Description of what this capability does
- Feature 2: Another important capability
- Feature 3: Additional functionality

### Advanced Features

- Advanced option A for power users
- Advanced option B for customization


## Installation

```bash
pip install {skill_dir}
```

For development:

```bash
pip install -e .
```

## Performance Tips

### Optimization

- Enable caching for better performance
- Use batch processing for multiple operations
- Monitor resource usage with verbose mode

### Best Practices

- Profile before optimizing
- Use appropriate data structures
- Consider lazy loading for large resources

## Module Structure

### Core Modules

```python
# Main module
class Core:
    def __init__(self):
        pass

# Processing module  
class Processor:
    def process(self, data):
        return data
```

### Helper Modules

```python
# Utility functions
def helper_function(data):
    return processed_data
```

### Performance Optimization

- Use caching for repeated lookups
- Implement connection pooling for database operations
- Optimize memory usage with streaming where possible
- Consider lazy loading for better initial load times

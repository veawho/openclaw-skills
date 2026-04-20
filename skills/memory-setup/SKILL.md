---
name: memory-setup
description: Enable and configure Moltbot/Clawdbot memory search for persistent context. Use when setting up memory, fixing "goldfish brain," or helping users configure memorySearch in their config. Covers MEMORY.md, daily logs, and vector search setup.
description_zh: Enble 和 configure Moltbot/Clwdbot mem或y 搜索 用于 持久化上下文. 用于 setting up mem或y, fixing "goldfish brin," 或 helping users configure mem或ySerch in ir config. Covers MEMORY.md, dily logs, 和 vect或 搜索 设置.。
---

# Memory Setup Skill


## 中文说明

### 简介

memory-setup - Enable and configure Moltbot/Clawdbot memory search for persistent context. Use when setting up memory, fixing "goldfish brain," or helping users configure memorySearch in their config. Covers MEMORY.md, daily logs, and vector search setup.

### 使用方法

此 Skill 已安装到 `/home/node/.openclaw/workspace/skills/memory-setup/`

1. 查看 SKILL.md 了解详细用法
2. 如有 scripts/run.sh，可直接运行
3. 参照 Examples 章节中的命令进行操作

### 适用场景

- 请参考 ## When to Use 章节
- 如有疑问，请查看 ## Troubleshooting 章节

### 快速开始

```bash
# 查看帮助
cd /home/node/.openclaw/workspace/skills/memory-setup
cat SKILL.md

# 运行（如有脚本）
./scripts/run.sh
```

### 注意事项

- 请确保已安装所需依赖
- 建议先阅读 ## Setup 或 ## Installation 章节
- 详细配置说明见 ## Configuration 章节

## Overview

Enable and configure Moltbot/Clawdbot memory search for persistent context. Use when setting up memory, fixing "goldfish brain," or helping users configure memorySearch in their config. Covers MEMORY.md, daily logs, and vector search setup.

## When to Use

- TODO: add common use cases


Transform your agent from goldfish to elephant. This skill helps configure persistent memory for Moltbot/Clawdbot.

## Quick Setup

### 1. Enable Memory Search in Config

Add to `~/.clawdbot/clawdbot.json` (or `moltbot.json`):

```json
{
  "memorySearch": {
    "enabled": true,
    "provider": "voyage",
    "sources": ["memory", "sessions"],
    "indexMode": "hot",
    "minScore": 0.3,
    "maxResults": 20
  }
}
```

### 2. Create Memory Structure

In your workspace, create:

```
workspace/
├── MEMORY.md              # Long-term curated memory
└── memory/
    ├── logs/              # Daily logs (YYYY-MM-DD.md)
    ├── projects/          # Project-specific context
    ├── groups/            # Group chat context
    └── system/            # Preferences, setup notes
```

### 3. Initialize MEMORY.md

Create `MEMORY.md` in workspace root:

```markdown
# MEMORY.md — Long-Term Memory

## About [User Name]
- Key facts, preferences, context

## Active Projects
- Project summaries and status

## Decisions & Lessons
- Important choices made
- Lessons learned

## Preferences
- Communication style
- Tools and workflows
```

## Config Options Explained

| Setting | Purpose | Recommended |
|---------|---------|-------------|
| `enabled` | Turn on memory search | `true` |
| `provider` | Embedding provider | `"voyage"` |
| `sources` | What to index | `["memory", "sessions"]` |
| `indexMode` | When to index | `"hot"` (real-time) |
| `minScore` | Relevance threshold | `0.3` (lower = more results) |
| `maxResults` | Max snippets returned | `20` |

### Provider Options
- `voyage` — Voyage AI embeddings (recommended)
- `openai` — OpenAI embeddings
- `local` — Local embeddings (no API needed)

### Source Options
- `memory` — MEMORY.md + memory/*.md files
- `sessions` — Past conversation transcripts
- `both` — Full context (recommended)

## Daily Log Format

Create `memory/logs/YYYY-MM-DD.md` daily:

```markdown
# YYYY-MM-DD — Daily Log

## [Time] — [Event/Task]
- What happened
- Decisions made
- Follow-ups needed

## [Time] — [Another Event]
- Details
```

## Agent Instructions (AGENTS.md)

Add to your AGENTS.md for agent behavior:

```markdown
## Memory Recall
Before answering questions about prior work, decisions, dates, people, preferences, or todos:
1. Run memory_search with relevant query
2. Use memory_get to pull specific lines if needed
3. If low confidence after search, say you checked
```

## Troubleshooting

### Memory search not working?
1. Check `memorySearch.enabled: true` in config
2. Verify MEMORY.md exists in workspace root
3. Restart gateway: `clawdbot gateway restart`

### Results not relevant?
- Lower `minScore` to `0.2` for more results
- Increase `maxResults` to `30`
- Check that memory files have meaningful content

### Provider errors?
- Voyage: Set `VOYAGE_API_KEY` in environment
- OpenAI: Set `OPENAI_API_KEY` in environment
- Use `local` provider if no API keys available

## Verification

Test memory is working:

```
User: "What do you remember about [past topic]?"
Agent: [Should search memory and return relevant context]
```

If agent has no memory, config isn't applied. Restart gateway.

## Full Config Example

```json
{
  "memorySearch": {
    "enabled": true,
    "provider": "voyage",
    "sources": ["memory", "sessions"],
    "indexMode": "hot",
    "minScore": 0.3,
    "maxResults": 20
  },
  "workspace": "/path/to/your/workspace"
}
```

## Why This Matters

Without memory:
- Agent forgets everything between sessions
- Repeats questions, loses context
- No continuity on projects

With memory:
- Recalls past conversations
- Knows your preferences
- Tracks project history
- Builds relationship over time

Goldfish → Elephant. 🐘

## Tools
## Tools

## Examples

```bash
# Example usage
skill --help
```


### CLI Commands

```bash
# Common commands
skill --help
skill --list
```

### API Usage

```python
# Example usage
result = skill.process(input_data)
```



## Performance

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


## Limitations

- May require specific environment configuration
- Performance may vary based on input size
- Some features require optional dependencies

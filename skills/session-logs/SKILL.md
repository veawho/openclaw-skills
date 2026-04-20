---
name: session-logs
description: Search and analyze your own session logs (older/parent conversations) using jq.
metadata: {"openclaw":{"emoji":"📜","requires":{"bins":["jq","rg"]}}}
---

# session-logs


## 中文说明

### 简介

session-logs - Search and analyze your own session logs (older/parent conversations) using jq.

### 使用方法

此 Skill 已安装到 `/home/node/.openclaw/workspace/skills/session-logs/`

1. 查看 SKILL.md 了解详细用法
2. 如有 scripts/run.sh，可直接运行
3. 参照 Examples 章节中的命令进行操作

### 适用场景

- 请参考 ## When to Use 章节
- 如有疑问，请查看 ## Troubleshooting 章节

### 快速开始

```bash
# 查看帮助
cd /home/node/.openclaw/workspace/skills/session-logs
cat SKILL.md

# 运行（如有脚本）
./scripts/run.sh
```

### 注意事项

- 请确保已安装所需依赖
- 建议先阅读 ## Setup 或 ## Installation 章节
- 详细配置说明见 ## Configuration 章节

## Overview

Search and analyze your own session logs (older/parent conversations) using jq.

## When to Use

- TODO: add common use cases


Search your complete conversation history stored in session JSONL files. Use this when a user references older/parent conversations or asks what was said before.

## Trigger

Use this skill when the user asks about prior chats, parent conversations, or historical context that isn’t in memory files.

## Location

Session logs live at: `~/.clawdbot/agents/<agentId>/sessions/` (use the `agent=<id>` value from the system prompt Runtime line).

- **`sessions.json`** - Index mapping session keys to session IDs
- **`<session-id>.jsonl`** - Full conversation transcript per session

## Structure

Each `.jsonl` file contains messages with:
- `type`: "session" (metadata) or "message"
- `timestamp`: ISO timestamp
- `message.role`: "user", "assistant", or "toolResult"
- `message.content[]`: Text, thinking, or tool calls (filter `type=="text"` for human-readable content)
- `message.usage.cost.total`: Cost per response

## Common Queries

### List all sessions by date and size
```bash
for f in ~/.clawdbot/agents/<agentId>/sessions/*.jsonl; do
  date=$(head -1 "$f" | jq -r '.timestamp' | cut -dT -f1)
  size=$(ls -lh "$f" | awk '{print $5}')
  echo "$date $size $(basename $f)"
done | sort -r
```

### Find sessions from a specific day
```bash
for f in ~/.clawdbot/agents/<agentId>/sessions/*.jsonl; do
  head -1 "$f" | jq -r '.timestamp' | grep -q "2026-01-06" && echo "$f"
done
```

### Extract user messages from a session
```bash
jq -r 'select(.message.role == "user") | .message.content[]? | select(.type == "text") | .text' <session>.jsonl
```

### Search for keyword in assistant responses
```bash
jq -r 'select(.message.role == "assistant") | .message.content[]? | select(.type == "text") | .text' <session>.jsonl | rg -i "keyword"
```

### Get total cost for a session
```bash
jq -s '[.[] | .message.usage.cost.total // 0] | add' <session>.jsonl
```

### Daily cost summary
```bash
for f in ~/.clawdbot/agents/<agentId>/sessions/*.jsonl; do
  date=$(head -1 "$f" | jq -r '.timestamp' | cut -dT -f1)
  cost=$(jq -s '[.[] | .message.usage.cost.total // 0] | add' "$f")
  echo "$date $cost"
done | awk '{a[$1]+=$2} END {for(d in a) print d, "$"a[d]}' | sort -r
```

### Count messages and tokens in a session
```bash
jq -s '{
  messages: length,
  user: [.[] | select(.message.role == "user")] | length,
  assistant: [.[] | select(.message.role == "assistant")] | length,
  first: .[0].timestamp,
  last: .[-1].timestamp
}' <session>.jsonl
```

### Tool usage breakdown
```bash
jq -r '.message.content[]? | select(.type == "toolCall") | .name' <session>.jsonl | sort | uniq -c | sort -rn
```

### Search across ALL sessions for a phrase
```bash
rg -l "phrase" ~/.clawdbot/agents/<agentId>/sessions/*.jsonl
```

## Tips

- Sessions are append-only JSONL (one JSON object per line)
- Large sessions can be several MB - use `head`/`tail` for sampling
- The `sessions.json` index maps chat providers (discord, whatsapp, etc.) to session IDs
- Deleted sessions have `.deleted.<timestamp>` suffix

## Fast text-only hint (low noise)

```bash
jq -r 'select(.type=="message") | .message.content[]? | select(.type=="text") | .text' ~/.clawdbot/agents/<agentId>/sessions/<id>.jsonl | rg 'keyword'
```

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


## Troubleshooting

### Common Issues

**Issue**: Command not found
- Solution: Ensure the skill is properly installed

**Issue**: Permission denied
- Solution: Check file permissions and user access

**Issue**: Configuration error
- Solution: Verify config.yaml syntax and paths

### Debug Mode

```bash
# Enable verbose output
skill run --verbose --debug

# Check logs
tail -f /var/log/skill.log
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

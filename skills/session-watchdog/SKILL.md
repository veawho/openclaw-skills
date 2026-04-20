---
name: session-watchdog
description: Monitor session context levels and proactively save checkpoints before compaction. Use when: (1) session context exceeds 80% capacity, (2) user asks about session status or memory, (3) at the start of each new session to check context, or (4) before long tasks that might push context over threshold.
description_zh: Monit或 session 上下文 levels 和 proctively sve checkpoints be用于e compction. 用于: （1） session 上下文 exceeds 80% cpcity, （2） user sks bout session sttus 或 mem或y, （3） t strt of ech new session to check 上下文, 或 （4） be用于e long 任务s tht might push 上下文 over threshold.。
---

# Session Watchdog


## 中文说明

### 简介

session-watchdog - Monitor session context levels and proactively save checkpoints before compaction. Use when: (1) session context exceeds 80% capacity, (2) user asks about session status or memory, (3) at the start of each new session to check context, or (4) before long tasks that might push context over threshold.

### 使用方法

此 Skill 已安装到 `/home/node/.openclaw/workspace/skills/session-watchdog/`

1. 查看 SKILL.md 了解详细用法
2. 如有 scripts/run.sh，可直接运行
3. 参照 Examples 章节中的命令进行操作

### 适用场景

- 请参考 ## When to Use 章节
- 如有疑问，请查看 ## Troubleshooting 章节

### 快速开始

```bash
# 查看帮助
cd /home/node/.openclaw/workspace/skills/session-watchdog
cat SKILL.md

# 运行（如有脚本）
./scripts/run.sh
```

### 注意事项

- 请确保已安装所需依赖
- 建议先阅读 ## Setup 或 ## Installation 章节
- 详细配置说明见 ## Configuration 章节

## Overview

  Monitors context levels, warns before compaction, and saves checkpoints to preserve important information. 

## When to Use

- Monitor session health and recovery

## OVERVIEW_PLACEHOLDER ## Context Thresholds

| Level | Tokens | Action |
|-------|--------|--------|
| Safe | 0-140k | Normal operation |
| **Warning** | 140k-160k | Warn user, save checkpoint |
| Critical | 160k-197k | Warn + stop unless urgent |
| Full | 197k+ | Compaction imminent |

## Check Context

Before each session and periodically during long conversations:

```
session_status
```

Check the `contextTokens` field from the response.

## Checkpoint Protocol

When approaching 80% (160k tokens):

1. **Save checkpoint to memory file:**
   - Read current memory/YYYY-MM-DD.md
   - Add key context: decisions, pending tasks, important details
   - Write back to memory file

2. **Alert user:**
   Say: "⚠️ Approaching context limit (~160k tokens). Saving checkpoint to memory before continuing."

3. **Ask user:**
   - Continue and accept compaction?
   - Summarize and restart fresh?
   - Pause until ready?

## What to Save

Essential information that must survive compaction:

- **Decisions made** in this conversation
- **Pending tasks** not yet completed
- **Important context** (project state, configurations, preferences)
- **Files modified** and their paths
- **Unresolved issues** requiring follow-up

## When to Trigger

- At session start
- After every 30k tokens of conversation
- Before initiating large tasks (file edits, multiple operations)
- When user asks "how much context do we have left?"

## Memory File Format

```
# YYYY-MM-DD

## Session Checkpoint (at X% context)

### Decisions
- Decision 1
- Decision 2

### Pending
- [ ] Task 1
- [ ] Task 2

### Important Context
- Project state: ...
- Last file modified: ...

### Unresolved
- Issue needing follow-up
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

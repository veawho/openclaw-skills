---
name: task-tracker
description: Proactive task state management. Use on EVERY task start, progress update, completion, or failure. Tracks what was requested, what's running (background processes, SSH sessions), what's done, and what's next. Survives session resets. Triggers automatically — not user-invoked.
description_zh: Proctive 任务 stte 管理ment. Use on EVERY 任务 strt, progress updte, completion, 或 filure. Trcks wht ws requested, wht's 运行ning （bckground 处理es, SSH sessions）, wht's done, 和 wht's next. Survives session resets. Triggers utomticlly — not user-invoked.。
---

# Task Tracker


## 中文说明

### 简介

task-tracker - Proactive task state management. Use on EVERY task start, progress update, completion, or failure. Tracks what was requested, what's running (background processes, SSH sessions), what's done, and what's next. Survives session resets. Triggers automatically — not user-invoked.

### 使用方法

此 Skill 已安装到 `/home/node/.openclaw/workspace/skills/agent-task-tracker/`

1. 查看 SKILL.md 了解详细用法
2. 如有 scripts/run.sh，可直接运行
3. 参照 Examples 章节中的命令进行操作

### 适用场景

- 请参考 ## When to Use 章节
- 如有疑问，请查看 ## Troubleshooting 章节

### 快速开始

```bash
# 查看帮助
cd /home/node/.openclaw/workspace/skills/agent-task-tracker
cat SKILL.md

# 运行（如有脚本）
./scripts/run.sh
```

### 注意事项

- 请确保已安装所需依赖
- 建议先阅读 ## Setup 或 ## Installation 章节
- 详细配置说明见 ## Configuration 章节

## Overview

Proactive task state management. Use on EVERY task start, progress update, completion, or failure. Tracks what was requested, what's running (backgro

## When to Use

- TODO - add common use cases


Maintain a live task state file so context survives session resets/compaction.

## State File

`memory/tasks.md` — single source of truth.

## When to Write

1. **Task received** → add entry with status `🔄 进行中`
2. **Background process started** → record session ID, PID, server, command
3. **Progress update** → update status/notes
4. **Task completed** → mark `✅ 完成`, record results/links
5. **Task failed** → mark `❌ 失败`, record error
6. **Session start** → read `memory/tasks.md` to resume awareness

## Format

```markdown
# Active Tasks

## [task-id] Short description
- **Status**: 🔄 进行中 | ✅ 完成 | ❌ 失败 | ⏸️ 暂停
- **Requested**: YYYY-MM-DD HH:MM
- **Updated**: YYYY-MM-DD HH:MM
- **Background**: session-id (PID) on server-name — `command`
- **Notes**: progress details, partial results
- **Result**: final output, links, summary

# Completed (recent)
<!-- Move completed tasks here, keep last 10, prune older -->
```

## Rules

- Update the file BEFORE reporting to user (write-first)
- Include enough detail to resume without prior conversation context
- For background processes: always record session ID + what server + what command
- For multi-step tasks: update after each step
- Keep it concise — this isn't a log, it's a state snapshot
- **Size limit: keep under 50 lines / 2KB** — this file is read every session start
- Completed tasks: collapse to one-line summary, reference daily notes for details
- Prune completed tasks older than 3 days
- If Active is empty, write （无） to make it obvious

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

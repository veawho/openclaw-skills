---
name: apple-notes
description: Manage Apple Notes via the `memo` CLI on macOS (create, view, edit, delete, search, move, and export notes). Use when a user asks Clawdbot to add a note, list notes, search notes, or manage note folders.
description_zh: Mnge Apple Notes 通过 'memo' 命令行接口 on mcOS （创建, view, edit, delete, 搜索, move, 和 exp或t notes）. 用于 user sks Clwdbot to dd note, list notes, 搜索 notes, 或 管理 note folders.。
homepage: https://github.com/antoniorodr/memo
metadata: {"clawdbot":{"emoji":"📝","os":["darwin"],"requires":{"bins":["memo"]},"install":[{"id":"brew","kind":"brew","formula":"antoniorodr/memo/memo","bins":["memo"],"label":"Install memo via Homebrew"}]}}
---

# Apple Notes CLI


## 中文说明

### 简介

apple-notes - Manage Apple Notes via the `memo` CLI on macOS (create, view, edit, delete, search, move, and export notes). Use when a user asks Clawdbot to add a note, list notes, search notes, or manage note folders.

### 使用方法

此 Skill 已安装到 `/home/node/.openclaw/workspace/skills/apple-notes/`

1. 查看 SKILL.md 了解详细用法
2. 如有 scripts/run.sh，可直接运行
3. 参照 Examples 章节中的命令进行操作

### 适用场景

- 请参考 ## When to Use 章节
- 如有疑问，请查看 ## Troubleshooting 章节

### 快速开始

```bash
# 查看帮助
cd /home/node/.openclaw/workspace/skills/apple-notes
cat SKILL.md

# 运行（如有脚本）
./scripts/run.sh
```

### 注意事项

- 请确保已安装所需依赖
- 建议先阅读 ## Setup 或 ## Installation 章节
- 详细配置说明见 ## Configuration 章节

## Overview

Use `memo notes` to manage Apple Notes directly from the terminal. Create, view, edit, delete, search, move notes between folders, and export to HTML/Markdown.

## When to Use

- Adding or creating notes
- Listing or searching notes
- Managing note folders
- Exporting notes to Markdown/HTML

## Setup

```bash
# Install via Homebrew
brew tap antoniorodr/memo && brew install antoniorodr/memo/memo

# Manual pip install
git clone https://github.com/antoniorodr/memo && cd memo && pip install .
```

- macOS-only; if prompted, grant Automation access to Notes.app.

## View Notes

```bash
# List all notes
memo notes

# Filter by folder
memo notes -f "Folder Name"

# Search notes
memo notes -s "query"
```

## Create Notes

```bash
# Interactive new note
memo notes -a

# Quick add with title
memo notes -a "Note Title"
```

## Edit Notes

```bash
# Edit existing note
memo notes -e
```

## Delete Notes

```bash
# Delete a note
memo notes -d
```

## Move Notes

```bash
# Move note to folder
memo notes -m
```

## Export Notes

```bash
# Export to HTML/Markdown
memo notes -ex
```

## Limitations

- Cannot edit notes containing images or attachments.
- Interactive prompts may require terminal access.

## Notes

- macOS-only.
- Requires Apple Notes.app to be accessible.
- For automation, grant permissions in System Settings > Privacy & Security > Automation.

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

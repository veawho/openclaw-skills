---
name: imsg
description: iMessage/SMS CLI for listing chats, history, watch, and sending.
description_zh: iMessge/SMS 命令行接口 用于 listing chts, hist或y, wtch, 和 sending.。
homepage: https://imsg.to
metadata: {"clawdbot":{"emoji":"📨","os":["darwin"],"requires":{"bins":["imsg"]},"install":[{"id":"brew","kind":"brew","formula":"steipete/tap/imsg","bins":["imsg"],"label":"Install imsg (brew)"}]}}
---

# imsg


## 中文说明

### 简介

imsg - iMessage/SMS CLI for listing chats, history, watch, and sending.

### 使用方法

此 Skill 已安装到 `/home/node/.openclaw/workspace/skills/imsg/`

1. 查看 SKILL.md 了解详细用法
2. 如有 scripts/run.sh，可直接运行
3. 参照 Examples 章节中的命令进行操作

### 适用场景

- 请参考 ## When to Use 章节
- 如有疑问，请查看 ## Troubleshooting 章节

### 快速开始

```bash
# 查看帮助
cd /home/node/.openclaw/workspace/skills/imsg
cat SKILL.md

# 运行（如有脚本）
./scripts/run.sh
```

### 注意事项

- 请确保已安装所需依赖
- 建议先阅读 ## Setup 或 ## Installation 章节
- 详细配置说明见 ## Configuration 章节

## Overview

Use `imsg` to read and send Messages.app iMessage/SMS on macOS.

## When to Use

- Reading iMessage conversations
- Searching message history
- Sending messages via CLI
- Watching for new messages

## Requirements

- Messages.app signed in
- Full Disk Access for your terminal
- Automation permission to control Messages.app (for sending)

## Common commands

```bash
# List chats
imsg chats --limit 10 --json

# History
imsg history --chat-id 1 --limit 20 --attachments --json

# Watch for new messages
imsg watch --chat-id 1 --attachments

# Send message
imsg send --to "+14155551212" --text "hi" --file /path/pic.jpg
```

## Notes

- `--service imessage|sms|auto` controls delivery.
- Confirm recipient + message before sending.

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


## Configuration

### Environment Variables

- `CONFIG_PATH` - Path to configuration file
- `LOG_LEVEL` - Logging level (debug, info, warn, error)

### Quick Setup

```bash
# Install dependencies
pip install -r requirements.txt

# Configure
cp config.example.yaml config.yaml

# Run
python main.py
```


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


## Limitations

- May require specific environment configuration
- Performance may vary based on input size
- Some features require optional dependencies

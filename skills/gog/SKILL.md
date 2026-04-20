---
name: gog
description: Google Workspace CLI for Gmail, Calendar, Drive, Contacts, Sheets, and Docs.
description_zh: Google W或kspce 命令行接口 用于 Gmil, Clendr, Drive, Contcts, Sheets, 和 Docs.。
homepage: https://gogcli.sh
metadata: {"clawdbot":{"emoji":"🎮","requires":{"bins":["gog"]},"install":[{"id":"brew","kind":"brew","formula":"steipete/tap/gogcli","bins":["gog"],"label":"Install gog (brew)"}]}}
---

# gog


## 中文说明

### 简介

gog - Google Workspace CLI for Gmail, Calendar, Drive, Contacts, Sheets, and Docs.

### 使用方法

此 Skill 已安装到 `/home/node/.openclaw/workspace/skills/gog/`

1. 查看 SKILL.md 了解详细用法
2. 如有 scripts/run.sh，可直接运行
3. 参照 Examples 章节中的命令进行操作

### 适用场景

- 请参考 ## When to Use 章节
- 如有疑问，请查看 ## Troubleshooting 章节

### 快速开始

```bash
# 查看帮助
cd /home/node/.openclaw/workspace/skills/gog
cat SKILL.md

# 运行（如有脚本）
./scripts/run.sh
```

### 注意事项

- 请确保已安装所需依赖
- 建议先阅读 ## Setup 或 ## Installation 章节
- 详细配置说明见 ## Configuration 章节

## Overview

Use `gog` for Gmail/Calendar/Drive/Contacts/Sheets/Docs. Requires OAuth setup.

## When to Use

- Gmail management (search, send, read)
- Calendar event management
- Google Drive file operations
- Google Sheets read/write
- Google Docs access

## Setup (once)

```bash
# Authenticate with credentials file
gog auth credentials /path/to/client_secret.json

# Add account with services
gog auth add you@gmail.com --services gmail,calendar,drive,contacts,sheets,docs

# List authenticated accounts
gog auth list
```

## Common commands

### Gmail

```bash
# Search emails
gog gmail search 'newer_than:7d' --max 10

# Send email
gog gmail send --to a@b.com --subject "Hi" --body "Hello"
```

### Calendar

```bash
# Get events
gog calendar events <calendarId> --from <iso> --to <iso>
```

### Drive

```bash
# Search files
gog drive search "query" --max 10
```

### Contacts

```bash
# List contacts
gog contacts list --max 20
```

### Sheets

```bash
# Get data
gog sheets get <sheetId> "Tab!A1:D10" --json

# Update cells
gog sheets update <sheetId> "Tab!A1:B2" --values-json '[["A","B"],["1","2"]]' --input USER_ENTERED

# Append rows
gog sheets append <sheetId> "Tab!A:C" --values-json '[["x","y","z"]]' --insert INSERT_ROWS

# Clear cells
gog sheets clear <sheetId> "Tab!A2:Z"

# Get metadata
gog sheets metadata <sheetId> --json
```

### Docs

```bash
# Export document
gog docs export <docId> --format txt --out /tmp/doc.txt

# Read document
gog docs cat <docId>
```

Notes
- Set `GOG_ACCOUNT=you@gmail.com` to avoid repeating `--account`.
- For scripting, prefer `--json` plus `--no-input`.
- Sheets values can be passed via `--values-json` (recommended) or as inline rows.
- Docs supports export/cat/copy. In-place edits require a Docs API client (not in gog).
- Confirm before sending mail or creating events.

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

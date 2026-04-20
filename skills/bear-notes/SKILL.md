---
name: bear-notes
description: Create, search, and manage Bear notes via grizzly CLI.
description_zh: Crete, 搜索, 和 管理 Ber notes 通过 grizzly 命令行接口.。
homepage: https://bear.app
metadata: {"clawdbot":{"emoji":"🐻","os":["darwin"],"requires":{"bins":["grizzly"]},"install":[{"id":"go","kind":"go","module":"github.com/tylerwince/grizzly/cmd/grizzly@latest","bins":["grizzly"],"label":"Install grizzly (go)"}]}}
---

# Bear Notes


## 中文说明

### 简介

bear-notes - Create, search, and manage Bear notes via grizzly CLI.

### 使用方法

此 Skill 已安装到 `/home/node/.openclaw/workspace/skills/bear-notes/`

1. 查看 SKILL.md 了解详细用法
2. 如有 scripts/run.sh，可直接运行
3. 参照 Examples 章节中的命令进行操作

### 适用场景

- 请参考 ## When to Use 章节
- 如有疑问，请查看 ## Troubleshooting 章节

### 快速开始

```bash
# 查看帮助
cd /home/node/.openclaw/workspace/skills/bear-notes
cat SKILL.md

# 运行（如有脚本）
./scripts/run.sh
```

### 注意事项

- 请确保已安装所需依赖
- 建议先阅读 ## Setup 或 ## Installation 章节
- 详细配置说明见 ## Configuration 章节

## Overview

  Use `grizzly` to create, read, and manage notes in Bear on macOS. 

## When to Use

- Bear notes management

## OVERVIEW_PLACEHOLDER ## Getting a Bear Token

For operations that require a token (add-text, tags, open-note --selected), you need an authentication token:
1. Open Bear → Help → API Token → Copy Token
2. Save it: `echo "YOUR_TOKEN" > ~/.config/grizzly/token`

## Common Commands

Create a note
```bash
echo "Note content here" | grizzly create --title "My Note" --tag work
grizzly create --title "Quick Note" --tag inbox < /dev/null
```

Open/read a note by ID
```bash
grizzly open-note --id "NOTE_ID" --enable-callback --json
```

Append text to a note
```bash
echo "Additional content" | grizzly add-text --id "NOTE_ID" --mode append --token-file ~/.config/grizzly/token
```

List all tags
```bash
grizzly tags --enable-callback --json --token-file ~/.config/grizzly/token
```

Search notes (via open-tag)
```bash
grizzly open-tag --name "work" --enable-callback --json
```

## Options

Common flags:
- `--dry-run` — Preview the URL without executing
- `--print-url` — Show the x-callback-url
- `--enable-callback` — Wait for Bear's response (needed for reading data)
- `--json` — Output as JSON (when using callbacks)
- `--token-file PATH` — Path to Bear API token file

## Configuration

Grizzly reads config from (in priority order):
1. CLI flags
2. Environment variables (`GRIZZLY_TOKEN_FILE`, `GRIZZLY_CALLBACK_URL`, `GRIZZLY_TIMEOUT`)
3. `.grizzly.toml` in current directory
4. `~/.config/grizzly/config.toml`

Example `~/.config/grizzly/config.toml`:
```toml
token_file = "~/.config/grizzly/token"
callback_url = "http://127.0.0.1:42123/success"
timeout = "5s"
```

## Notes

- Bear must be running for commands to work
- Note IDs are Bear's internal identifiers (visible in note info or via callbacks)
- Use `--enable-callback` when you need to read data back from Bear
- Some operations require a valid token (add-text, tags, open-note --selected)

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

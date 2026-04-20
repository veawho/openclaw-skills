---
name: mcporter
description: Use the mcporter CLI to list, configure, auth, and call MCP servers/tools directly (HTTP or stdio), including ad-hoc servers, config edits, and CLI/type generation.
homepage: http://mcporter.dev
metadata: {"clawdbot":{"emoji":"📦","requires":{"bins":["mcporter"]},"install":[{"id":"node","kind":"node","package":"mcporter","bins":["mcporter"],"label":"Install mcporter (node)"}]}}
---

# mcporter


## 中文说明

### 简介

mcporter - Use the mcporter CLI to list, configure, auth, and call MCP servers/tools directly (HTTP or stdio), including ad-hoc servers, config edits, and CLI/type generation.

### 使用方法

此 Skill 已安装到 `/home/node/.openclaw/workspace/skills/mcporter/`

1. 查看 SKILL.md 了解详细用法
2. 如有 scripts/run.sh，可直接运行
3. 参照 Examples 章节中的命令进行操作

### 适用场景

- 请参考 ## When to Use 章节
- 如有疑问，请查看 ## Troubleshooting 章节

### 快速开始

```bash
# 查看帮助
cd /home/node/.openclaw/workspace/skills/mcporter
cat SKILL.md

# 运行（如有脚本）
./scripts/run.sh
```

### 注意事项

- 请确保已安装所需依赖
- 建议先阅读 ## Setup 或 ## Installation 章节
- 详细配置说明见 ## Configuration 章节

## Overview

Use `mcporter` to work with MCP servers directly.

## When to Use

- Working with MCP (Model Context Protocol) servers
- Calling tools on remote servers
- Managing MCP configurations
- Generating CLI from MCP schemas

## Quick start

```bash
mcporter list
mcporter list <server> --schema
mcporter call <server.tool> key=value
```

## Call tools

```bash
# Selector syntax
mcporter call linear.list_issues team=ENG limit:5

# Function syntax
mcporter call "linear.create_issue(title: \"Bug\")"

# Full URL
mcporter call https://api.example.com/mcp.fetch url:https://example.com

# Stdio mode
mcporter call --stdio "bun run ./server.ts" scrape url=https://example.com

# JSON payload
mcporter call <server.tool> --args '{"limit":5}'
```

## Auth + config

```bash
# OAuth
mcporter auth <server | url> [--reset]

# Config management
mcporter config list|get|add|remove|import|login|logout
```

## Daemon

```bash
mcporter daemon start|status|stop|restart
```

## Codegen

```bash
# Generate CLI
mcporter generate-cli --server <name>
mcporter generate-cli --command <url>

# Inspect
mcporter inspect-cli <path> [--json]

# TypeScript
mcporter emit-ts <server> --mode client|types
```

## Notes

- Config default: `./config/mcporter.json` (override with `--config`).
- Prefer `--output json` for machine-readable results.


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


## Examples

### Basic Example

```bash
# Install
pip install {skill_dir}

# Run
{skill_dir} --help
```

### Advanced Example

```bash
# With options
{skill_dir} run --input "data" --output "result"

# Batch mode
{skill_dir} batch --files "*.txt"
```


## Getting Started

1. Install the skill
2. Configure settings
3. Run your first command
4. Explore advanced features

For more details, see the Examples section above.

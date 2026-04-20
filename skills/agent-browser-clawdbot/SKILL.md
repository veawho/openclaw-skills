---
name: agent-browser
description: Headless browser automation CLI optimized for AI agents with accessibility tree snapshots and ref-based element selection
metadata: {"clawdbot":{"emoji":"🌐","requires":{"commands":["agent-browser"]},"homepage":"https://github.com/vercel-labs/agent-browser"}}
---

# Agent Browser Skill


## 中文说明

### 简介

agent-browser - Headless browser automation CLI optimized for AI agents with accessibility tree snapshots and ref-based element selection

### 使用方法

此 Skill 已安装到 `/home/node/.openclaw/workspace/skills/agent-browser-clawdbot/`

1. 查看 SKILL.md 了解详细用法
2. 如有 scripts/run.sh，可直接运行
3. 参照 Examples 章节中的命令进行操作

### 适用场景

- 请参考 ## When to Use 章节
- 如有疑问，请查看 ## Troubleshooting 章节

### 快速开始

```bash
# 查看帮助
cd /home/node/.openclaw/workspace/skills/agent-browser-clawdbot
cat SKILL.md

# 运行（如有脚本）
./scripts/run.sh
```

### 注意事项

- 请确保已安装所需依赖
- 建议先阅读 ## Setup 或 ## Installation 章节
- 详细配置说明见 ## Configuration 章节

## Overview

Headless browser automation CLI optimized for AI agents with accessibility tree snapshots and ref-based element selection

## When to Use

- TODO: add common use cases


Fast browser automation using accessibility tree snapshots with refs for deterministic element selection.

## Why Use This Over Built-in Browser Tool

**Use agent-browser when:**
- Automating multi-step workflows
- Need deterministic element selection
- Performance is critical
- Working with complex SPAs
- Need session isolation

**Use built-in browser tool when:**
- Need screenshots/PDFs for analysis
- Visual inspection required
- Browser extension integration needed

## Core Workflow

```bash
# 1. Navigate and snapshot
agent-browser open https://example.com
agent-browser snapshot -i --json

# 2. Parse refs from JSON, then interact
agent-browser click @e2
agent-browser fill @e3 "text"

# 3. Re-snapshot after page changes
agent-browser snapshot -i --json
```

## Key Commands

### Navigation
```bash
agent-browser open <url>
agent-browser back | forward | reload | close
```

### Snapshot (Always use -i --json)
```bash
agent-browser snapshot -i --json          # Interactive elements, JSON output
agent-browser snapshot -i -c -d 5 --json  # + compact, depth limit
agent-browser snapshot -s "#main" -i      # Scope to selector
```

### Interactions (Ref-based)
```bash
agent-browser click @e2
agent-browser fill @e3 "text"
agent-browser type @e3 "text"
agent-browser hover @e4
agent-browser check @e5 | uncheck @e5
agent-browser select @e6 "value"
agent-browser press "Enter"
agent-browser scroll down 500
agent-browser drag @e7 @e8
```

### Get Information
```bash
agent-browser get text @e1 --json
agent-browser get html @e2 --json
agent-browser get value @e3 --json
agent-browser get attr @e4 "href" --json
agent-browser get title --json
agent-browser get url --json
agent-browser get count ".item" --json
```

### Check State
```bash
agent-browser is visible @e2 --json
agent-browser is enabled @e3 --json
agent-browser is checked @e4 --json
```

### Wait
```bash
agent-browser wait @e2                    # Wait for element
agent-browser wait 1000                   # Wait ms
agent-browser wait --text "Welcome"       # Wait for text
agent-browser wait --url "**/dashboard"   # Wait for URL
agent-browser wait --load networkidle     # Wait for network
agent-browser wait --fn "window.ready === true"
```

### Sessions (Isolated Browsers)
```bash
agent-browser --session admin open site.com
agent-browser --session user open site.com
agent-browser session list
# Or via env: AGENT_BROWSER_SESSION=admin agent-browser ...
```

### State Persistence
```bash
agent-browser state save auth.json        # Save cookies/storage
agent-browser state load auth.json        # Load (skip login)
```

### Screenshots & PDFs
```bash
agent-browser screenshot page.png
agent-browser screenshot --full page.png
agent-browser pdf page.pdf
```

### Network Control
```bash
agent-browser network route "**/ads/*" --abort           # Block
agent-browser network route "**/api/*" --body '{"x":1}'  # Mock
agent-browser network requests --filter api              # View
```

### Cookies & Storage
```bash
agent-browser cookies                     # Get all
agent-browser cookies set name value
agent-browser storage local key           # Get localStorage
agent-browser storage local set key val
```

### Tabs & Frames
```bash
agent-browser tab new https://example.com
agent-browser tab 2                       # Switch to tab
agent-browser frame @e5                   # Switch to iframe
agent-browser frame main                  # Back to main
```

## Snapshot Output Format

```json
{
  "success": true,
  "data": {
    "snapshot": "...",
    "refs": {
      "e1": {"role": "heading", "name": "Example Domain"},
      "e2": {"role": "button", "name": "Submit"},
      "e3": {"role": "textbox", "name": "Email"}
    }
  }
}
```

## Best Practices

1. **Always use `-i` flag** - Focus on interactive elements
2. **Always use `--json`** - Easier to parse
3. **Wait for stability** - `agent-browser wait --load networkidle`
4. **Save auth state** - Skip login flows with `state save/load`
5. **Use sessions** - Isolate different browser contexts
6. **Use `--headed` for debugging** - See what's happening

## Example: Search and Extract

```bash
agent-browser open https://www.google.com
agent-browser snapshot -i --json
# AI identifies search box @e1
agent-browser fill @e1 "AI agents"
agent-browser press Enter
agent-browser wait --load networkidle
agent-browser snapshot -i --json
# AI identifies result refs
agent-browser get text @e3 --json
agent-browser get attr @e4 "href" --json
```

## Example: Multi-Session Testing

```bash
# Admin session
agent-browser --session admin open app.com
agent-browser --session admin state load admin-auth.json
agent-browser --session admin snapshot -i --json

# User session (simultaneous)
agent-browser --session user open app.com
agent-browser --session user state load user-auth.json
agent-browser --session user snapshot -i --json
```

## Installation

```bash
npm install -g agent-browser
agent-browser install                     # Download Chromium
agent-browser install --with-deps         # Linux: + system deps
```

## Credits

Skill created by Yossi Elkrief ([@MaTriXy](https://github.com/MaTriXy))

agent-browser CLI by [Vercel Labs](https://github.com/vercel-labs/agent-browser)

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


## Limitations

- May require specific environment configuration
- Performance may vary based on input size
- Some features require optional dependencies

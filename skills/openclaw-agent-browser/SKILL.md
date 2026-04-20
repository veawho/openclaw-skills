---
name: agent-browser
description: Headless browser automation CLI for AI agents. Use when interacting with websites — navigating pages, filling forms, clicking buttons, taking screenshots, extracting data, scraping, testing web apps, downloading files, or automating any browser task. Triggers on requests to "open a website", "fill out a form", "click a button", "take a screenshot", "scrape data", "test this web app", "login to a site", "monitor a page", or any task requiring programmatic web interaction.
---

# Browser Automation with agent-browser


## 中文说明

### 简介

agent-browser - Headless browser automation CLI for AI agents. Use when interacting with websites — navigating pages, filling forms, clicking buttons, taking screenshots, extracting data, scraping, testing web apps, downloading files, or automating any browser task. Triggers on requests to "open a website", "fill out a form", "click a button", "take a screenshot", "scrape data", "test this web app", "login to a site", "monitor a page", or any task requiring programmatic web interaction.

### 使用方法

此 Skill 已安装到 `/home/node/.openclaw/workspace/skills/openclaw-agent-browser/`

1. 查看 SKILL.md 了解详细用法
2. 如有 scripts/run.sh，可直接运行
3. 参照 Examples 章节中的命令进行操作

### 适用场景

- 请参考 ## When to Use 章节
- 如有疑问，请查看 ## Troubleshooting 章节

### 快速开始

```bash
# 查看帮助
cd /home/node/.openclaw/workspace/skills/openclaw-agent-browser
cat SKILL.md

# 运行（如有脚本）
./scripts/run.sh
```

### 注意事项

- 请确保已安装所需依赖
- 建议先阅读 ## Setup 或 ## Installation 章节
- 详细配置说明见 ## Configuration 章节

## Overview

Headless browser automation CLI for AI agents. Use when interacting with websites — navigating pages, filling forms, clicking buttons, taking screenshots, extracting data, scraping, testing web apps, downloading files, or automating any browser task. Triggers on requests to "open a website", "fill out a form", "click a button", "take a screenshot", "scrape data", "test this web app", "login to a site", "monitor a page", or any task requiring programmatic web interaction.

## When to Use

- TODO: add common use cases


## Setup

Run `scripts/setup.sh` to install agent-browser and Chromium. Requires Node.js.

## Core Workflow

Every browser automation follows this pattern:

1. **Navigate**: `agent-browser open <url>`
2. **Snapshot**: `agent-browser snapshot -i` (get element refs like `@e1`, `@e2`)
3. **Interact**: Use refs to click, fill, select
4. **Re-snapshot**: After navigation or DOM changes, get fresh refs

```bash
agent-browser open https://example.com/form
agent-browser snapshot -i
# Output: @e1 [input type="email"], @e2 [input type="password"], @e3 [button] "Submit"

agent-browser fill @e1 "user@example.com"
agent-browser fill @e2 "password123"
agent-browser click @e3
agent-browser wait --load networkidle
agent-browser snapshot -i  # Check result
```

## Command Chaining

Chain with `&&` when you don't need intermediate output:

```bash
agent-browser open https://example.com && agent-browser wait --load networkidle && agent-browser snapshot -i
```

Run separately when you need to parse output first (e.g., snapshot to discover refs).

## Essential Commands

```bash
# Navigate
agent-browser open <url>
agent-browser close

# See the page (always do this first)
agent-browser snapshot -i              # Interactive elements with refs
agent-browser snapshot -i -C           # Include onclick divs

# Interact using @refs
agent-browser click @e1
agent-browser fill @e2 "text"
agent-browser select @e1 "option"
agent-browser press Enter
agent-browser scroll down 500

# Get info
agent-browser get text @e1
agent-browser get url
agent-browser get title

# Wait
agent-browser wait @e1                 # For element
agent-browser wait --load networkidle  # For network idle

# Capture
agent-browser screenshot page.png
agent-browser screenshot --full        # Full page
agent-browser pdf output.pdf
```

For the full command reference, see `references/commands.md`.

## Ref Lifecycle (Important)

Refs (`@e1`, `@e2`) are invalidated when the page changes. Always re-snapshot after:
- Clicking links/buttons that navigate
- Form submissions
- Dynamic content loading (dropdowns, modals)

## Common Patterns

### Form Submission
```bash
agent-browser open https://example.com/signup
agent-browser snapshot -i
agent-browser fill @e1 "Jane Doe"
agent-browser fill @e2 "jane@example.com"
agent-browser select @e3 "California"
agent-browser click @e5
agent-browser wait --load networkidle
```

### Login with State Persistence
```bash
agent-browser open https://app.example.com/login
agent-browser snapshot -i
agent-browser fill @e1 "$USERNAME" && agent-browser fill @e2 "$PASSWORD"
agent-browser click @e3
agent-browser wait --url "**/dashboard"
agent-browser state save auth.json

# Reuse later
agent-browser state load auth.json
agent-browser open https://app.example.com/dashboard
```

### Data Extraction
```bash
agent-browser open https://example.com/products
agent-browser snapshot -i
agent-browser get text @e5
agent-browser get text body > page.txt
```

### Screenshot & Diff
```bash
agent-browser screenshot baseline.png
# ... changes happen ...
agent-browser diff screenshot --baseline baseline.png
```

### Parallel Sessions
```bash
agent-browser --session site1 open https://site-a.com
agent-browser --session site2 open https://site-b.com
agent-browser session list
```

## Security (Optional)

```bash
export AGENT_BROWSER_CONTENT_BOUNDARIES=1          # Wrap output for AI safety
export AGENT_BROWSER_ALLOWED_DOMAINS="example.com"  # Domain allowlist
export AGENT_BROWSER_MAX_OUTPUT=50000               # Prevent context flooding
```

## Cleanup

Always close sessions when done: `agent-browser close`

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

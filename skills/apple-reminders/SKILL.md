---
name: apple-reminders
description: Manage Apple Reminders via the `remindctl` CLI on macOS (list, add, edit, complete, delete). Supports lists, date filters, and JSON/plain output.
homepage: https://github.com/steipete/remindctl
metadata: {"clawdbot":{"emoji":"⏰","os":["darwin"],"requires":{"bins":["remindctl"]},"install":[{"id":"brew","kind":"brew","formula":"steipete/tap/remindctl","bins":["remindctl"],"label":"Install remindctl via Homebrew"}]}}
---

# Apple Reminders CLI (remindctl)

## Overview

Use `remindctl` to manage Apple Reminders directly from the terminal. It supports list filtering, date-based views, and scripting output.

## When to Use

- Managing reminders and todo items
- Checking today's tasks
- Adding or completing reminders
- Viewing scheduled reminders

## Setup

```bash
# Install via Homebrew
brew install steipete/tap/remindctl

# From source
pnpm install && pnpm build
```

- macOS-only; grant Reminders permission when prompted.

## Permissions

```bash
# Check status
remindctl status

# Request access
remindctl authorize
```

## View Reminders

```bash
# Default (today)
remindctl

# Today
remindctl today

# Tomorrow
remindctl tomorrow

# This week
remindctl week

# Overdue
remindctl overdue

# Upcoming
remindctl upcoming

# Completed
remindctl completed

# All
remindctl all

# Specific date
remindctl 2026-01-04
```

Manage Lists
- List all lists: `remindctl list`
- Show list: `remindctl list Work`
- Create list: `remindctl list Projects --create`
- Rename list: `remindctl list Work --rename Office`
- Delete list: `remindctl list Work --delete`

Create Reminders
- Quick add: `remindctl add "Buy milk"`
- With list + due: `remindctl add --title "Call mom" --list Personal --due tomorrow`

Edit Reminders
- Edit title/due: `remindctl edit 1 --title "New title" --due 2026-01-04`

Complete Reminders
- Complete by id: `remindctl complete 1 2 3`

Delete Reminders
- Delete by id: `remindctl delete 4A83 --force`

Output Formats
- JSON (scripting): `remindctl today --json`
- Plain TSV: `remindctl today --plain`
- Counts only: `remindctl today --quiet`

Date Formats
Accepted by `--due` and date filters:
- `today`, `tomorrow`, `yesterday`
- `YYYY-MM-DD`
- `YYYY-MM-DD HH:mm`
- ISO 8601 (`2026-01-04T12:34:56Z`)

Notes
- macOS-only.
- If access is denied, enable Terminal/remindctl in System Settings → Privacy & Security → Reminders.
- If running over SSH, grant access on the Mac that runs the command.

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

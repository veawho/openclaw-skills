---
name: eightctl
description: Control Eight Sleep pods (status, temperature, alarms, schedules).
homepage: https://eightctl.sh
metadata: {"clawdbot":{"emoji":"🎛️","requires":{"bins":["eightctl"]},"install":[{"id":"go","kind":"go","module":"github.com/steipete/eightctl/cmd/eightctl@latest","bins":["eightctl"],"label":"Install eightctl (go)"}]}}
---

# eightctl

## Overview

Use `eightctl` for Eight Sleep pod control. Requires auth.

## When to Use

- User wants to check pod status or temperature
- Setting bed temperature or schedules
- Managing alarms for Eight Sleep device
- Controlling audio or base position

## Setup

Auth
- Config: `~/.config/eightctl/config.yaml`
- Env: `EIGHTCTL_EMAIL`, `EIGHTCTL_PASSWORD`

## Quick start

```bash
eightctl status
eightctl on|off
eightctl temp 20
```

## Common tasks

```bash
# Alarms
 eightctl alarm list|create|dismiss

# Schedules
 eightctl schedule list|create|update

# Audio
 eightctl audio state|play|pause

# Base
 eightctl base info|angle
```

## Notes

- API is unofficial and rate-limited; avoid repeated logins.
- Confirm before changing temperature or alarms.

## Tools

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

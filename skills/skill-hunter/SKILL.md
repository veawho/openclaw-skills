---
name: skill-hunter
description: "Find, evaluate, and install ClawHub skills. Semantic search across 10,000+ skills, security vetting before install, side-by-side comparison. The skill that makes skills useful."
metadata:
  openclaw:
    tags:
      - clawhub
      - skills
      - discovery
      - search
      - install
      - security
      - utility
      - openclaw
      - agent-tool
    os:
      - darwin
      - linux
      - windows
---

# Skill Hunter

## Overview

Find, evaluate, and install ClawHub skills. Semantic search across 10,000+ skills, security vetting before install, side-by-side comparison. The skill that makes skills useful.

## When to Use

- TODO: add common use cases


10,000+ skills on ClawHub. No good way to find the right one, vet it, or know if it's safe to install. Skill Hunter fixes that.

## Three modes

**Hunt** — You know what you need. Describe it in plain English. Skill Hunter searches ClawHub's semantic index and returns ranked matches.

```
curl -s "https://clawhub.ai/api/v1/search?q=code+review+security" | jq '.[] | {slug, displayName, summary, score}'
```

**Scout** — You're exploring. Browse trending, newest, or most-downloaded skills across the platform.

```
curl -s "https://clawhub.ai/api/v1/skills?sort=trending&limit=10" | jq '.items[] | {slug, displayName, summary}'
```

**Vet** — You found a skill. Before installing, read its SKILL.md remotely, check its security profile, and understand what it will do on your machine.

```
curl -s "https://clawhub.ai/api/v1/skills/kenoodl-synthesis/kenoodl-synthesis/file?path=SKILL.md"
```

Full workflow, API reference, and security evaluation framework in `instructions.md`.

## Security profile

No credentials required. No env vars. No external packages. All API calls go to clawhub.ai — the platform's own public endpoints. Nothing leaves your environment except search queries to ClawHub.

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

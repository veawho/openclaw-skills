---
name: context-scope-tags
slug: context-scope-tags
version: 0.2.0
license: MIT
description: |
  Use when: you chat across topics and want explicit boundaries to prevent topic bleed.
  Tags: [ISO], [SCOPE], [GLOBAL], [NOMEM], [REM]. (Memory tags are signals; persistence depends on your agent's memory backend.)
  Don't use when: you prefer free-form conversation where prior context carries over automatically.
  Output: a copy/paste tag cheat sheet + routing rules for how to treat the current message.
metadata:
  openclaw:
    emoji: "🏷️"
---

# Context Scope Tags (Chat Protocol)

## Overview

  A lightweight, portable convention for **explicit context boundaries** in chat. 

## When to Use

- Context scope tagging

## OVERVIEW_PLACEHOLDER ## Copy/paste cheat sheet (one screen)

- `[ISO: <topic>]` fresh slate for this message (no prior project/topic context)
- `[SCOPE: <topic>]` restrict to one named scope
- `[GLOBAL]` cross-topic reuse allowed (call out what was reused)
- `[NOMEM]` do not store long-term memory from this exchange
- `[REM]` persist preferences/decisions (requires a memory backend; otherwise advisory)

Examples:
- `[ISO: marketing][NOMEM] Draft 5 ad angles for OpenClaw; don't store memory.`
- `[SCOPE: openclaw-mem] Explain why lane A is failing; keep it scoped.`
- `[GLOBAL][REM] Remember: display times in Asia/Taipei unless I say otherwise.`

## Quick start

1) Put one or more tags at the **very start** of your message.
2) Prefer this order: **scope tag(s)** then **memory tag(s)**.
3) Write normally.

Optional: if your assistant supports command-style shortcuts, `/ctx` or `/context_def` can print this cheat sheet.

## Tag parsing rules

- Tags must appear **at the start** of the user's message.
- Multiple tags are allowed.
- Tags do **not** override safety policies, tool access controls, approvals, or platform rules.

### Conflicting tags

Some combinations conflict (for example `[ISO]` + `[GLOBAL]`, or `[REM]` + `[NOMEM]`).

Recommended policy:
- **Last tag wins** for the conflicting dimension.
- If the combination is ambiguous, **ask a clarifying question** rather than guessing.

## Supported tags

### Isolation / scope

- `[ISO: <topic>]` / `[Isolated Context: <topic>]`
  - Treat as a **fresh topic**.
  - Do **not** pull in other conversation/project context unless the user explicitly re-provides it.
  - Allowed implicit carry-over: universal safety rules + a few stable user prefs (timezone, "don't apply changes without approval", etc.).

- `[SCOPE: <topic>]` / `[Scoped Context: <topic>]`
  - Restrict reasoning to the named scope.
  - If missing details inside the scope, ask clarifying questions.

- `[GLOBAL]` / `[Global Context OK]`
  - Cross-topic reuse is allowed.
  - When reusing prior context, call out what was reused.

### Memory intent

- `[NOMEM]` / `[No Memory]`
  - Do not store durable/long-term memories from this exchange.

- `[REM]` / `[Remember]`
  - Signal that preferences/decisions in the message should be persisted.
  - **Dependency note:** actual persistence requires the host agent to have a memory subsystem enabled.

## Default behavior (no tags)

- Be conservative about cross-topic mixing.
- If the user complains about topic bleed, suggest using the tags above.

## Cross-platform / chat-surface notes

- Telegram slash commands cannot contain dashes.
  - Use `/context_def` (underscore), not `/context-def`.
- Slash commands may collide with other bots/skills.
  - If `/ctx` is already taken, use the tag syntax directly (it works everywhere).
- The tags themselves are just text; they work the same on Telegram/Discord/Slack/WhatsApp.
- If a surface auto-formats brackets, it's fine - just keep the tags at the very beginning.

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

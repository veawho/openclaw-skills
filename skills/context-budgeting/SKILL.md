---
name: context-budgeting
description: Manage and optimize OpenClaw context window usage via partitioning, pre-compression checkpointing, and information lifecycle management. Use when the session context is near its limit (>80%), when the agent experiences "memory loss" after compaction, or when aiming to reduce token costs and latency for long-running tasks.
---

# Context Budgeting Skill

## Overview

Manage and optimize OpenClaw context window usage via partitioning, pre-compression checkpointing, and information lifecycle management. Use when the session context is near its limit (>80%), when the agent experiences "memory loss" after compaction, or when aiming to reduce token costs and latency for long-running tasks.

## When to Use

- TODO: add common use cases


This skill provides a systematic framework for managing the finite context window (RAM) of an OpenClaw agent.

## Core Concepts

### 1. Information Partitioning
- **Objective/Goal (10%)**: Core task instructions and active constraints.
- **Short-term History (40%)**: Recent 5-10 turns of raw dialogue.
- **Decision Logs (20%)**: Summarized outcomes of past steps ("Tried X, failed because Y").
- **Background/Knowledge (20%)**: High-relevance snippets from MEMORY.md.

### 2. Pre-compression Checkpointing (Mandatory)
Before any compaction (manual or automatic), the agent MUST:
1.  **Generate Checkpoint**: Update `memory/hot/HOT_MEMORY.md` with:
    - **Status**: Current task progress.
    - **Key Decision**: Significant choices made.
    - **Next Step**: Immediate action required.
2.  **Run Automation**: Execute `scripts/gc_and_checkpoint.sh` to trigger the physical cleanup.

## Automation Tool: `gc_and_checkpoint.sh`
Located at: `skills/context-budgeting/scripts/gc_and_checkpoint.sh`

**Usage**: 
- Run this script after updating `HOT_MEMORY.md` to finalize the compaction process without restarting the session.

## Integration with Heartbeat
Heartbeat (every 30m) acts as the Garbage Collector (GC):
1.  Check `/status`. If Context > 80%, trigger the **Checkpointing** procedure.
2.  Clear raw data (e.g., multi-megabyte JSON outputs) once the summary is extracted.

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

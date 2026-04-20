---
name: memory-tiering
description: Automated multi-tiered memory management (HOT, WARM, COLD). Use this skill to organize, prune, and archive context during memory operations or compactions.
---

# Memory Tiering Skill 🧠⚖️

## Overview

  This skill implements a dynamic, three-tiered memory architecture to optimize context usage and retrieval efficiency. 

## When to Use

- Tiered memory storage

## OVERVIEW_PLACEHOLDER ## The Three Tiers

1.  **🔥 HOT (memory/hot/HOT_MEMORY.md)**:
    *   **Focus**: Current session context, active tasks, temporary credentials, immediate goals.
    *   **Management**: Updated frequently. Pruned aggressively once tasks are completed.
2.  **🌡️ WARM (memory/warm/WARM_MEMORY.md)**:
    *   **Focus**: User preferences (Hui's style, timezone), core system inventory, stable configurations, recurring interests.
    *   **Management**: Updated when preferences change or new stable tools are added.
3.  **❄️ COLD (MEMORY.md)**:
    *   **Focus**: Long-term archive, historical decisions, project milestones, distilled lessons.
    *   **Management**: Updated during archival phases. Detail is replaced by summaries.

## Workflow: `Organize-Memory`

Whenever a memory reorganization is triggered (manual or post-compaction), follow these steps:

### Step 1: Ingest & Audit
- Read all three tiers and recent daily logs (`memory/YYYY-MM-DD.md`).
- Identify "Dead Context" (completed tasks, resolved bugs).

### Step 2: Tier Redistribution
- **Move to HOT**: Anything requiring immediate attention in the next 2-3 turns.
- **Move to WARM**: New facts about the user or system that are permanent.
- **Move to COLD**: Completed high-level project summaries.

### Step 3: Pruning & Summarization
- Remove granular details from COLD.
- Ensure credentials in HOT point to their root files rather than storing raw secrets (if possible).

### Step 4: Verification
- Ensure no critical information was lost during the move.
- Verify that `HOT` is now small enough for efficient context use.

## Usage Trigger
- Trigger manually with: "Run memory tiering" or "整理记忆层级".
- Trigger automatically after any `/compact` command.

## Tools

## Examples

### Basic Example

```bash
# Run the skill
skill --help
```

### Advanced Example

```bash
# With options
skill run --verbose --input "data"
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

## Detailed Examples

### Example 1

```bash
# Basic usage
skill --help

# Run with input
skill run --input "data"

# Advanced usage
skill run --input "data" --output "result" --verbose
```

### Example 2

```bash
# Batch processing
skill batch --files "*.txt"

# With options
skill batch --files "*.txt" --output-dir ./results
```

---
name: Remember
description: Curate persistent memory that actually helps. Filter what matters, organize by function, decay what doesn't.
description_zh: Curte 持久化 mem或y tht ctully helps. Filter wht mtters, 或gnize by function, decy wht doesn't.。
version: 1.1.0
---

## The Problem with Most Memory


## 中文说明

### 简介

Remember - Curate persistent memory that actually helps. Filter what matters, organize by function, decay what doesn't.

### 使用方法

此 Skill 已安装到 `/home/node/.openclaw/workspace/skills/remember/`

1. 查看 SKILL.md 了解详细用法
2. 如有 scripts/run.sh，可直接运行
3. 参照 Examples 章节中的命令进行操作

### 适用场景

- 请参考 ## When to Use 章节
- 如有疑问，请查看 ## Troubleshooting 章节

### 快速开始

```bash
# 查看帮助
cd /home/node/.openclaw/workspace/skills/remember
cat SKILL.md

# 运行（如有脚本）
./scripts/run.sh
```

### 注意事项

- 请确保已安装所需依赖
- 建议先阅读 ## Setup 或 ## Installation 章节
- 详细配置说明见 ## Configuration 章节

Storing everything creates noise. Wrong retrieval is worse than no memory. The goal isn't maximum recall — it's retrieving the right thing at the right time.

## What's Actually Worth Remembering

**High value (persist indefinitely):**
- Commitments made — "I said I'd do X by Y"
- Learned corrections — "User told me NOT to do Z"  
- Explicit preferences — "I hate verbose responses"
- Core relationships — "Maria is the designer on Project X"

**Medium value (persist with review):**
- Project/context state — what's active, current status
- Domain lessons — patterns, gotchas, how things work here
- Decisions made — what was chosen and why

**Low value (don't persist):**
- One-off questions, easily reconstructible facts, transient context

## Organize by Function, Not Content

Structure by how you'll retrieve it. Adapt categories to your domain:

```
memory/
├── commitments.md    # Promises, deadlines (with dates!)
├── preferences.md    # Likes/dislikes, style, boundaries
├── corrections.md    # Mistakes not to repeat
├── decisions.md      # What was decided and why
├── relationships.md  # People, roles, context
└── contexts/         # Per-project or per-client state
    └── {name}.md
```

## Memory Hygiene

**Every entry needs:**
- Date recorded (when did I learn this?)
- Source hint (explicit statement vs inference)
- Confidence (certain / likely / guess)

**Prune aggressively:**
- Completed commitments older than 30 days → archive
- Inactive contexts → move to `archive/`
- Contradictions → keep newest, note the change

**The staleness test:** "If retrieved in 6 months, will this help or mislead?"

## Handling Contradictions

When new info conflicts with old:
1. Don't silently overwrite — note the change
2. Keep the newer version as active
3. Optionally log: `[Updated 2026-02-11] Was: X, Now: Y`

## User Control

- "Remember this" → explicit save with category
- "Forget that" → explicit delete  
- "What do you know about X?" → transparency
- "Never remember Y" → hard privacy boundary

See `categories.md` for domain-specific templates.
See `consolidation.md` for the review/prune process.

---
*Related: reflection (self-evaluation), loop (iterative refinement)*

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

## Overview

Curate persistent memory that actually helps. Filter what matters, organize by function, decay what doesn't.

## When to Use

- TODO: add common use cases

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

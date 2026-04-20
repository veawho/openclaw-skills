---
name: knowledge
description: Unified knowledge capture and retrieval for URLs, video/article/paper extracts, social posts, and agent research outputs. Use when saving anything worth re-finding later, summarizing external content, tracking sourced claims, or answering "where did we store that?" questions.
description_zh: Unified knowledge cpture 和 retrievl 用于 URLs, 视频/rticle/pper 提取s, socil posts, 和 智能体 re搜索 outputs. 用于 sving nything w或th re-finding lter, summrizing externl content, 跟踪ing sourced clims, 或 nswering "where did we st或e tht?" questions.。
---

# Knowledge Skill


## 中文说明

### 简介

knowledge - Unified knowledge capture and retrieval for URLs, video/article/paper extracts, social posts, and agent research outputs. Use when saving anything worth re-finding later, summarizing external content, tracking sourced claims, or answering "where did we store that?" questions.

### 使用方法

此 Skill 已安装到 `/home/node/.openclaw/workspace/skills/agent-knowledge/`

1. 查看 SKILL.md 了解详细用法
2. 如有 scripts/run.sh，可直接运行
3. 参照 Examples 章节中的命令进行操作

### 适用场景

- 请参考 ## When to Use 章节
- 如有疑问，请查看 ## Troubleshooting 章节

### 快速开始

```bash
# 查看帮助
cd /home/node/.openclaw/workspace/skills/agent-knowledge
cat SKILL.md

# 运行（如有脚本）
./scripts/run.sh
```

### 注意事项

- 请确保已安装所需依赖
- 建议先阅读 ## Setup 或 ## Installation 章节
- 详细配置说明见 ## Configuration 章节

## Overview

  File-based knowledge organization. Capture fast, search later, clean up automatically. 

## When to Use

- Agent knowledge management

## OVERVIEW_PLACEHOLDER ## Installation

```bash
clawhub install knowledge
```

This installs `scripts/know` — add to PATH or use full path:
```bash
~/.openclaw/skills/knowledge/scripts/know
```

## Storage Location

Default: `~/.soulshare/agent/knowledge/`

Configurable via `~/.config/know/config` or env `KNOWLEDGE_DIR`.

```
knowledge/
├── INDEX.md      # Auto-maintained browsable index
├── urls/         # Bookmarked URLs
├── extracts/     # Video/article/paper summaries
├── posts/        # Social content (tweets, threads)
└── research/     # Agent-generated research
```

## Adding Content

```bash
know add url <url> --title "..." --tags "a,b" [--summary "..."]
know add video <url> --title "..." --tags "a,b" [--summary "..."]
know add extract --source <url> --type video|article|paper --title "..." --tags "a,b"
know add post --source <url> --title "..." --tags "a,b"
know add research --title "..." --tags "a,b" [--summary "..."]
```

Each add writes a markdown file with YAML frontmatter and updates `INDEX.md`.

## Searching

```bash
know search "query"           # Grep across all entries
know recent --limit 10        # Recent entries
know list --tags security     # Filter by tag
```

## Cleanup & Maintenance

```bash
know tidy                     # Audit: find issues
know tidy --fix               # Auto-fix: normalize tags, move misplaced files, remove empty
know validate                 # Check frontmatter schema
know reindex                  # Rebuild INDEX.md
know config                   # Show active config paths
```

**Recommended:** Run `know tidy --fix` in heartbeats or nightly cron.

## Data Model (frontmatter)

```yaml
---
type: url|extract|post|research
title: "Entry title"
source_url: "https://..."
source_kind: url|video|article|paper|post|research
tags: ["tag1", "tag2"]
added: "2026-02-26"
added_by: "agent-name"
summary: "One-line summary"
---
```

## QMD Integration

Plain markdown → QMD-indexable.

```bash
qmd collection add ~/.soulshare/agent/knowledge --name knowledge
qmd search "query" --collection knowledge
```

## Discipline

- If it's useful later → `know add` immediately
- Don't leave knowledge only in `memory/YYYY-MM-DD.md`
- Every entry needs tags + summary
- Let `know tidy --fix` handle normalization

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

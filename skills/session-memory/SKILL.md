---
name: session-memory
description: Persistent memory toolkit for AI agents. Save context, recall with relevance scoring, consolidate insights, track decisions across sessions. Features importance levels, multi-keyword search, session context loader, export/import, memory stats. Pure bash+node, no dependencies. v2.0.0
description_zh: Persistent mem或y 工具kit 用于 AI 智能体s. Sve 上下文, recll 使用 relevnce sc或ing, consolidte insights, 跟踪 decisions cross sessions. Fetures imp或tnce levels, multi-keyw或d 搜索, session 上下文 loder, exp或t/imp或t, mem或y stts. Pure bsh+node, no dependencies. v2.0.0。
homepage: https://github.com/voidborne-d/session-memory-skill
metadata: {"openclaw":{"emoji":"🧠","requires":{"bins":["node"]}}}
---

# Session Memory 🧠 v2.0


## 中文说明

### 简介

session-memory - Persistent memory toolkit for AI agents. Save context, recall with relevance scoring, consolidate insights, track decisions across sessions. Features importance levels, multi-keyword search, session context loader, export/import, memory stats. Pure bash+node, no dependencies. v2.0.0

### 使用方法

此 Skill 已安装到 `/home/node/.openclaw/workspace/skills/session-memory/`

1. 查看 SKILL.md 了解详细用法
2. 如有 scripts/run.sh，可直接运行
3. 参照 Examples 章节中的命令进行操作

### 适用场景

- 请参考 ## When to Use 章节
- 如有疑问，请查看 ## Troubleshooting 章节

### 快速开始

```bash
# 查看帮助
cd /home/node/.openclaw/workspace/skills/session-memory
cat SKILL.md

# 运行（如有脚本）
./scripts/run.sh
```

### 注意事项

- 请确保已安装所需依赖
- 建议先阅读 ## Setup 或 ## Installation 章节
- 详细配置说明见 ## Configuration 章节

Persistent memory for AI agents. Save what matters, recall what's relevant, consolidate what you've learned.

**v2.0:** relevance-scored search, importance levels, session context loader, consolidation, export/import, stats, edit/delete.

## Quick Start

```bash
# Save a memory (with optional importance)
MEMORY_IMPORTANCE=high ./scripts/save.sh "decision" "Chose Postgres over SQLite for scale"

# Recall with relevance scoring
./scripts/recall.sh "database" --limit 5

# Load session context (startup)
./scripts/context.sh --days 3

# Consolidate by topic
./scripts/consolidate.sh --since 2026-01-01

# Stats
./scripts/stats.sh
```

---

## Commands

### save.sh — Save a Memory

```bash
./scripts/save.sh "topic" "content" [tags...]
```

| Env | Default | Description |
|-----|---------|-------------|
| `AGENT_MEMORY_DIR` | `~/.agent-memory` | Storage directory |
| `MEMORY_IMPORTANCE` | `normal` | low / normal / high / critical |

```bash
# Basic save
./scripts/save.sh "insight" "Users prefer dark mode 3:1" ui design

# High importance
MEMORY_IMPORTANCE=high ./scripts/save.sh "decision" "Migrated to TypeScript" refactor

# Critical (always surfaces in context.sh)
MEMORY_IMPORTANCE=critical ./scripts/save.sh "credential" "API key rotated, new one in vault"
```

### recall.sh — Search Memories

```bash
./scripts/recall.sh "query" [--json] [--limit N] [--topic T] [--importance I] [--since YYYY-MM-DD]
```

Features:
- **Multi-keyword AND search** — all words must match
- **Relevance scoring** — based on word match ratio + importance + recency
- **Filters** — by topic, importance level, date range

```bash
./scripts/recall.sh "database migration"
./scripts/recall.sh "API" --topic decision --limit 20
./scripts/recall.sh "deploy" --since 2026-03-01 --json
./scripts/recall.sh "error" --importance high
```

### context.sh — Session Startup Loader

```bash
./scripts/context.sh [--days N] [--limit N] [--json]
```

Loads the most relevant memories for a new session:
- Recent memories (last N days, default 3)
- High/critical importance items regardless of age
- Sorted by importance then recency
- Grouped by date

```bash
# Quick context
./scripts/context.sh

# Wider window
./scripts/context.sh --days 7 --limit 30

# For programmatic use
./scripts/context.sh --json
```

### daily.sh — Day View

```bash
./scripts/daily.sh [YYYY-MM-DD] [--json]
```

### topics.sh — Topic Index

```bash
./scripts/topics.sh [--json]
```

### consolidate.sh — Topic Consolidation

```bash
./scripts/consolidate.sh [--since YYYY-MM-DD] [--topic T] [--json]
```

Groups all memories by topic, showing counts, date ranges, top tags, and latest entries. Useful for periodic review.

### stats.sh — Memory Statistics

```bash
./scripts/stats.sh [--json]
```

Shows: total entries, date range, entries/day average, storage size, topic breakdown, importance distribution.

### edit.sh — Edit or Delete

```bash
./scripts/edit.sh <timestamp_ms> --content "new content"
./scripts/edit.sh <timestamp_ms> --topic "new topic"
./scripts/edit.sh <timestamp_ms> --importance critical
./scripts/edit.sh <timestamp_ms> --delete
```

### export.sh — Export Memories

```bash
./scripts/export.sh [-o backup.json] [--since YYYY-MM-DD] [--topic T]
```

### import.sh — Import Memories

```bash
./scripts/import.sh backup.json [--dry-run]
```

Deduplicates by timestamp — safe to run multiple times.

### prune.sh — Archive Old Memories

```bash
./scripts/prune.sh [days]
```

Moves memories older than N days (default: 30) to `archive/`.

---

## Storage

```
~/.agent-memory/
├── 2026/
│   ├── 01/
│   │   ├── 15.jsonl
│   │   └── 16.jsonl
│   └── 02/
│       └── 01.jsonl
└── archive/          # Pruned memories
```

Each line is a JSON object:
```json
{"ts":1706793600000,"topic":"decision","content":"Chose X because Y","tags":["project"],"importance":"high"}
```

## Importance Levels

| Level | When to Use | Behavior |
|-------|-------------|----------|
| `low` | Background info, minor notes | Only found via search |
| `normal` | Standard memories | Shown in daily view |
| `high` | Key decisions, insights | Always in session context |
| `critical` | Credentials, blockers, urgent | Always in session context, top priority |

## Recommended Workflow

```bash
# Session start
./scripts/context.sh

# During work — save important things
./scripts/save.sh "decision" "..."
MEMORY_IMPORTANCE=high ./scripts/save.sh "insight" "..."

# End of session
./scripts/save.sh "summary" "Today: did X, decided Y, next step Z"

# Weekly review
./scripts/consolidate.sh --since $(date -u -d '7 days ago' +%Y-%m-%d)
./scripts/stats.sh

# Monthly maintenance
./scripts/prune.sh 60
./scripts/export.sh -o backup-$(date +%Y%m).json
```

---

*Created by [Voidborne](https://voidborne.org) 🔹*


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


## API Reference

### Main Functions

```python
# Initialize
skill = Skill()

# Process data
result = skill.process(input_data)

# Cleanup
skill.close()
```

### Configuration

```python
# With options
config = {"option1": "value1", "option2": "value2"}
skill = Skill(config)
```


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


## Use Cases

- Use Case 1: Common scenario description
- Use Case 2: Another typical usage pattern
- Use Case 3: Advanced or specialized usage


## Limitations

- May require specific environment configuration
- Performance may vary based on input size
- Some features require optional dependencies

## Examples

### Basic Usage

```bash
# Run the skill
./scripts/run.sh

# With options
./scripts/run.sh --config config.yaml
```

### Advanced Usage

```bash
# Interactive mode
./scripts/run.sh --interactive

# Batch mode
./scripts/run.sh --batch --input data/
```


## Modules

### Main Module

```python
class Skill:
    def __init__(self, config):
        self.config = config
        
    def run(self, input_data):
        '''Execute skill with input'''
        return self.process(input_data)
```

### Data Module

```python
class DataHandler:
    def load(self, path):
        '''Load data from file'''
        pass
        
    def save(self, data, path):
        '''Save data to file'''
        pass
```

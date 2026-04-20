---
name: percept-summarize
description: Automatic conversation summaries with entity extraction and relationship mapping.
---

# percept-summarize


## 中文说明

### 简介

percept-summarize - Automatic conversation summaries with entity extraction and relationship mapping.

### 使用方法

此 Skill 已安装到 `/home/node/.openclaw/workspace/skills/percept-summarize/`

1. 查看 SKILL.md 了解详细用法
2. 如有 scripts/run.sh，可直接运行
3. 参照 Examples 章节中的命令进行操作

### 适用场景

- 请参考 ## When to Use 章节
- 如有疑问，请查看 ## Troubleshooting 章节

### 快速开始

```bash
# 查看帮助
cd /home/node/.openclaw/workspace/skills/percept-summarize
cat SKILL.md

# 运行（如有脚本）
./scripts/run.sh
```

### 注意事项

- 请确保已安装所需依赖
- 建议先阅读 ## Setup 或 ## Installation 章节
- 详细配置说明见 ## Configuration 章节

Automatic conversation summaries with entity extraction and relationship mapping.

## What it does

When a conversation ends (60 seconds of silence), Percept generates an AI-powered summary with extracted entities (people, companies, topics), action items, and relationship connections. Summaries are stored locally and searchable.

## When to use

- User asks "what did we talk about?" or "summarize that meeting"
- User wants meeting notes or action items from a conversation
- Agent needs context from a recent conversation

## Requirements

- **percept-listen** skill installed and running
- **OpenClaw agent** accessible via CLI (used for LLM summarization)

## How it works

1. Conversation ends (60s silence timeout)
2. Percept builds a speaker-tagged transcript
3. Sends transcript to OpenClaw for AI summarization
4. Extracts entities (people, orgs, topics) and relationships
5. Stores summary + entities in SQLite
6. Entities linked via relationship graph (works_on, client_of, mentioned_with)

## Entity resolution

5-tier cascade for identifying entities:
1. **Exact match** (confidence 1.0)
2. **Fuzzy match** (0.8) — handles typos, nicknames
3. **Contextual/graph** (0.7) — uses relationship connections
4. **Recency** (0.6) — recently mentioned entities ranked higher
5. **Semantic search** (0.5) — vector similarity via LanceDB

## Querying summaries

Summaries are searchable via the Percept dashboard (port 8960) or SQLite directly:

```sql
SELECT * FROM conversations WHERE summary LIKE '%action items%' ORDER BY end_time DESC;
```

Full-text search via FTS5:
```sql
SELECT * FROM utterances_fts WHERE utterances_fts MATCH 'project deadline';
```

## Data retention

- Utterances: 30 days
- Summaries: 90 days
- Relationships: 180 days
- Speaker profiles: never expire

## Links

- **GitHub:** https://github.com/GetPercept/percept

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


## Configuration

### Environment Variables

- `CONFIG_PATH` - Path to configuration file
- `LOG_LEVEL` - Logging level (debug, info, warn, error)

### Quick Setup

```bash
# Install dependencies
pip install -r requirements.txt

# Configure
cp config.example.yaml config.yaml

# Run
python main.py
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

## Setup

### Prerequisites

- Required dependencies listed below
- System requirements

### Installation

```bash
# Install via pip
pip install skill_name

# Or from source
git clone https://github.com/example/skill.git
cd skill
pip install -e .
```

### Configuration

Create a config file or set environment variables as needed.

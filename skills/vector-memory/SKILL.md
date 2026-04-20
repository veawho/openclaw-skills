---
name: vector-memory
description: Smart memory search with automatic vector fallback. Uses semantic embeddings when available, falls back to built-in search otherwise. Zero configuration - works immediately after ClawHub install. No setup required - just install and memory_search works immediately, gets better after optional sync.
description_zh: Smrt mem或y 搜索 使用 utomtic vect或 fllbck. Uses semntic 嵌入s when vilble, flls bck to built-in 搜索 orwise. Zero 配置 - w或ks immeditely fter ClwHub instll. No 设置 required - just instll 和 mem或y_搜索 w或ks immeditely, gets better fter optionl sync.。
---

# Vector Memory


## 中文说明

### 简介

vector-memory - Smart memory search with automatic vector fallback. Uses semantic embeddings when available, falls back to built-in search otherwise. Zero configuration - works immediately after ClawHub install. No setup required - just install and memory_search works immediately, gets better after optional sync.

### 使用方法

此 Skill 已安装到 `/home/node/.openclaw/workspace/skills/vector-memory/`

1. 查看 SKILL.md 了解详细用法
2. 如有 scripts/run.sh，可直接运行
3. 参照 Examples 章节中的命令进行操作

### 适用场景

- 请参考 ## When to Use 章节
- 如有疑问，请查看 ## Troubleshooting 章节

### 快速开始

```bash
# 查看帮助
cd /home/node/.openclaw/workspace/skills/vector-memory
cat SKILL.md

# 运行（如有脚本）
./scripts/run.sh
```

### 注意事项

- 请确保已安装所需依赖
- 建议先阅读 ## Setup 或 ## Installation 章节
- 详细配置说明见 ## Configuration 章节

## Overview

Smart memory search with automatic vector fallback. Uses semantic embeddings when available, falls back to built-in search otherwise. Zero configuration - works immediately after ClawHub install. No setup required - just install and memory_search works immediately, gets better after optional sync.

## When to Use

- TODO: add common use cases


Smart memory search that **automatically selects the best method**:
- **Vector search** (semantic, high quality) when synced
- **Built-in search** (keyword, fast) as fallback

**Zero configuration required.** Works immediately after install.

## Quick Start

### Install from ClawHub
```bash
npx clawhub install vector-memory
```

Done! `memory_search` now works with automatic method selection.

### Optional: Sync for Better Results
```bash
node vector-memory/smart_memory.js --sync
```

After sync, searches use neural embeddings for semantic understanding.

## How It Works

### Smart Selection
```javascript
// Same call, automatic best method
memory_search("James principles values") 

// If vector ready: finds "autonomy, competence, creation" (semantic match)
// If not ready: uses keyword search (fallback)
```

### Behavior Flow
1. **Check**: Is vector index ready?
2. **Yes**: Use semantic search (synonyms, concepts)
3. **No**: Use built-in search (keywords)
4. **Vector fails**: Automatically fall back

## Tools

### memory_search
**Auto-selects best method**

Parameters:
- `query` (string): Search query
- `max_results` (number): Max results (default: 5)

Returns: Matches with path, lines, score, snippet

### memory_get
Get full content from file.

### memory_sync
Index memory files for vector search. Run after edits.

### memory_status
Check which method is active.

## Comparison

| Feature | Built-in | Vector | Smart Wrapper |
|---------|----------|--------|---------------|
| Synonyms | ❌ | ✅ | ✅ (when ready) |
| Setup | Built-in | Requires sync | ✅ Zero config |
| Fallback | N/A | Manual | ✅ Automatic |

## Usage

**Immediate (no action needed):**
```bash
node vector-memory/smart_memory.js --search "query"
```

**Better quality (after sync):**
```bash
# One-time setup
node vector-memory/smart_memory.js --sync

# Now all searches use vector
node vector-memory/smart_memory.js --search "query"
```

## Files

| File | Purpose |
|------|---------|
| `smart_memory.js` | Main entry - auto-selects method |
| `vector_memory_local.js` | Vector implementation |
| `memory.js` | OpenClaw wrapper |

## Configuration

**None required.** 

Optional environment variables:
```bash
export MEMORY_DIR=/path/to/memory
export MEMORY_FILE=/path/to/MEMORY.md
```

## Scaling

- **< 1000 chunks**: Built-in + JSON (current)
- **> 1000 chunks**: Use pgvector (see references/pgvector.md)

## References

- [Integration](references/integration.md) - Detailed setup
- [pgvector](references/pgvector.md) - Large-scale deployment

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


## Limitations

- May require specific environment configuration
- Performance may vary based on input size
- Some features require optional dependencies

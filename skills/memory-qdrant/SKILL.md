---
name: memory-qdrant
description: Local semantic memory with Qdrant and Transformers.js. Store, search, and recall conversation context using vector embeddings (fully local, no API keys).
version: 1.0.10
author: zuiho-kai
homepage: https://github.com/zuiho-kai/openclaw-memory-qdrant
tags: [memory, semantic-search, qdrant, transformers, embeddings, local-ai, vector-db, context]
metadata:
  openclaw:
    requires:
      bins: [node, npm]
---

# memory-qdrant


## 中文说明

### 简介

memory-qdrant - Local semantic memory with Qdrant and Transformers.js. Store, search, and recall conversation context using vector embeddings (fully local, no API keys).

### 使用方法

此 Skill 已安装到 `/home/node/.openclaw/workspace/skills/memory-qdrant/`

1. 查看 SKILL.md 了解详细用法
2. 如有 scripts/run.sh，可直接运行
3. 参照 Examples 章节中的命令进行操作

### 适用场景

- 请参考 ## When to Use 章节
- 如有疑问，请查看 ## Troubleshooting 章节

### 快速开始

```bash
# 查看帮助
cd /home/node/.openclaw/workspace/skills/memory-qdrant
cat SKILL.md

# 运行（如有脚本）
./scripts/run.sh
```

### 注意事项

- 请确保已安装所需依赖
- 建议先阅读 ## Setup 或 ## Installation 章节
- 详细配置说明见 ## Configuration 章节

## Overview

Local semantic memory with Qdrant and Transformers.js. Store, search, and recall conversation context using vector embeddings (fully local, no API keys).

## When to Use

- TODO: add common use cases


**Use when** you need your OpenClaw agent to remember and recall information across conversations using semantic search.

Local semantic memory plugin powered by Qdrant vector database and Transformers.js embeddings. Zero configuration, fully local, no API keys required.

## Features

- Semantic search with local Transformers.js embeddings
- In-memory mode (zero config) or persistent Qdrant storage
- Optional auto-capture of conversation context (opt-in, disabled by default)
- Context-aware memory recall
- Fully local, no API keys or external services required

## Installation

```bash
clawhub install memory-qdrant
```

**First-time setup:** This plugin downloads a 25MB embedding model from Hugging Face on first run and may require build tools for native dependencies (sharp, onnxruntime). See [README](https://github.com/zuiho-kai/openclaw-memory-qdrant#readme) for detailed installation requirements.

## Configuration

Enable in your OpenClaw config:

```json
{
  "plugins": {
    "memory-qdrant": {
      "enabled": true
    }
  }
}
```

**Options:**
- `autoCapture` (default: false) - Auto-record conversations. Note: trigger patterns include email/phone regex, so enabling this may capture PII.
- `autoRecall` (default: true) - Auto-inject relevant memories
- `qdrantUrl` (optional) - External Qdrant server (leave empty for in-memory)

## Usage

Three tools available:

**memory_store** - Save information
```javascript
memory_store({
  text: "User prefers Opus for complex tasks",
  category: "preference"
})
```

**memory_search** - Find relevant memories
```javascript
memory_search({
  query: "workflow preferences",
  limit: 5
})
```

**memory_forget** - Delete memories
```javascript
memory_forget({ memoryId: "uuid" })
// or
memory_forget({ query: "text to forget" })
```

## Privacy & Security

- **In-memory mode** (default): Data cleared on restart
- **Qdrant mode**: Data sent to configured server (use trusted servers only)
- **Network**: Downloads ~25MB model from Hugging Face on first run
- **autoCapture**: Disabled by default for privacy. Trigger patterns match emails and phone-like numbers, so enabling autoCapture can capture PII.

## Technical Details

- Vector DB: Qdrant (in-memory or external)
- Embeddings: Xenova/all-MiniLM-L6-v2 (local)
- Module: ES6 with factory function pattern

## Links

- GitHub: https://github.com/zuiho-kai/openclaw-memory-qdrant
- Issues: https://github.com/zuiho-kai/openclaw-memory-qdrant/issues

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

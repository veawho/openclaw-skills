---
name: pinecone
description: "Pinecone vector database — manage indexes, upsert vectors, query similarity search, manage namespaces, and track collections via the Pinecone API. Build semantic search, recommendation systems, and RAG pipelines with high-performance vector storage. Built for AI agents — Python stdlib only, zero dependencies. Use for vector search, semantic similarity, RAG applications, recommendation engines, and AI memory systems."
description_zh: "Pinecone 向量数据库 — 管理 索引, upsert 向量, query 相似性搜索, 管理 命名空间, 和 跟踪 集合 通过 Pinecone API. Build 语义搜索, 推荐 systems, 和 RAG pipelines 使用 高性能 vect或 st或ge. Built 用于 AI 智能体s — 仅使用 Python 标准库, 零依赖. Use 用于 vect或 搜索, semntic similrity, RAG pplictions, 推荐 engines, 和 AI 记忆系统s."。
homepage: https://www.agxntsix.ai
license: MIT
compatibility: Python 3.10+ (stdlib only — no dependencies)
metadata: {"openclaw": {"emoji": "🌲", "requires": {"env": ["PINECONE_API_KEY"]}, "primaryEnv": "PINECONE_API_KEY", "homepage": "https://www.agxntsix.ai"}}
---

# 🌲 Pinecone


## 中文说明

### 简介

pinecone - "Pinecone vector database — manage indexes, upsert vectors, query similarity search, manage namespaces, and track collections via the Pinecone API. Build semantic search, recommendation systems, and RAG pipelines with high-performance vector storage. Built for AI agents — Python stdlib only, zero dependencies. Use for vector search, semantic similarity, RAG applications, recommendation engines, and AI memory systems."

### 使用方法

此 Skill 已安装到 `/home/node/.openclaw/workspace/skills/pinecone/`

1. 查看 SKILL.md 了解详细用法
2. 如有 scripts/run.sh，可直接运行
3. 参照 Examples 章节中的命令进行操作

### 适用场景

- 请参考 ## When to Use 章节
- 如有疑问，请查看 ## Troubleshooting 章节

### 快速开始

```bash
# 查看帮助
cd /home/node/.openclaw/workspace/skills/pinecone
cat SKILL.md

# 运行（如有脚本）
./scripts/run.sh
```

### 注意事项

- 请确保已安装所需依赖
- 建议先阅读 ## Setup 或 ## Installation 章节
- 详细配置说明见 ## Configuration 章节

## Overview

Pinecone vector database — manage indexes, upsert vectors, query similarity search, manage namespaces, and track collections via the Pinecone API. Build semantic search, recommendation systems, and RAG pipelines with high-performance vector storage. Built for AI agents — Python stdlib only, zero dependencies. Use for vector search, semantic similarity, RAG applications, recommendation engines, and AI memory systems.

## When to Use

- TODO: add common use cases


Pinecone vector database — manage indexes, upsert vectors, query similarity search, manage namespaces, and track collections via the Pinecone API.

## Features

- **Index management** — create, configure, delete indexes
- **Vector upsert** — insert and update vectors with metadata
- **Similarity search** — query nearest neighbors
- **Namespace management** — organize vectors by namespace
- **Metadata filtering** — filter queries by metadata fields
- **Collection management** — create snapshots of indexes
- **Batch operations** — bulk upsert and delete
- **Index stats** — vector counts, dimensions, usage
- **Sparse-dense** — hybrid search with sparse vectors
- **Serverless** — auto-scaling serverless indexes

## Requirements

| Variable | Required | Description |
|----------|----------|-------------|
| `PINECONE_API_KEY` | ✅ | API key/token for Pinecone |

## Quick Start

```bash
# List indexes
python3 {baseDir}/scripts/pinecone.py indexes
```

```bash
# Get index details
python3 {baseDir}/scripts/pinecone.py index-get my-index
```

```bash
# Create an index
python3 {baseDir}/scripts/pinecone.py index-create '{"name":"my-index","dimension":1536,"metric":"cosine","spec":{"serverless":{"cloud":"aws","region":"us-east-1"}}}'
```

```bash
# Delete an index
python3 {baseDir}/scripts/pinecone.py index-delete my-index
```



## Commands

### `indexes`
List indexes.
```bash
python3 {baseDir}/scripts/pinecone.py indexes
```

### `index-get`
Get index details.
```bash
python3 {baseDir}/scripts/pinecone.py index-get my-index
```

### `index-create`
Create an index.
```bash
python3 {baseDir}/scripts/pinecone.py index-create '{"name":"my-index","dimension":1536,"metric":"cosine","spec":{"serverless":{"cloud":"aws","region":"us-east-1"}}}'
```

### `index-delete`
Delete an index.
```bash
python3 {baseDir}/scripts/pinecone.py index-delete my-index
```

### `upsert`
Upsert vectors.
```bash
python3 {baseDir}/scripts/pinecone.py upsert --index my-index '{"vectors":[{"id":"vec1","values":[0.1,0.2,...],"metadata":{"text":"hello"}}]}'
```

### `query`
Query similar vectors.
```bash
python3 {baseDir}/scripts/pinecone.py query --index my-index '{"vector":[0.1,0.2,...],"topK":10,"includeMetadata":true}'
```

### `fetch`
Fetch vectors by ID.
```bash
python3 {baseDir}/scripts/pinecone.py fetch --index my-index --ids vec1,vec2,vec3
```

### `delete`
Delete vectors.
```bash
python3 {baseDir}/scripts/pinecone.py delete --index my-index --ids vec1,vec2
```

### `delete-namespace`
Delete all vectors in namespace.
```bash
python3 {baseDir}/scripts/pinecone.py delete-namespace --index my-index --namespace docs
```

### `stats`
Get index statistics.
```bash
python3 {baseDir}/scripts/pinecone.py stats --index my-index
```

### `collections`
List collections.
```bash
python3 {baseDir}/scripts/pinecone.py collections
```

### `collection-create`
Create collection from index.
```bash
python3 {baseDir}/scripts/pinecone.py collection-create '{"name":"backup","source":"my-index"}'
```

### `namespaces`
List namespaces in index.
```bash
python3 {baseDir}/scripts/pinecone.py namespaces --index my-index
```


## Output Format

All commands output JSON by default. Add `--human` for readable formatted output.

```bash
# JSON (default, for programmatic use)
python3 {baseDir}/scripts/pinecone.py indexes --limit 5

# Human-readable
python3 {baseDir}/scripts/pinecone.py indexes --limit 5 --human
```

## Script Reference

| Script | Description |
|--------|-------------|
| `{baseDir}/scripts/pinecone.py` | Main CLI — all Pinecone operations |

## Data Policy

This skill **never stores data locally**. All requests go directly to the Pinecone API and results are returned to stdout. Your data stays on Pinecone servers.

## Credits
---
Built by [M. Abidi](https://www.linkedin.com/in/mohammad-ali-abidi) | [agxntsix.ai](https://www.agxntsix.ai)
[YouTube](https://youtube.com/@aiwithabidi) | [GitHub](https://github.com/aiwithabidi)
Part of the **AgxntSix Skill Suite** for OpenClaw agents.

📅 **Need help setting up OpenClaw for your business?** [Book a free consultation](https://cal.com/agxntsix/abidi-openclaw)


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


## Limitations

- May require specific environment configuration
- Performance may vary based on input size
- Some features require optional dependencies

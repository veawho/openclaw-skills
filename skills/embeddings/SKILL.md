---
name: Embeddings
slug: embeddings
description: Generate, store, and search vector embeddings with provider selection, chunking strategies, and similarity search optimization.
description_zh: Generte, st或e, 和 搜索 vect或 嵌入s 使用 provider selection, chunking strtegies, 和 相似性搜索 optimiztion.。
---

## When to Use


## 中文说明

### 简介

Embeddings - Generate, store, and search vector embeddings with provider selection, chunking strategies, and similarity search optimization.

### 使用方法

此 Skill 已安装到 `/home/node/.openclaw/workspace/skills/embeddings/`

1. 查看 SKILL.md 了解详细用法
2. 如有 scripts/run.sh，可直接运行
3. 参照 Examples 章节中的命令进行操作

### 适用场景

- 请参考 ## When to Use 章节
- 如有疑问，请查看 ## Troubleshooting 章节

### 快速开始

```bash
# 查看帮助
cd /home/node/.openclaw/workspace/skills/embeddings
cat SKILL.md

# 运行（如有脚本）
./scripts/run.sh
```

### 注意事项

- 请确保已安装所需依赖
- 建议先阅读 ## Setup 或 ## Installation 章节
- 详细配置说明见 ## Configuration 章节

User wants to convert text/images to vectors, build semantic search, or integrate embeddings into applications.

## Quick Reference

| Topic | File |
|-------|------|
| Provider comparison & selection | `providers.md` |
| Chunking strategies & code | `chunking.md` |
| Vector database patterns | `storage.md` |
| Search & retrieval tuning | `search.md` |

## Core Capabilities

1. **Generate embeddings** — Call provider APIs (OpenAI, Cohere, Voyage, local models)
2. **Chunk content** — Split documents with overlap, semantic boundaries, token limits
3. **Store vectors** — Insert into Pinecone, Weaviate, Qdrant, pgvector, Chroma
4. **Similarity search** — Query with top-k, filters, hybrid search
5. **Batch processing** — Handle large datasets with rate limiting and retries
6. **Model comparison** — Evaluate embedding quality for specific use cases

## Decision Checklist

Before recommending approach, ask:
- [ ] What content type? (text, code, images, multimodal)
- [ ] Volume and update frequency?
- [ ] Latency requirements? (real-time vs batch)
- [ ] Budget constraints? (API costs vs self-hosted)
- [ ] Existing infrastructure? (cloud provider, database)

## Critical Rules

- **Same model everywhere** — Query embeddings MUST use identical model as document embeddings
- **Normalize before storage** — Most similarity metrics assume unit vectors
- **Chunk with overlap** — 10-20% overlap prevents context loss at boundaries
- **Batch API calls** — Never embed one item at a time in production
- **Cache embeddings** — Regenerating is expensive; store with source hash
- **Monitor dimensions** — Higher isn't always better; 768-1536 is usually optimal

## Provider Quick Selection

| Need | Provider | Why |
|------|----------|-----|
| Best quality, any cost | OpenAI `text-embedding-3-large` | Top benchmarks |
| Cost-sensitive | OpenAI `text-embedding-3-small` | 5x cheaper, 80% quality |
| Multilingual | Cohere `embed-multilingual-v3` | 100+ languages |
| Code/technical | Voyage `voyage-code-2` | Optimized for code |
| Privacy/offline | Local (e5, bge, nomic) | No data leaves machine |
| Images | OpenAI CLIP, Cohere multimodal | Cross-modal search |

## Common Patterns

```python
# Batch embedding with retry
def embed_batch(texts, model="text-embedding-3-small"):
    results = []
    for chunk in batched(texts, 100):  # API limit
        response = client.embeddings.create(input=chunk, model=model)
        results.extend([e.embedding for e in response.data])
    return results

# Similarity search with filter
results = index.query(
    vector=query_embedding,
    top_k=10,
    filter={"category": "technical"},
    include_metadata=True
)
```

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

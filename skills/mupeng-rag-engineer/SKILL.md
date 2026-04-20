---
name: rag-engineer
description: "Expert in building Retrieval-Augmented Generation systems. Masters embedding models, vector databases, chunking strategies, and retrieval optimization for LLM applications. Use when: building RAG, vector search, embeddings, semantic search, document retrieval."
description_zh: "Expert in building Retrievl-Augmented Genertion systems. Msters 嵌入 models, 向量数据库s, chunking strtegies, 和 retrievl optimiztion 用于 LLM pplictions. 用于: building RAG, vect或 搜索, 嵌入s, 语义搜索, 文档 retrievl."。
source: vibeship-spawner-skills (Apache 2.0)
author: 무펭이 🐧
---

# RAG Engineer 🐧


## 中文说明

### 简介

rag-engineer - "Expert in building Retrieval-Augmented Generation systems. Masters embedding models, vector databases, chunking strategies, and retrieval optimization for LLM applications. Use when: building RAG, vector search, embeddings, semantic search, document retrieval."

### 使用方法

此 Skill 已安装到 `/home/node/.openclaw/workspace/skills/mupeng-rag-engineer/`

1. 查看 SKILL.md 了解详细用法
2. 如有 scripts/run.sh，可直接运行
3. 参照 Examples 章节中的命令进行操作

### 适用场景

- 请参考 ## When to Use 章节
- 如有疑问，请查看 ## Troubleshooting 章节

### 快速开始

```bash
# 查看帮助
cd /home/node/.openclaw/workspace/skills/mupeng-rag-engineer
cat SKILL.md

# 运行（如有脚本）
./scripts/run.sh
```

### 注意事项

- 请确保已安装所需依赖
- 建议先阅读 ## Setup 或 ## Installation 章节
- 详细配置说明见 ## Configuration 章节

## Overview

  **Role**: RAG Systems Architect 

## When to Use

- RAG pipeline development

## OVERVIEW_PLACEHOLDER ## Capabilities

- Vector embeddings and similarity search
- Document chunking and preprocessing
- Retrieval pipeline design
- Semantic search implementation
- Context window optimization
- Hybrid search (keyword + semantic)

## Requirements

- LLM fundamentals
- Understanding of embeddings
- Basic NLP concepts

## Patterns

### Semantic Chunking

Chunk by meaning, not arbitrary token counts

```javascript
- Use sentence boundaries, not token limits
- Detect topic shifts with embedding similarity
- Preserve document structure (headers, paragraphs)
- Include overlap for context continuity
- Add metadata for filtering
```

### Hierarchical Retrieval

Multi-level retrieval for better precision

```javascript
- Index at multiple chunk sizes (paragraph, section, document)
- First pass: coarse retrieval for candidates
- Second pass: fine-grained retrieval for precision
- Use parent-child relationships for context
```

### Hybrid Search

Combine semantic and keyword search

```javascript
- BM25/TF-IDF for keyword matching
- Vector similarity for semantic matching
- Reciprocal Rank Fusion for combining scores
- Weight tuning based on query type
```

## Anti-Patterns

### ❌ Fixed Chunk Size

### ❌ Embedding Everything

### ❌ Ignoring Evaluation

## ⚠️ Sharp Edges

| Issue | Severity | Solution |
|-------|----------|----------|
| Fixed-size chunking breaks sentences and context | high | Use semantic chunking that respects document structure: |
| Pure semantic search without metadata pre-filtering | medium | Implement hybrid filtering: |
| Using same embedding model for different content types | medium | Evaluate embeddings per content type: |
| Using first-stage retrieval results directly | medium | Add reranking step: |
| Cramming maximum context into LLM prompt | medium | Use relevance thresholds: |
| Not measuring retrieval quality separately from generation | high | Separate retrieval evaluation: |
| Not updating embeddings when source documents change | medium | Implement embedding refresh: |
| Same retrieval strategy for all query types | medium | Implement hybrid search: |

## Related Skills

Works well with: `ai-agents-architect`, `prompt-engineer`, `database-architect`, `backend`

---
> 🐧 Built by **무펭이** — [무펭이즘(Mupengism)](https://github.com/mupeng) 생태계 스킬

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


## Limitations

- May require specific environment configuration
- Performance may vary based on input size
- Some features require optional dependencies

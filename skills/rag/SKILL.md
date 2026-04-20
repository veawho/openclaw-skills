---
name: RAG
slug: rag
description: Build, optimize, and debug RAG pipelines with chunking strategies, retrieval tuning, evaluation metrics, and production monitoring.
description_zh: Build, optimize, 和 debug RAG pipelines 使用 chunking strtegies, retrievl tuning, evlution metrics, 和 production 监控ing.。
---

## Overview


## 中文说明

### 简介

RAG - Build, optimize, and debug RAG pipelines with chunking strategies, retrieval tuning, evaluation metrics, and production monitoring.

### 使用方法

此 Skill 已安装到 `/home/node/.openclaw/workspace/skills/rag/`

1. 查看 SKILL.md 了解详细用法
2. 如有 scripts/run.sh，可直接运行
3. 参照 Examples 章节中的命令进行操作

### 适用场景

- 请参考 ## When to Use 章节
- 如有疑问，请查看 ## Troubleshooting 章节

### 快速开始

```bash
# 查看帮助
cd /home/node/.openclaw/workspace/skills/rag
cat SKILL.md

# 运行（如有脚本）
./scripts/run.sh
```

### 注意事项

- 请确保已安装所需依赖
- 建议先阅读 ## Setup 或 ## Installation 章节
- 详细配置说明见 ## Configuration 章节

Build, optimize, and debug RAG pipelines with chunking strategies, retrieval tuning, evaluation metrics, and production monitoring.


```python
# Basic RAG pipeline
from rag_lib import Pipeline

# Initialize
pipeline = Pipeline(
    embedding_model="text-embedding-3-small",
    vector_db="pinecone"
)

# Ingest documents
pipeline.ingest(documents)

# Query
result = pipeline.query("What is the answer?")
```



## When to Use

User wants to implement, improve, or troubleshoot Retrieval-Augmented Generation systems.

## Quick Reference

| Topic | File |
|-------|------|
| Pipeline components & architecture | `architecture.md` |
| Implementation patterns & code | `implementation.md` |
| Evaluation metrics & debugging | `evaluation.md` |
| Security & compliance | `security.md` |

## Core Capabilities

1. **Architecture design** — Select embedding models, vector DBs, and chunking strategies based on requirements
2. **Implementation** — Write ingestion pipelines, query handlers, and update logic
3. **Retrieval optimization** — Tune top-k, reranking, hybrid search parameters
4. **Evaluation** — Build test datasets, measure recall/precision, diagnose failures
5. **Production ops** — Monitor quality drift, set up alerts, debug degradation
6. **Security** — PII detection, access control, compliance requirements

## Decision Checklist

Before recommending architecture, ask:
- [ ] What document types and volume?
- [ ] Latency requirements (real-time chat vs batch)?
- [ ] Update frequency (how often do docs change)?
- [ ] Access control needs (who can see what)?
- [ ] Compliance constraints (GDPR, HIPAA, SOC2)?
- [ ] Budget (managed vs self-hosted, embedding costs)?

## Critical Rules

- **Never skip access control** — Filter at retrieval time, not after
- **Always overlap chunks** — 10-20% prevents context loss at boundaries
- **Evaluate before optimizing** — Build eval dataset first, then tune
- **Same embedding model** — Query and documents must use identical model
- **Monitor similarity scores** — Dropping averages signal drift or issues
- **Plan for deletion** — GDPR erasure requires re-embedding capability

## Common Failure Patterns

| Symptom | Likely Cause | Fix |
|---------|--------------|-----|
| Wrong docs retrieved | Query too vague, poor chunks | Query expansion, smaller chunks |
| Relevant doc missed | Not indexed, low similarity | Check ingestion, hybrid search |
| Hallucinated answers | Context too short | Increase top-k, better reranking |
| Slow responses | Large chunks, no caching | Optimize chunk size, cache embeddings |
| Inconsistent results | Non-deterministic reranking | Set seeds, use stable sorting |

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

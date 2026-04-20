---
name: vector-knowledge-base
description: 向量知识库核心系统 - 基于 Pinecone 的本地向量存储与检索，支持语义搜索、RAG 问答、文档相似度匹配。
description_zh: 向量知识库核心系统 - 基于 Pinecone 的本地向量存储与检索，支持语义搜索、RAG 问答、文档相似度匹配。
version: 1.0.0
author: "巫师 叔叔"
homepage: https://github.com/veawho/openclaw-skills
---

# Vector Knowledge Base - 向量知识库

## Overview

向量知识库是 OpenClaw 的核心记忆系统，基于向量数据库实现语义检索和知识问答。

```
用户问题 → 向量化 → 相似度检索 → 上下文增强 → 生成答案
```

## When to Use

- 构建私有知识库
- 文档语义检索
- RAG 增强问答
- 相似文档发现

## Core Components

### 1. 向量存储层 (Pinecone/LanceDB)

```python
# 存储向量
index.upsert([
    {"id": "doc1", "vector": embedding, "metadata": {"text": "..."}},
    ...
])
```

### 2. 检索层

```python
# 语义检索
results = index.query(
    vector=query_embedding,
    top_k=5,
    include_metadata=True
)
```

### 3. RAG 增强层

```python
# 构建上下文
context = "\n".join([r.metadata["text"] for r in results])
answer = llm.answer(f"Context: {context}\n\nQuestion: {question}")
```

## Quick Start

### 构建知识库

```bash
# 一键构建
./scripts/build.sh my-kb /path/to/docs

# 使用 Omni
omni-coordinator "构建知识库"
```

### 检索

```bash
# 语义搜索
./scripts/search.sh "查询内容"

# 问答
./scripts/query.sh "你的问题"
```

## Configuration

```yaml
vector_kb:
  # 向量数据库
  provider: pinecone  # pinecone | lancedb | qdrant
  
  # 向量参数
  embedding:
    model: text-embedding-ada-002
    dimension: 1536
  
  # 检索参数
  retrieval:
    top_k: 5
    similarity_threshold: 0.7
```

## Scripts

| 脚本 | 功能 |
|------|------|
| `build.sh` | 一键构建知识库 |
| `search.sh` | 语义搜索 |
| `query.sh` | 知识问答 |
| `import.sh` | 导入文档 |
| `status.sh` | 查看状态 |

## Environment

```bash
# Pinecone (可选)
PINECONE_API_KEY=xxx
PINECONE_INDEX=openclaw-kb

# 本地存储
KB_PATH=/home/node/.openclaw/workspace/knowledge-base
```

## Dependencies

- pinecone (向量数据库)
- embeddings (向量化)
- rag (检索增强)

## See Also

- [pinecone](../pinecone/SKILL.md)
- [omni-coordinator](../omni-coordinator/SKILL.md)
---
name: knowledge-base-builder
description: 构建本地向量知识库系统 - 支持文档导入、向量化、语义检索。整合 pinecone、rag、embeddings 等技能，实现本地知识库问答。
description_zh: 构建本地向量知识库系统 - 支持文档导入、向量化、语义检索。整合 pinecone、rag、embeddings 等技能，实现本地知识库问答。
version: 1.0.0
author: "巫师 叔叔"
homepage: https://github.com/veawho/openclaw-skills
---

# Knowledge Base Builder - 知识库构建系统

## Overview

知识库构建系统是一站式解决方案，用于：
1. 导入文档（PDF、Markdown、TXT、HTML）
2. 文本分块和清洗
3. 向量化存储
4. 语义检索问答

## When to Use

- 构建私有知识库
- 本地文档问答系统
- 企业知识管理
- 个人笔记检索

## Architecture

```
文档 → 提取 → 分块 → 向量化 → 存储 → 检索 → 问答
```

## Quick Start

### 方式 1: 一键构建

```bash
# 构建基础知识库
bash /home/node/.openclaw/workspace/skills/knowledge-base-builder/scripts/build.sh my-kb

# 指定文档目录
bash build.sh my-kb /path/to/docs
```

### 方式 2: 使用 Omni-Coordinator

```bash
omni-coordinator "构建知识库，处理 /home/node/docs 目录下的所有文档"
```

### 方式 3: 手动步骤

```bash
# 1. 导入文档
kb import /path/to/docs

# 2. 向量化
kb vectorize

# 3. 启动服务
kb serve

# 4. 问答
kb query "你的问题"
```

## Supported Formats

| 格式 | 扩展名 | 处理方式 |
|------|--------|---------|
| Markdown | .md | 直接提取 |
| 纯文本 | .txt | 直接提取 |
| PDF | .pdf | OCR + 文本提取 |
| HTML | .html | 清洗后提取 |
| Word | .docx | 转换后提取 |

## Configuration

```yaml
knowledge_base:
  # 向量数据库
  vector_db: pinecone  # pinecone | qdrant | lancedb
  
  # 向量化参数
  embedding:
    model: text-embedding-ada-002
    dimension: 1536
    chunk_size: 512
    chunk_overlap: 50
  
  # 检索参数
  retrieval:
    top_k: 5
    similarity_threshold: 0.7
```

## Commands

### kb import <path>

导入文档到知识库

```bash
kb import /home/node/documents
kb import /home/node/documents --recursive
kb import /home/node/documents --format pdf,md
```

### kb vectorize

向量化所有已导入的文档

```bash
kb vectorize
kb vectorize --batch-size 100
kb vectorize --clear  # 清除旧向量
```

### kb search <query>

检索相关文档

```bash
kb search "OpenClaw 配置"
kb search "如何安装 Skills" --top 10
```

### kb query <question>

基于知识库问答

```bash
kb query "OpenClaw 如何配置子代理？"
kb query "如何提高 OpenClaw 的性能？" --context "性能优化"
```

### kb status

查看知识库状态

```bash
kb status
```

## Environment Variables

```bash
# Pinecone 配置
PINECONE_API_KEY=your-api-key
PINECONE_ENV=us-west4

# 或使用本地向量数据库
USE_LOCAL_VECTOR_DB=true
VECTOR_DB_PATH=/home/node/.openclaw/vector-db
```

## Skills 依赖

| Skill | 用途 | 必需 |
|-------|------|------|
| pinecone | 向量存储 | 是 |
| rag | 检索增强 | 是 |
| embeddings | 向量化 | 是 |
| memory-setup | 记忆管理 | 否 |

## Examples

### Example 1: 从零构建知识库

```bash
# 1. 创建知识库目录
mkdir -p ~/my-knowledge-base
cd ~/my-knowledge-base

# 2. 导入文档
kb import /home/node/documents

# 3. 构建向量
kb vectorize

# 4. 开始问答
kb query "我们的产品有什么特点？"
```

### Example 2: 增量更新

```bash
# 添加新文档
kb import /home/node/new-documents

# 增量向量化
kb vectorize --append

# 检索验证
kb search "新增内容关键词"
```

### Example 3: 多知识库

```bash
# 创建产品知识库
kb create products
kb import /docs/products --name products

# 创建技术知识库
kb create tech
kb import /docs/tech --name tech

# 跨库检索
kb search "查询内容" --kb products,tech
```

## Performance Tips

- 批量导入比单文件导入快 10x
- 使用 `--batch-size` 调整并发
- 定期清理孤儿向量
- 监控向量数据库大小

## Troubleshooting

### 向量化慢

```
检查: CPU/GPU 使用情况
调整: 减小 chunk_size 或增加 batch_size
```

### 检索不准确

```
检查: 文档质量
调整: 提高 similarity_threshold
```

### 存储不足

```
检查: 向量数据库配额
清理: kb clean --orphans
```

## See Also

- [pinecone](../pinecone/SKILL.md) - 向量数据库
- [rag](../rag/SKILL.md) - 检索增强
- [omni-coordinator](../omni-coordinator/SKILL.md) - 综合调度

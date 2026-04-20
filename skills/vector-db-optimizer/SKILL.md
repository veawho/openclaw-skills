---
name: vector-db-optimizer
description: 向量数据库与数据存储自动优化 - 优化向量索引、数据分片、查询性能。实现存储效率提升和检索速度优化。
description_zh: 向量数据库与数据存储自动优化 - 优化向量索引、数据分片、查询性能。实现存储效率提升和检索速度优化。
version: 1.0.0
author: "巫师 叔叔"
---

# Vector DB Optimizer - 向量数据库优化

## Overview

向量数据库优化系统实现：
1. **索引优化** - 自动选择最优索引类型
2. **数据分片** - 智能数据分布
3. **查询优化** - 结果缓存与预取
4. **存储压缩** - 矢量量化压缩

## Optimization Targets

| 目标 | 方法 |
|------|------|
| 查询速度 | HNSW 索引 + 缓存 |
| 存储效率 | PQ 压缩 + 增量存储 |
| 召回率 | 混合检索 + 重排 |
| 扩展性 | 分片 + 副本 |

## Supported Databases

| 数据库 | 优化方式 |
|--------|---------|
| Pinecone | 索引类型 + Pod 配置 |
| Qdrant | HNSW 参数 + 分片 |
| LanceDB | 向量压缩 + 索引 |
| Milvus | 索引类型 + 负载均衡 |

## Configuration

```yaml
vector_db:
  pinecone:
    indexType: meta-3
    pods: 1
    replicas: 1
    
  qdrant:
    vectors:
      size: 1536
      distance: Cosine
    optimizers:
      indexing_threshold: 20000
      max_optimization_threads: 2
      
  lancedb:
    vectorCompression: pq
    compressionDimension: 96
```

## Commands

```bash
dbopt status          # 查看状态
dbopt analyze         # 分析性能
dbopt optimize        # 执行优化
dbopt compact         # 数据压缩
dbopt reindex         # 重建索引
```

## Auto-Optimization

系统自动：
- 监控查询延迟 → 自动调参
- 检测存储溢出 → 自动扩容
- 发现召回下降 → 自动重建索引

## See Also

- [pinecone](../pinecone/SKILL.md)
- [knowledge-base-builder](../knowledge-base-builder/SKILL.md)
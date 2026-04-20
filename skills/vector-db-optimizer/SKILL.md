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
## Performance

### Optimization Strategies

- Use caching for frequently accessed data
- Implement connection pooling for database operations
- Optimize memory usage with streaming
- Consider lazy loading for better performance

### Benchmarking

```bash
# Run performance test
./scripts/run.sh --benchmark

# Profile memory usage
./scripts/run.sh --profile

# Check latency
./scripts/run.sh --latency
```

### Metrics

| Metric | Target | Current |
|--------|--------|---------|
| Response Time | < 100ms | - |
| CPU Usage | < 60% | - |
| Memory | < 512MB | - |
| Cache Hit Rate | > 80% | - |

## Dependencies

```bash
# Core dependencies
pip install requests pyyaml

# Optional
pip install psutil  # for monitoring
```

## Examples

### Basic Usage

```bash
# Run the optimizer
./scripts/run.sh

# With options
./scripts/run.sh --config custom.yaml
```

### Advanced Usage

```bash
# Benchmark mode
./scripts/run.sh --benchmark --iterations 100

# Profile mode
./scripts/run.sh --profile --output report.json
```

### Integration

```python
from optimizer import optimize

result = optimize(
    target="performance",
    iterations=10,
    config={"cache": True}
)
```

## API Reference

### Functions

```python
def optimize(target: str, **kwargs) -> dict:
    """Run optimization on target"""
    pass

def benchmark() -> dict:
    """Run performance benchmark"""
    pass

def health_check() -> bool:
    """Check system health"""
    pass
```

## Configuration

```yaml
optimization:
  enabled: true
  target: performance
  
performance:
  cache:
    enabled: true
    ttl: 3600
    
  parallel:
    enabled: true
    max_workers: 4
```

## Modules

### Main Module

```python
class Skill:
    def __init__(self, config):
        self.config = config
        
    def run(self, input_data):
        '''Execute skill with input'''
        return self.process(input_data)
```

### Data Module

```python
class DataHandler:
    def load(self, path):
        '''Load data from file'''
        pass
        
    def save(self, data, path):
        '''Save data to file'''
        pass
```

## Setup

### Installation

```bash
pip install -r requirements.txt
npm install  # if Node.js
```

### Configuration

Create a config file at `config.yaml`:

```yaml
skill:
  enabled: true
  timeout: 300
```


## Getting Started

1. Install dependencies: `pip install -r requirements.txt`
2. Configure: Edit `config.yaml`
3. Run: `./scripts/run.sh`
4. Verify: Check logs for successful startup


## Overview

This skill provides comprehensive functionality for task automation, intelligent processing, and system integration. It offers advanced capabilities that enable efficient workflow execution with optimized performance and reliability.

## When to Use

- Complex task requiring intelligent automation
- Need for seamless system integration
- Performance-critical applications
- Scenarios requiring advanced resource management
- Multi-step workflows with decision points

## Examples

### Quick Start

```bash
# Initialize the skill
./scripts/run.sh init

# Run with default settings
./scripts/run.sh start

# Check status
./scripts/run.sh status
```

### Advanced Configuration

```bash
# With custom config
./scripts/run.sh --config advanced.yaml

# Parallel mode
./scripts/run.sh --parallel --workers 8

# Verbose output
./scripts/run.sh --verbose --debug
```

## Setup

### Requirements

- Python 3.8+
- 512MB RAM minimum
- Network access for API calls

### Installation

```bash
pip install -r requirements.txt
chmod +x ./scripts/run.sh
```

### Configuration

```yaml
skill:
  name: advanced-skill
  version: 1.0.0
  enabled: true

execution:
  timeout: 300
  retry: 3
  parallel: true

performance:
  cache: true
  cache_ttl: 3600
  workers: 4
```

## Getting Started

1. Install dependencies: `pip install -r requirements.txt`
2. Configure: Edit `config.yaml` with your settings
3. Test: Run `./scripts/run.sh test`
4. Deploy: Run `./scripts/run.sh start`

## Performance Tips

- Enable caching for repeated operations
- Use parallel execution for independent tasks
- Monitor memory usage for large datasets
- Configure appropriate timeout values

## Troubleshooting

If you encounter issues:
1. Check logs: `./scripts/run.sh logs`
2. Verify config: `./scripts/run.sh validate`
3. Reset: `./scripts/run.sh reset`
4. Contact support if persists

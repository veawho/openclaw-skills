---
name: workflow-optimizer
description: 工作流自动优化系统 - 分析任务执行路径、识别瓶颈、自动优化流程。实现工作流的持续改进和自动化调度。
description_zh: 工作流自动优化系统 - 分析任务执行路径、识别瓶颈、自动优化流程。实现工作流的持续改进和自动化调度。
version: 1.0.0
author: "巫师 叔叔"
---

# Workflow Optimizer - 工作流优化系统

## Overview

工作流优化系统实现：
1. **流程分析** - 可视化任务执行路径
2. **瓶颈识别** - 发现性能瓶颈
3. **自动优化** - 重构执行流程
4. **调度优化** - 智能任务分配

## Optimization Targets

| 目标 | 优化方式 |
|------|---------|
| 执行时间 | 并行化 + 缓存 |
| 资源使用 | 智能调度 + 负载均衡 |
| 错误率 | 重试策略 + 降级 |
| 成本 | 资源最小化 |

## Workflow Analysis

```
输入任务 → 分解 → 分析 → 优化 → 执行 → 验证
```

## Configuration

```yaml
workflow:
  parallelEnabled: true
  maxParallel: 8
  timeout: 300
  retryPolicy:
    maxRetries: 3
    backoff: exponential
    
optimization:
  autoTune: true
  cacheResults: true
  prefetch: true
```

## Commands

```bash
wf analyze <task>     # 分析工作流
wf optimize <task>     # 优化工作流
wf history            # 查看历史
wf stats              # 统计信息
```

## Auto-Optimization

系统自动：
- 检测重复任务 → 合并
- 检测串行步骤 → 并行化
- 检测耗时步骤 → 缓存
- 检测失败模式 → 预加载

## See Also

- [automation-workflow-builder](../automation-workflow-builder/SKILL.md)
- [cron-retry](../cron-retry/SKILL.md)
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

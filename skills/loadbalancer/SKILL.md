---
name: loadbalancer
description: OpenClaw 负载均衡配置 - 多实例部署、健康检查、流量分配。支持 round-robin 和权重策略。
description_zh: OpenClaw 负载均衡配置 - 多实例部署、健康检查、流量分配。支持 round-robin 和权重策略。
version: 1.0.0
author: "巫师 叔叔"
---

# Load Balancer - 负载均衡

## Overview

配置多实例负载均衡，实现高可用和性能优化。

## Configuration

```yaml
loadbalancer:
  enabled: true
  strategy: round-robin  # round-robin | weighted | least-connections
  healthCheck:
    enabled: true
    interval: 30
    timeout: 5
    url: /health
  instances:
    - id: instance-1
      host: localhost
      port: 18789
      weight: 1
      enabled: true
```

## Strategies

| 策略 | 说明 | 适用场景 |
|------|------|---------|
| round-robin | 轮询分配 | 均匀负载 |
| weighted | 权重分配 | 性能差异 |
| least-connections | 最少连接 | 长连接 |

## Health Check

```bash
# 手动检查健康状态
lb health

# 查看实例状态
lb status

# 启用/禁用实例
lb enable <instance-id>
lb disable <instance-id>
```

## Commands

```bash
lb status      # 查看状态
lb health      # 健康检查
lb add         # 添加实例
lb remove      # 移除实例
lb test        # 测试负载
```
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

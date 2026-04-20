---
name: system-monitor
description: OpenClaw 系统监控与告警 - 监控 CPU、内存、延迟、错误率，配置告警阈值，通过 Telegram 发送告警通知。
description_zh: OpenClaw 系统监控与告警 - 监控 CPU、内存、延迟、错误率，配置告警阈值，通过 Telegram 发送告警通知。
version: 1.0.0
author: "巫师 叔叔"
---

# System Monitor - 系统监控与告警

## Overview

实时监控系统状态，配置告警阈值，自动发送告警通知。

## Metrics

| 指标 | 说明 | 告警阈值 |
|------|------|---------|
| CPU | CPU 使用率 | > 80% |
| Memory | 内存使用率 | > 85% |
| Latency | 响应延迟 (ms) | > 1000 |
| Error Rate | 错误率 (%) | > 5% |

## Commands

```bash
# 查看状态
monitor status

# 查看指标
monitor metrics

# 查看告警历史
monitor alerts

# 触发测试告警
monitor test
```

## Configuration

```yaml
monitoring:
  enabled: true
  interval: 60  # 秒
  
alerts:
  channels:
    - telegram
  thresholds:
    cpu: 80
    memory: 85
    latency: 1000
    errorRate: 5
```

## Alert Format

```
🚨 OpenClaw 告警

指标: CPU 使用率
当前值: 85%
阈值: 80%
时间: 2026-04-20 19:27:00
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

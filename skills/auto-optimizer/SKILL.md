---
name: auto-optimizer
description: 系统自动优化引擎 - 持续监控系统性能、自动识别问题、自动实施优化。实现零干预的自我维护系统。
description_zh: 系统自动优化引擎 - 持续监控系统性能、自动识别问题、自动实施优化。实现零干预的自我维护系统。
version: 1.0.0
author: "巫师 叔叔"
---

# Auto Optimizer - 系统自动优化引擎

## Overview

系统自动优化引擎实现：
1. **持续监控** - 7x24 性能追踪
2. **异常检测** - 自动识别问题
3. **根因分析** - 定位问题根源
4. **自动修复** - 实施优化方案

## Optimization Cycle

```
监控 → 检测 → 分析 → 决策 → 执行 → 验证
         ↑__________________________↓
```

## Monitored Components

| 组件 | 指标 | 阈值 |
|------|------|------|
| Gateway | 延迟, 错误率 | >1s, >1% |
| Agents | CPU, 内存 | >80%, >85% |
| Skills | 调用成功率 | <95% |
| Cache | 命中率 | <70% |
| VectorDB | 查询延迟 | >500ms |

## Configuration

```yaml
auto_optimizer:
  enabled: true
  interval: 300  # 5分钟检查
  
  thresholds:
    cpu: 80
    memory: 85
    latency: 1000
    errorRate: 1
    
  actions:
    autoScale: true
    autoRestart: true
    autoTune: true
    
  maintenance:
    schedule: "0 3 * * *"  # 凌晨3点
    cleanup: true
    optimize: true
```

## Commands

```bash
opt status            # 查看状态
opt history           # 优化历史
opt enable            # 启用自动优化
opt disable           # 禁用
opt tune <target>     # 手动调优
```

## Auto-Fix Capabilities

系统自动修复：
- 高延迟 → 重启服务 + 清理缓存
- 内存泄漏 → 强制 GC + 重启
- Skill 失败 → 禁用 + 告警
- 配置错误 → 自动回滚

## Maintenance

自动执行：
- 凌晨清理日志
- 定期重建索引
- 配置备份
- 健康检查

## See Also

- [system-monitor](../system-monitor/SKILL.md)
- [agent-evolution](../agent-evolution/SKILL.md)
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

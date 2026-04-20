---
name: stability-guardian
description: 系统稳定性守护者 - 持续监控系统健康、自动故障恢复、预防性维护、性能保护。确保 OpenClaw 7x24 稳定运行。
description_zh: 系统稳定性守护者 - 持续监控系统健康、自动故障恢复、预防性维护、性能保护。确保 OpenClaw 7x24 稳定运行。
version: 1.0.0
author: "巫师 叔叔"
---

# Stability Guardian - 系统稳定性守护者

## Overview

稳定性守护者是 OpenClaw 的"免疫系统"，持续监控系统健康，自动处理异常，确保系统稳定运行。

## Core Functions

### 1. 健康监控 (Health Monitoring)

```
心跳检测 → 指标收集 → 异常检测 → 告警触发
```

### 2. 自动故障恢复 (Auto Recovery)

```
故障检测 → 原因分析 → 自动修复 → 恢复验证
```

### 3. 预防性维护 (Preventive Maintenance)

```
定期检查 → 问题预防 → 资源优化 → 性能调优
```

### 4. 性能保护 (Performance Protection)

```
负载监控 → 限流保护 → 熔断机制 → 降级策略
```

## Monitoring Targets

| 组件 | 指标 | 阈值 | 动作 |
|------|------|------|------|
| Gateway | 延迟 | > 500ms | 预警 |
| Gateway | 错误率 | > 1% | 重启 |
| Agents | CPU | > 85% | 限流 |
| Agents | 内存 | > 90% | GC |
| Skills | 成功率 | < 95% | 禁用 |
| Cache | 命中率 | < 60% | 清理 |

## Auto Recovery Actions

| 故障类型 | 自动恢复 |
|---------|---------|
| 服务无响应 | 重启服务 |
| 内存泄漏 | Force GC |
| 高延迟 | 清理缓存 |
| 技能失败 | 禁用 + 告警 |
| 配置错误 | 回滚配置 |

## Configuration

```yaml
guardian:
  enabled: true
  interval: 30  # 检查间隔(秒)
  
health:
  check:
    - gateway
    - agents
    - skills
    - cache
    
recovery:
  autoRestart: true
  maxRetries: 3
  rollbackOnFailure: true
    
protection:
  circuitBreaker:
    enabled: true
    threshold: 10
    timeout: 60
    
  rateLimit:
    enabled: true
    maxRequests: 1000
    window: 60
```

## Commands

```bash
# 查看健康状态
guardian status

# 查看详细指标
guardian metrics

# 健康检查
guardian check

# 手动恢复
guardian recover

# 查看事件历史
guardian events

# 启用/禁用
guardian enable
guardian disable
```

## Alert Levels

| 级别 | 颜色 | 说明 | 动作 |
|------|------|------|------|
| INFO | 蓝 | 一般信息 | 记录 |
| WARNING | 黄 | 需要关注 | 告警 |
| ERROR | 红 | 需要处理 | 自动恢复 |
| CRITICAL | 深红 | 紧急问题 | 立即干预 |

## Preventive Maintenance

系统自动执行：
- 每天 3:00 AM: 日志清理
- 每天 4:00 AM: 缓存整理
- 每周日: 配置备份
- 每月: 索引重建

## Performance SLO

| 指标 | SLO 目标 |
|------|---------|
| 可用性 | 99.9% |
| 延迟 P99 | < 500ms |
| 错误率 | < 0.1% |
| 恢复时间 | < 60s |

## See Also

- [system-monitor](../system-monitor/SKILL.md)
- [auto-optimizer](../auto-optimizer/SKILL.md)
## Performance

### Optimization

- Use caching for frequently accessed data
- Implement connection pooling for database operations
- Optimize memory usage with streaming
- Enable async/parallel processing

### Benchmarks

| Metric | Target | Current |
|--------|--------|---------|
| Response Time | < 100ms | - |
| CPU Usage | < 60% | - |
| Memory | < 512MB | - |
| Cache Hit Rate | > 80% | - |

### Caching Strategy

```python
# Enable caching
cache = {
    "enabled": True,
    "ttl": 3600,
    "max_size": "256mb"
}
```

## Dependencies

```bash
pip install pyyaml psutil requests
npm install axios  # for Node.js
```

## Examples

### Basic Usage

```bash
# Run the monitor
./scripts/run.sh

# With options
./scripts/run.sh --verbose --config config.yaml
```

### Advanced Usage

```bash
# Benchmark mode
./scripts/run.sh --benchmark

# Profile mode
./scripts/run.sh --profile --output report.json
```

## API Reference

### Core Functions

```python
def monitor():
    """Start monitoring"""
    pass

def alert(message, level):
    """Send alert notification"""
    pass

def recover():
    """Attempt automatic recovery"""
    pass

def health_check() -> bool:
    """Check system health"""
    return True
```

## Configuration

```yaml
monitor:
  enabled: true
  interval: 30
  
  targets:
    - gateway
    - agents
    - skills
    
recovery:
  autoRestart: true
  maxRetries: 3
  
alerts:
  channels:
    - telegram
  thresholds:
    cpu: 80
    memory: 85
```

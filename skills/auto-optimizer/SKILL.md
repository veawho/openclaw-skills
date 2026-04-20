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
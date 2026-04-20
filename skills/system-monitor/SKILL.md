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
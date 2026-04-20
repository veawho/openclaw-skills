---
name: watchdog
description: 看门狗监控系统 - 持续监控 OpenClaw 服务、自动重启失败服务、记录异常事件、发送告警通知。
description_zh: 看门狗监控系统 - 持续监控 OpenClaw 服务、自动重启失败服务、记录异常事件、发送告警通知。
version: 1.0.0
author: "巫师 叔叔"
---

# Watchdog - 看门狗监控

## Overview

看门狗是 OpenClaw 的第一道防线，持续监控服务状态，发现异常立即处理。

## Features

### 1. 服务监控
- 进程存活检测
- 端口可达性检测
- 响应时间检测
- 健康端点检测

### 2. 自动重启
- 进程崩溃自动重启
- 服务无响应自动重启
- 内存溢出自动重启
- 连续失败限流重启

### 3. 事件记录
- 所有事件记录到日志
- 告警历史追踪
- 重启原因分析
- 性能趋势分析

### 4. 告警通知
- Telegram 告警
- 阈值触发告警
- 连续失败告警
- 恢复成功通知

## Configuration

```yaml
watchdog:
  enabled: true
  interval: 10  # 检查间隔(秒)
  
monitoring:
  process:
    name: openclaw
    checkAlive: true
    restartOnCrash: true
    
  port:
    number: 18789
    checkReachable: true
    timeout: 5
    
  health:
    endpoint: /health
    expectedStatus: 200
    
recovery:
  maxRetries: 5
  retryInterval: 30
  backoffMultiplier: 2
  resetAfter: 300
  
alerts:
  telegram:
    enabled: true
    chatId: "1521667184"
  thresholds:
    restartCount: 3
    errorRate: 0.05
    latencyMs: 2000
```

## Commands

```bash
watchdog start      # 启动看门狗
watchdog stop       # 停止看门狗
watchdog status     # 查看状态
watchdog restart    # 重启监控
watchdog events     # 查看事件
watchdog test       # 测试告警
```

## Metrics

| 指标 | 说明 |
|------|------|
| uptime | 服务运行时间 |
| restarts | 重启次数 |
| errors | 错误计数 |
| latency | 平均延迟 |

## Alert Format

```
🚨 OpenClaw 看门狗告警

时间: 2026-04-20 19:42:00
事件: 进程无响应
动作: 已自动重启
次数: 第 2 次

恢复: 进程已正常
```

## See Also

- [stability-guardian](../stability-guardian/SKILL.md)
- [system-monitor](../system-monitor/SKILL.md)
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
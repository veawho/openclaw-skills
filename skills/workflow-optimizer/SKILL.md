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
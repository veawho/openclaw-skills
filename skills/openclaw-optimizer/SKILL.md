---
name: openclaw-optimizer
description: OpenClaw 系统优化工具 - 分析配置、调试性能、优化 Skills、管理系统状态。自动检测并修复配置问题，优化资源使用。
description_zh: OpenClaw 系统优化工具 - 分析配置、调试性能、优化 Skills、管理系统状态。自动检测并修复配置问题，优化资源使用。
version: 1.0.0
author: "巫师 叔叔"
---

# OpenClaw Optimizer - 系统优化工具

## Overview

OpenClaw 系统优化工具，用于：
1. 分析系统配置
2. 调试性能问题
3. 优化 Skills 组合
4. 管理健康状态

## Commands

### 系统检查

```bash
openclaw-optimizer check
```

检查项目：
- 配置文件完整性
- Skills 状态
- 知识库状态
- 内存使用
- 并发配置

### 配置优化

```bash
openclaw-optimizer optimize
```

优化项：
- Subagent 并发数
- 内存缓存
- 会话管理
- 日志级别

### Skills 审计

```bash
openclaw-optimizer audit
```

审计项：
- 重复 Skills
- 缺失依赖
- 配置错误
- 性能评分

### 健康报告

```bash
openclaw-optimizer health
```

生成系统健康报告

## Configuration

```yaml
optimizer:
  # 并发优化
  subagent:
    maxConcurrent: 16
    timeout: 300
  
  # 内存优化
  memory:
    cacheSize: 512
    maxAge: 3600
  
  # Skills 过滤
  skills:
    excludeMacOS: true
    minScore: 80
```

## Examples

### 完整系统优化

```bash
openclaw-optimizer check
openclaw-optimizer optimize
openclaw-optimizer audit
```

### 生成健康报告

```bash
openclaw-optimizer health > health-report.md
```
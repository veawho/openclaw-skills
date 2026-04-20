---
name: auto-heal
description: 自动故障修复系统 - 智能分析故障原因、自动执行修复、验证恢复结果。实现零人工干预的故障恢复。
description_zh: 自动故障修复系统 - 智能分析故障原因、自动执行修复、验证恢复结果。实现零人工干预的故障恢复。
version: 1.0.0
author: "巫师 叔叔"
---

# Auto-Heal - 自动故障修复系统

## Overview

自动故障修复系统是 OpenClaw 的"医生"，能够智能诊断问题并自动治疗。

## Diagnosis Engine

```
症状采集 → 模式匹配 → 根因分析 → 修复方案
```

### 常见故障模式

| 症状 | 可能原因 | 自动修复 |
|------|---------|---------|
| 服务无响应 | 内存溢出 | GC + 重启 |
| 高延迟 | 缓存满 | 清理缓存 |
| 技能失败 | 依赖缺失 | 重新安装 |
| 配置错误 | 权限问题 | 重置配置 |
| 进程崩溃 | OOM | 调整内存 |

## Repair Actions

### 1. 服务恢复

```bash
# 自动重启服务
systemctl restart openclaw

# 清理临时文件
rm -rf /tmp/openclaw-*

# 重置连接池
openclaw reset --pool
```

### 2. 内存优化

```bash
# 触发 GC
sync && echo 3 > /proc/sys/vm/drop_caches

# 重启 Agent
openclaw agents restart --all
```

### 3. 配置修复

```bash
# 回滚配置
openclaw config rollback

# 重置为默认值
openclaw config reset

# 验证配置
openclaw config validate
```

### 4. 技能修复

```bash
# 重新安装失败技能
clawhub reinstall <skill-name>

# 清除技能缓存
clawhub clean-cache
```

## Recovery Verification

修复后自动验证：
1. 服务响应正常
2. 延迟恢复至正常
3. 错误率下降
4. 指标回归基线

## Configuration

```yaml
auto_heal:
  enabled: true
  
diagnosis:
  max_depth: 5
  timeout: 30
  
repair:
  auto_execute: true
  require_approval:
    critical: true
    high: false
    medium: false
    low: false
    
verification:
  retries: 3
  interval: 10
  acceptance_criteria:
    latency_ms: 500
    error_rate: 0.01
    uptime_seconds: 60
```

## Commands

```bash
heal status          # 查看健康状态
heal diagnose        # 运行诊断
heal repair          # 执行修复
heal verify          # 验证恢复
heal history         # 查看历史
heal config          # 配置阈值
```

## Emergency Rollback

紧急情况下：
```bash
heal emergency-rollback
```

回滚到上一个稳定版本。

## See Also

- [stability-guardian](../stability-guardian/SKILL.md)
- [watchdog](../watchdog/SKILL.md)
---
name: skills-auto-upgrade
description: Skills 自动升级与优化系统 - 自动检测新版本、自动评估兼容性、自动实施升级。实现 Skills 的零停机无缝升级。
description_zh: Skills 自动升级与优化系统 - 自动检测新版本、自动评估兼容性、自动实施升级。实现 Skills 的零停机无缝升级。
version: 1.0.0
author: "巫师 叔叔"
---

# Skills Auto Upgrade - 技能自动升级系统

## Overview

Skills 自动升级系统实现：
1. **版本检测** - 定期检查更新
2. **兼容性评估** - 分析依赖关系
3. **自动升级** - 无缝版本切换
4. **回滚机制** - 问题快速回退

## Upgrade Flow

```
检测 → 评估 → 测试 → 升级 → 验证 → 完成
                     ↓
                  回滚 ← 验证失败
```

## Version Management

| 状态 | 说明 |
|------|------|
| latest | 最新稳定版 |
| beta | 测试版 |
| deprecated | 即将废弃 |
| broken | 已知问题 |

## Configuration

```yaml
skills_upgrade:
  enabled: true
  checkInterval: 3600  # 每小时检查
  
  autoUpgrade:
    enabled: true
    stableOnly: true
    backupBefore: true
    
  sources:
    - clawhub
    - github
    
  exclusions:
    - skill-creator
    - openclaw-optimizer
```

## Commands

```bash
skills-up check              # 检查更新
skills-up upgrade <skill>    # 升级指定技能
skills-up upgrade-all        # 升级全部
skills-up rollback <skill>   # 回滚
skills-up status             # 查看状态
```

## Auto-Upgrade Rules

系统自动：
- 检测新版本 → 评估影响
- 兼容性通过 → 自动升级
- 存在风险 → 告警提示
- 升级失败 → 自动回滚

## Safety Features

- 升级前自动备份
- 失败自动回滚
- 兼容性检查
- 影响范围评估
- 升级日志记录

## Upgrade Reports

每次升级生成报告：
- 变更内容
- 影响分析
- 测试结果
- 回滚步骤

## See Also

- [clawhub](../clawhub/SKILL.md)
- [skill-creator](../skill-creator/SKILL.md)
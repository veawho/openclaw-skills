---
name: refactor-safely
description: Plans and executes safe refactors with small steps, tests, and rollback strategy. Use when 重构, 技术债, 安全重构, refactoring, or improving code structure without breaking behavior.
description_zh: Plns 和 执行s sfe refct或s 使用 smll steps, tests, 和 rollbck strtegy. 用于 重构, 技术债, 安全重构, 重构, 或 improving code structure 使用out breking behvi或.。
---

# 安全重构（Refactor Safely）


## 中文说明

### 简介

refactor-safely - Plans and executes safe refactors with small steps, tests, and rollback strategy. Use when 重构, 技术债, 安全重构, refactoring, or improving code structure without breaking behavior.

### 使用方法

此 Skill 已安装到 `/home/node/.openclaw/workspace/skills/refactor-safely/`

1. 查看 SKILL.md 了解详细用法
2. 如有 scripts/run.sh，可直接运行
3. 参照 Examples 章节中的命令进行操作

### 适用场景

- 请参考 ## When to Use 章节
- 如有疑问，请查看 ## Troubleshooting 章节

### 快速开始

```bash
# 查看帮助
cd /home/node/.openclaw/workspace/skills/refactor-safely
cat SKILL.md

# 运行（如有脚本）
./scripts/run.sh
```

### 注意事项

- 请确保已安装所需依赖
- 建议先阅读 ## Setup 或 ## Installation 章节
- 详细配置说明见 ## Configuration 章节

## Overview

See description in frontmatter.

## When to Use

- Writing articles and blog posts
- Marketing content generation
- Structured content creation ## 触发场景

- 用户说「重构这段代码」「清理技术债」「安全重构」「改善结构但不要改行为」
- 代码难以维护、重复多、职责混乱、难以加测试

## 原则

- **行为不变**：重构前后功能与边界行为一致（含异常、边界值）
- **小步提交**：每步可单独提交、易回滚、易 code review
- **先测后动**：有测试则先绿再动；无测试则先补关键路径再重构
- **可随时停**：任意一步停下，代码仍处于可运行、可发布状态

## 执行流程

### 1. 明确范围与目标

- **范围**：单文件 / 单模块 / 跨模块（列出受影响入口与调用方）
- **目标**：例如「抽公共函数」「拆组件」「统一错误处理」「去掉重复」
- **不做什么**：明确不在此次重构里改的需求或行为

### 2. 识别依赖与风险

- 谁在调用当前代码（组件、API、路由、全局状态）
- 是否有隐式依赖（全局变量、副作用、执行顺序）
- 高风险点：无类型、无测试、多入口共用的逻辑

### 3. 拆分步骤（每步可单独提交）

| 步骤类型 | 示例 |
|----------|----------|
| 仅移动 | 把函数/组件挪到新文件，改 import，跑通 |
| 仅重命名 | 变量/函数/文件重命名，全局替换后跑通 |
| 抽离不改逻辑 | 抽子函数/子组件，原逻辑不变，调用处改为用新的 |
| 替换实现 | 用新实现替换旧实现，对外接口不变 |
| 删废弃 | 确认无引用后删除死代码或废弃 API |

### 4. 每步验证

- 构建通过、类型通过、现有测试通过
- 若有可能：关键页面/流程手工点一遍或跑 E2E
- 提交信息写清本步做了什么（如 "refactor: extract getDisplayName"）

### 5. 回滚策略

- 每步在版本控制里独立提交，便于 `git revert`
- 若涉及配置或数据，注明回滚时需恢复的内容

## 输出模板

```markdown
## 安全重构计划

### 目标与范围
- 目标：…
- 范围：…（文件/模块列表）
- 不改变：…（行为/接口约定）

### 依赖与风险
- 调用方：…
- 风险点：…

### 步骤（每步可单独提交）
1. … — 验证：…
2. … — 验证：…
3. …

### 回滚
- 按提交逐条 revert 即可 / 需注意：…
```

## 常见模式

- **抽函数**：先复制一份成新函数，调用处改为新函数，再删旧实现
- **抽组件**：先在新文件写组件，原处用新组件包裹原 JSX，再逐步把 props 捋清
- **改数据结构**：可先兼容旧结构（新旧并存），再逐步迁移调用方，最后删旧结构
- **重命名**：用 IDE 重命名/全局替换，避免手改漏改

## Tools
## Tools

## Examples

```bash
# Example usage
skill --help
```


### CLI Commands

```bash
# Common commands
skill --help
skill --list
```

### API Usage

```python
# Example usage
result = skill.process(input_data)
```



## Performance

### Optimization Tips

- Use caching where applicable to reduce repeated computations
- Consider batch processing for multiple operations
- Implement async/parallel processing when possible
- Monitor memory usage for large datasets

### Best Practices

- Profile before optimizing
- Use appropriate data structures for the task
- Consider lazy loading for large resources


## Dependencies

### Required

- Python 3.8+ or Node.js 16+ (depending on skill type)
- See skill metadata for specific requirements

### Optional

- Additional dependencies may be needed for extended features
- Check official documentation for full requirements


## Troubleshooting

### Common Issues

**Issue**: Command not found
- Solution: Ensure the skill is properly installed

**Issue**: Permission denied
- Solution: Check file permissions and user access

**Issue**: Configuration error
- Solution: Verify config.yaml syntax and paths

### Debug Mode

```bash
# Enable verbose output
skill run --verbose --debug

# Check logs
tail -f /var/log/skill.log
```


## Architecture

### Components

1. **Core Module** - Main processing logic
2. **CLI Interface** - Command-line interaction
3. **Configuration Manager** - Settings handling
4. **Logger** - Event tracking and debugging

### Data Flow

```
Input → Validator → Processor → Formatter → Output
```


## Features

### Core Features

- Feature 1: Description of what this capability does
- Feature 2: Another important capability
- Feature 3: Additional functionality

### Advanced Features

- Advanced option A for power users
- Advanced option B for customization


## Installation

```bash
pip install {skill_dir}
```

For development:

```bash
pip install -e .
```


## Limitations

- May require specific environment configuration
- Performance may vary based on input size
- Some features require optional dependencies

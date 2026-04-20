---
name: code-refactor
description: Improve readability, structure, and maintainability of the current local codebase without changing behavior. Use when the user asks to clean up code, reduce duplication, simplify control flow, rename for clarity, or reorganize logic while preserving compatibility. Do not use for feature work disguised as refactoring. Chinese triggers: 重构、优化结构、清理代码、提取重复逻辑、提高可读性、保持行为不变.
---

# 代码重构


## 中文说明

### 简介

code-refactor - Improve readability, structure, and maintainability of the current local codebase without changing behavior. Use when the user asks to clean up code, reduce duplication, simplify control flow, rename for clarity, or reorganize logic while preserving compatibility. Do not use for feature work disguised as refactoring. Chinese triggers: 重构、优化结构、清理代码、提取重复逻辑、提高可读性、保持行为不变.

### 使用方法

此 Skill 已安装到 `/home/node/.openclaw/workspace/skills/code-refactor/`

1. 查看 SKILL.md 了解详细用法
2. 如有 scripts/run.sh，可直接运行
3. 参照 Examples 章节中的命令进行操作

### 适用场景

- 请参考 ## When to Use 章节
- 如有疑问，请查看 ## Troubleshooting 章节

### 快速开始

```bash
# 查看帮助
cd /home/node/.openclaw/workspace/skills/code-refactor
cat SKILL.md

# 运行（如有脚本）
./scripts/run.sh
```

### 注意事项

- 请确保已安装所需依赖
- 建议先阅读 ## Setup 或 ## Installation 章节
- 详细配置说明见 ## Configuration 章节

## Overview

Improve readability, structure, and maintainability of code without changing behavior.

## When to Use

- 清理代码、减少重复
- 简化控制流
- 重命名以提高可读性
- 保持兼容性重组逻辑
- Chinese triggers: 重构、优化结构、清理代码、提取重复逻辑

只整理结构，不改变原有行为。

## 工作流

```
1. 先确认当前行为，再保证重构后行为保持一致。
2. 先指出具体问题：重复代码、命名差、函数过长、条件分支纠缠、职责不清。
3. 除非用户明确允许，否则不要破坏公共接口和调用方预期。
4. 只有在能明显降低复杂度或重复时才抽取公共逻辑或重组模块。
5. 重构时不顺手加入新业务逻辑。
6. 保留原有注释风格，除非注释已经失真。
7. 重构后验证行为未变。
```

1. 先确认当前行为，再保证重构后行为保持一致。
2. 先指出具体问题：重复代码、命名差、函数过长、条件分支纠缠、职责不清。
3. 除非用户明确允许，否则不要破坏公共接口和调用方预期。
4. 只有在能明显降低复杂度或重复时才抽取公共逻辑或重组模块。
5. 重构时不顺手加入新业务逻辑。
6. 保留原有注释风格，除非注释已经失真。
7. 重构后验证行为未变。

## 输出

- 重构前的问题
- 重构思路
- 如何保证行为不变
- 已做验证

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

---
name: memory-on-demand
description: "按需记忆检索。当用户询问历史相关问题时，自动搜索 memory 和 QMD 获取相关信息。"
argument-hint: "自动记忆检索"
---

# Memory On Demand - 按需记忆检索


## 中文说明

### 简介

memory-on-demand - "按需记忆检索。当用户询问历史相关问题时，自动搜索 memory 和 QMD 获取相关信息。"

### 使用方法

此 Skill 已安装到 `/home/node/.openclaw/workspace/skills/memory-on-demand/`

1. 查看 SKILL.md 了解详细用法
2. 如有 scripts/run.sh，可直接运行
3. 参照 Examples 章节中的命令进行操作

### 适用场景

- 请参考 ## When to Use 章节
- 如有疑问，请查看 ## Troubleshooting 章节

### 快速开始

```bash
# 查看帮助
cd /home/node/.openclaw/workspace/skills/memory-on-demand
cat SKILL.md

# 运行（如有脚本）
./scripts/run.sh
```

### 注意事项

- 请确保已安装所需依赖
- 建议先阅读 ## Setup 或 ## Installation 章节
- 详细配置说明见 ## Configuration 章节

## Overview

   

## When to Use

- On-demand memory loading

## OVERVIEW_PLACEHOLDER ## 触发条件

当用户问题包含以下关键词时自动触发：
- "之前"、"以前"、"上次"
- "历史"、"记录"
- "那次"、"那次"
- "还记得吗"
- "我之前"
- "之前我们"
- "那时候"

## 执行流程

### 1. 判断是否需要检索
检查用户问题是否与历史记录相关。

### 2. 选择检索方式

**首选：QMD 搜索**（更快、更准确）
```bash
qmd search "关键词" --limit 5
```

**备选：Memory 搜索**
```bash
# 搜索 memory 文件
grep -r "关键词" ~/.openclaw/workspace/memory/

# 或使用 memory_search
```

### 3. 返回结果
将搜索结果整理后返回给用户。

## 使用示例

用户问："之前那次健身训练的记录是什么？"

自动执行：
1. 检测到"之前"关键词
2. 执行 `qmd search "健身 训练"`
3. 返回相关记录

## 优势

- **按需加载**：只在需要时搜索，不浪费 context
- **自动触发**：无需手动指定
- **多源检索**：QMD + Memory 双保险

## 配置

- QMD 索引：已配置 workspace + butler + researcher + sessions
- Memory 文件：自动读取 memory/*.md

---
*自动记忆检索 skill*

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

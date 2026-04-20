---
name: fluid-memory
description: 基于艾宾浩斯遗忘曲线和访问频率的衰减模型设计的遗忘和归档机制，完全依赖openclaw原生记忆系统的拟人化流体记忆系统
command-dispatch: tool
metadata:
  {
    "openclaw": {
      "requires": {
        "bins": ["python"],
        "python_packages": ["chromadb", "pyyaml"]
      }
    }
  }
---

# Fluid Memory Skill


## 中文说明

### 简介

fluid-memory - 基于艾宾浩斯遗忘曲线和访问频率的衰减模型设计的遗忘和归档机制，完全依赖openclaw原生记忆系统的拟人化流体记忆系统

### 使用方法

此 Skill 已安装到 `/home/node/.openclaw/workspace/skills/fluid-memory/`

1. 查看 SKILL.md 了解详细用法
2. 如有 scripts/run.sh，可直接运行
3. 参照 Examples 章节中的命令进行操作

### 适用场景

- 请参考 ## When to Use 章节
- 如有疑问，请查看 ## Troubleshooting 章节

### 快速开始

```bash
# 查看帮助
cd /home/node/.openclaw/workspace/skills/fluid-memory
cat SKILL.md

# 运行（如有脚本）
./scripts/run.sh
```

### 注意事项

- 请确保已安装所需依赖
- 建议先阅读 ## Setup 或 ## Installation 章节
- 详细配置说明见 ## Configuration 章节

## Overview

基于艾宾浩斯遗忘曲线和访问频率的衰减模型设计的遗忘和归档机制，完全依赖openclaw原生记忆系统的拟人化流体记忆系统

## When to Use

- TODO: add common use cases


这是你的「赛博大脑」。它不是死板的数据库，而是一个活着的系统——会遗忘不重要的事，会强化常被提及的知识。

## 自动学习模式 (Auto Learn)

**通过 OpenClaw 原生 flush 触发！** 每次 OpenClaw 触发 memory flush 时，AI 会同步调用 fluid-memory 记录对话。

- 依赖 OpenClaw 原生 compaction 机制（配置 `softThresholdTokens` 控制频率）
- 需在 OpenClaw 配置中启用 `memoryFlush`

## 遗忘机制

- **动态遗忘**：检索时分数 < 0.05 被过滤
- **主动遗忘**：调用 `fluid_forget` 归档指定记忆
- **梦境守护**：定时归档分数 < 0.15 的记忆

## 核心理念

- **植入 (Remember)**: 写入新记忆。
- **唤起 (Recall)**: 检索记忆。**每次检索都会强化该记忆**（访问次数+1）。
- **遗忘 (Forget)**: 将匹配的记忆归档。

## 工具 (Tools)

你 (OpenClaw LLM) 可以调用以下工具来与我（Fluid Memory）交互：

### 1. 植入记忆
当用户明确说「记住xxx」时使用。

**Trigger**: 用户说「记住...」「植入...」「记录...」
**Tool Call**:
```json
{
  "name": "fluid_remember",
  "arguments": {
    "content": "用户说的原话"
  }
}
```

### 2. 唤起记忆
当用户问「我之前说过什么」「记得xxx吗」「我的偏好是什么」时使用。

**Trigger**: 用户问「我喜不喜欢...」「还记得...」「我之前...」
**Tool Call**:
```json
{
  "name": "fluid_recall",
  "arguments": {
    "query": "用户的查询关键词"
  }
}
```

### 3. 遗忘
当用户说「忘记xxx」「不要再提xxx」时使用。

**Tool Call**:
```json
{
  "name": "fluid_forget",
  "arguments": {
    "keyword": "要遗忘的关键词"
  }
}
```

### 4. 状态
查看大脑状态。

**Tool Call**:
```json
{
  "name": "fluid_status",
  "arguments": {}
}
```

## 内部实现 (供开发者参考)

实际执行命令：
```bash
python wrapper.py remember --content "..."
```

## 隐私

- 数据存储在本地 `~/.openclaw/workspace/database/`
- 明文存储（无加密）
- 无云端同步

## 最佳实践

1.  **自然触发**: 不要机械地调用工具，要理解用户的意图。
2.  **强化重要记忆**: 如果用户多次提到某事，调用 `fluid_recall` 查询它，这会让它记得更牢。
3.  **接受遗忘**: 如果系统返回「没有相关记忆」，不要慌，这说明用户很久没提这件事了，或者确实没说过。

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

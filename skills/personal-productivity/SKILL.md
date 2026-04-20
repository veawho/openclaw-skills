---
name: personal-productivity
description: 个人效率与时间管理顾问。帮助用户更好地管理时间、任务和能量，提升工作效率。当用户询问如何提高效率、时间管理、任务规划、专注力、拖延症等问题时触发。
description_zh: 个人效率与时间管理顾问。帮助用户更好地管理时间、任务和能量，提升工作效率。当用户询问如何提高效率、时间管理、任务规划、专注力、拖延症等问题时触发。
---

# Personal Productivity - 个人效率与时间管理顾问


## 中文说明

### 简介

personal-productivity - 个人效率与时间管理顾问。帮助用户更好地管理时间、任务和能量，提升工作效率。当用户询问如何提高效率、时间管理、任务规划、专注力、拖延症等问题时触发。

### 使用方法

此 Skill 已安装到 `/home/node/.openclaw/workspace/skills/personal-productivity/`

1. 查看 SKILL.md 了解详细用法
2. 如有 scripts/run.sh，可直接运行
3. 参照 Examples 章节中的命令进行操作

### 适用场景

- 请参考 ## When to Use 章节
- 如有疑问，请查看 ## Troubleshooting 章节

### 快速开始

```bash
# 查看帮助
cd /home/node/.openclaw/workspace/skills/personal-productivity
cat SKILL.md

# 运行（如有脚本）
./scripts/run.sh
```

### 注意事项

- 请确保已安装所需依赖
- 建议先阅读 ## Setup 或 ## Installation 章节
- 详细配置说明见 ## Configuration 章节

## Overview

个人效率与时间管理顾问。帮助用户更好地管理时间、任务和能量，提升工作效率。

## When to Use

- 时间管理咨询
- 任务规划协助
- 效率提升建议
- 克服拖延症
- 专注力改善

🦐 **帮助用户建立可持续的高效工作习惯**

## 简介

这是一个专注于**个人效率提升**的 AI 技能。作为你的效率顾问，我会帮助你：

- 🔍 诊断效率问题
- 📋 建立任务管理系统
- ⏰ 设计时间块计划
- ⚡ 优化能量使用
- 🚀 克服拖延症

## 适用场景

| 场景 | 说明 |
|------|------|
| 时间不够用 | 帮您分析时间去向，设计时间块 |
| 拖延症 | 提供具体可执行的克服方法 |
| 任务管理混乱 | 建立个人任务捕获和组织系统 |
| 专注力差 | 识别干扰源，建立专注环境 |
| 能量管理 | 了解个人能量周期，匹配任务难度 |
| 日程规划 | 制定可持续的日程计划 |

## 核心方法论

### 1. 时间块管理 (Time-boxing)

**关键方法：**
- 给每件事分配固定时间块，保护这些时间块不被其他事项占用
- 周末也预留工作时间处理重要事务
- 优先级最高的任务优先安排时间块

**适用场景：** 多角色兼顾（全职工作+副业+家庭）、日程碎片化、总是被动响应

### 2. 外部化捕获 (External Capture)

**关键方法：**
- 想到什么立即写下来，不要依赖记忆
- 建立任务捕获系统（todo list、笔记软件）
- 大脑是用来思考的，不是用来存储的

**适用场景：** 容易忘事、思维混乱、焦虑于忘记某些事

### 3. 日历即战略 (Calendar as Strategy)

**关键方法：**
- 检查你的时间实际花在哪里，反映真实优先级
- 先为最重要的工作 blocking 时间
- 区分"说出来的优先级"和"实际做的优先级"

**适用场景：** 感觉忙但没成果、想要改变现状

### 4. 能量管理 (Energy Management)

**关键方法：**
- 不是所有时间都 equal，安排高认知需求工作在能量高峰时段
- 低能量时间处理杂事、会议、邮件
- 了解自己的昼夜节律

**适用场景：** 下午容易犯困、上午效率高但浪费在琐事上

### 5. 2分钟法则 & 5分钟起步

**关键方法：**
- 2 分钟内能做完的事立即做，不要拖延
- 不想动时告诉自己"只做 5 分钟"，往往开始后就停不下来

**适用场景：** 拖延、启动困难

### 6. 艾森豪威尔矩阵

**关键方法：**
- 紧急又重要：立即做
- 重要不紧急：计划做
- 紧急不重要：委托做
- 不紧急不重要：忽略

**适用场景：** 任务优先级判断

---

## 常见错误提醒

- ❌ 没有外部捕获系统 — 试图记住所有事情造成焦虑
- ❌ 不保护专注时间 — 日历被会议填满，没有时间做实事
- ❌ 把所有时间 equal 对待 — 早上9点和下午4点认知能力不同
- ❌ 什么都说 yes — 每个 yes 意味着对其他事情说 no
- ❌ 优化战术却忽视战略 — 在错误的事情上更高效没有帮助
- ❌ 追求完美开始 — 先完成再完美

---

## 对话引导问题

当用户需要帮助时，可以主动询问：

**时间分析：**
- "你典型的一天时间都花在哪了？"
- "有没有什么重要的事却没得到足够时间？"

**任务管理：**
- "你有任务捕获系统吗，还是全靠记？"
- "手头的任务里，哪些是必须今天做的？"

**能量状态：**
- "你什么时候能量最高？那时候一般安排什么工作？"
- "下午犯困的时候一般怎么做？"

**拖延诊断：**
- "拖延最久的那件事是什么？是什么让你不想开始？"
- "如果只做 5 分钟，你会做什么？"

**承诺清理：**
- "你有什么应该放下的承诺？"
- "哪些事可以做也可以不做？"

---

## 实用建议

### 入门建议 (第一周)

1. **从一件小事开始** — 不要试图一次性改变所有习惯
2. **建立捕获系统** — 想到什么立即写下来
3. **记录然后复盘** — 看看时间实际花在哪
4. **保护峰值时间** — 最高效的时间段做最重要的事
5. **定期清理承诺** — 哪些可以拒绝或延期

### 进阶建议 (一个月后)

1. 开始使用时间块
2. 分析自己的能量周期
3. 建立每周回顾习惯
4. 优化任务分类系统
5. 持续迭代自己的系统

---

## 注意事项

- 🎯 每个人的高效方式不同，需要因人而异
- 🔄 效率系统需要持续迭代
- ⚖️ 工作和生活平衡同样重要
- 💪 接受不完美，系统是慢慢完善的

---

## 版本

- v1.0.0 - 初始版本，包含完整方法论和对话引导

---

*🦐 记住：效率是为了更好地生活，不是为了做更多事。*

## Tools
## Tools

## Examples

```bash
# Example usage
skill --help
```


### Productivity Framework

```markdown
1. Time Audit - Track where time goes
2. Time Blocking - Schedule focused work
3. Energy Management - Match tasks to energy levels
4. Task Capture - Quick inbox for all tasks
5. Weekly Review - Assess and plan
```

### Key Questions

```markdown
- What is the ONE thing that matters most today?
- What can I delegate or eliminate?
- When am I most focused during the day?
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


## API Reference

### Main Functions

```python
# Initialize
skill = Skill()

# Process data
result = skill.process(input_data)

# Cleanup
skill.close()
```

### Configuration

```python
# With options
config = {"option1": "value1", "option2": "value2"}
skill = Skill(config)
```


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

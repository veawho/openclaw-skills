---
name: self-evolve-agent
description: |
  Agent 自主进化引擎——让 AI agent 像生物进化一样持续变强。
  核心循环：感知差距 → 搜索方案 → 设计实验 → 跑实验 → 选赢家 → 固化 → 下一轮。
  使用场景：定期自主进化、能力升级、工作流优化、skill/工具迭代。
  关键词：进化, evolution, self-improve, A/B test, 实验。
---

# Self-Evolve — Agent 自主进化引擎

## Overview

让 AI agent 像生物进化一样持续变强。


```
# Self-evolution loop
evolution_cycle()
perceive_gap()
design_experiment()
run_experiment()
select_winner()
solidify()
```



## When to Use

- 定期自主进化、能力升级
- 工作流优化
- skill/工具迭代
- 关键词：进化, evolution, self-improve, A/B test, 实验

> 生物进化的核心机制：变异 → 选择 → 保留。
> 这个 skill 把同样的机制应用到 agent 自身——不断发现可改进的角度，用实验找到更好的方案，然后永久固化。

## 这是什么

Self-Evolve 是一个 **meta-skill**——它不解决具体业务问题，而是让 agent 自身变强。

* **和 `self-think` 的边界**：`self-think` 进行反思并发现短板（诊断），`self-evolve` 对短板寻找解法并跑实验验证（治疗）。
* **不是什么**：禁止无目标的空转、禁止为写长篇自省报告而改排版的“伪进化”。（详细约束见: [约束与红线](references/constraints-and-rules.md)）

## 快速使用说明 (Quick Start)

### 触发方式
当被以下情况触发时，请启动 Self-Evolve：
1. **自动触发**：`self-think` 建议进化，或是 cron/HEARTBEAT 定时唤醒。
2. **显式要求**：用户下令“进化一下某个能力”。

### 执行协议 (The 4-Step Tick)
每次触发此技能，你必须执行一次且仅执行一次“滴答巡航”（Tick Handler），绝不能无视状态机一次性跑完实验全流程。
完整并发状态机制及操作边界，请细读： [执行状态机与四步巡航协议](references/execution-protocol.md)

1. **Step 1: Status Sync** - 扫描 `state.json` 的活跃实验。
2. **Step 2: Record Observations** - 将观察指标降噪后写入相应的 `jsonl` 记录。
3. **Step 3: Evaluate & Solidify** - 将到期限对比基线固化，并清理任务队列。
4. **Step 4: Launch New Experiment** - 如并发额度允许（<10），则寻找新瓶颈，搜索方案，设计实验并在状态机注册 `OBSERVING`。部署要求参考 [模板与输出规范](assets/evolution-report-template.md)。

> 🚨 **注意**：部署新实验并更新状态机锁后，**本轮巡航彻底结束，必须强制停止（Exit对话）**，等待下一次唤醒！

## 参考结构指南

你需要严格遵照以下文件来展开进化，**严禁凭感觉行事**：

* [执行状态机与四步巡航协议](references/execution-protocol.md) - How to run a tick (Step 1 to Step 4).
* [约束红线与分级自主权](references/constraints-and-rules.md) - What is NOT allowed (Anti-Pseudo Constraint).
* [质量自检 Checklist](references/quality-checklist.md) - Validation for the experimental design and solidification.
* [模板与文件规范](assets/evolution-report-template.md) - Data storage paths, YAML format, markdown templates.

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


## Getting Started

1. Install the skill
2. Configure settings
3. Run your first command
4. Explore advanced features

For more details, see the Examples section above.

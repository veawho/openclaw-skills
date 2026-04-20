---
name: multi-agent-coordinator
description: Coordinate multiple AI agents to complete complex tasks together.
---

# Multi-Agent Coordinator Skill

## Overview

  让AI Agent协调多个子Agent（Learner、Critic等）完成复杂任务。 

## When to Use

- Multi-agent coordination

## OVERVIEW_PLACEHOLDER ## 概述

这个Skill帮助主Agent：
1. 创建和协调子Agent
2. 处理one-shot Agent限制
3. 实现Agent间通信
4. 整合多Agent结果

---

## 使用场景

- 需要搜索最新信息（调用Learner）
- 需要质量评估（调用Critic）
- 需要Multi-Agent协作
- 需要处理OpenClaw框架限制

---

## 核心功能

### 1. Agent创建

```javascript
// 创建Learner Agent
const learner = await sessions_spawn({
  label: "learner",
  mode: "run",
  task: "搜索X..."
});

// 创建Critic Agent
const critic = await sessions_spawn({
  label: "critic",
  mode: "run",
  task: "评估Y..."
});
```

### 2. Agent通信

```javascript
// 发送任务给Learner
await sessions_send(learner.childSessionKey, {
  message: "搜索...",
  timeout_ms: 60000
});

// 接收Learner结果
// 结果会自动返回
```

### 3. 结果整合

```javascript
// 整合Learner搜索结果
// 整合Critic评估
// 生成最终答案
```

---

## 最佳实践

### Critic稳定性

**问题**: 超时
**解决**: 简化prompt（<200字），timeout=30秒

### Learner使用

**限制**: one-shot，每次需重新创建
**接受**: 无法持久化（框架限制）
**优化**: 快速创建，简单任务

### 主Agent职责

- 作为唯一接口与用户对话
- 简洁汇报子Agent工作
- 主动咨询Critic（重要决策）

---

## 限制

### OpenClaw框架限制

- `thread=true` 不可用
- `mode="session"` 需要 `thread=true`
- 只能使用 `mode="run"`（one-shot临时Agent）

### 应对

- 接受one-shot限制
- 优化创建流程
- 使用ontology作为外部共享记忆

---

## 示例

### 场景：Docker性能优化

```javascript
// 1. 创建Learner
const learner = await spawnLearner();

// 2. 发送搜索任务
await sessions_send(learner, {
  message: "搜索Docker性能优化"
});

// 3. 接收结果
// 结果自动返回

// 4. 创建Critic
const critic = await spawnCritic();

// 5. 评估结果
await sessions_send(critic, {
  message: "评估Docker优化建议",
  timeout_ms: 30000
});

// 6. 整合答案
// 返回给用户
```

---

## 相关Skills

- **ontology** - 知识图谱，共享状态
- **self-improvement** - 记录教训
- **context-recovery** - 恢复上下文

---

## 作者

Main Agent (OpenClaw)

## 版本

1.0.0

## 标签

multi-agent, coordination, learner, critic, collaboration

---

**这个Skill基于实际的Multi-Agent协作经验总结。**

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

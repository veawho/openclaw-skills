---
name: omni-coordinator
description: 综合调度智能体 - 自动组合多个Skills的能力来完成复杂任务。通过智能分析任务类型、调度合适的Skills、管理数据流和处理跨Skill协作，实现"一键式"复杂任务处理。
description_zh: 综合调度智能体 - 自动组合多个Skills的能力来完成复杂任务。通过智能分析任务类型、调度合适的Skills、管理数据流和处理跨Skill协作，实现"一键式"复杂任务处理。
version: 1.0.0
author: "巫师 叔叔"
homepage: https://github.com/veawho/openclaw-skills
---

# Omni-Coordinator - 综合调度智能体

## Overview

Omni-Coordinator 是 OpenClaw 的"大脑" - 它能自动分析用户任务，调用合适的Skills，组合它们的能力，并管理任务执行流程。

当你有一个复杂任务需要多种能力时，只需告诉 Omni-Coordinator，它会自动：
1. 分析任务类型
2. 选择合适的 Skills 组合
3. 调度执行顺序
4. 管理数据传递
5. 整合最终结果

## When to Use

- 复杂任务需要多种能力组合
- 不确定应该使用哪个 Skill
- 需要多个 Skills 协同工作
- 希望"一句话完成复杂任务"
- 任务涉及：浏览器操作 + AI 处理 + 数据存储 + 代码执行

## Capabilities

### 🎯 任务分析引擎

```
输入: 用户自然语言任务
分析: 任务类型识别 → 需要的Skills列表 → 执行计划
输出: 调度方案
```

### 🔧 Skills 调度中心

| 任务类型 | 调度的 Skills | 组合模式 |
|---------|--------------|---------|
| 智能问答 | agent + memory + rag | 知识库问答 |
| Web 自动化 | browser + automation | 网页抓取/操作 |
| 代码开发 | code + ai + gitflow | 代码生成/审查 |
| 数据处理 | rag + embeddings + memory | 数据提取/分析 |
| 内容创作 | ai-writing-agent + vector-memory | 文章生成 |
| 任务编排 | multi-agent-coordinator + cron | 复杂任务分解 |

### 📊 数据流管理

```
User Task → 分析 → 调度 Skills → 并行/串行执行 → 数据整合 → 结果输出
```

### 🧠 记忆管理

- 自动保存任务上下文
- 跨 Skills 数据共享
- 任务历史记忆

## Quick Start

### 基本用法

```bash
# 启动综合调度
omni-coordinator "帮我分析这个网页并总结"

# 指定任务类型
omni-coordinator --type data "处理这些文档"

# 强制使用特定 Skills
omni-coordinator --skills pinecone,rag "构建知识库"
```

### 交互模式

```bash
# 进入对话式调度
omni start

# 查看可用能力
omni capabilities

# 查看调度历史
omni history
```

## Configuration

### 调度模式

```yaml
# openclaw.json 中配置
omni:
  mode: auto  # auto | manual | hybrid
  max_skills: 5  # 最大并发 Skills
  timeout: 300  # 超时时间（秒）
  retry: 3  # 重试次数
```

### Skills 白名单

```yaml
omni:
  allowed_skills:
    - agent-orchestrate
    - multi-agent-coordinator
    - memory-setup
    - pinecone
    - rag
    - clawbrowser
    - gemini
  # 或使用 * 允许所有
```

### 并行配置

```yaml
omni:
  parallel:
    enabled: true
    max_concurrent: 4
  sequential:
    fallback_on_error: true
```

## Architecture

### 核心组件

```
┌─────────────────────────────────────────────────────────┐
│                    Omni-Coordinator                     │
├─────────────────────────────────────────────────────────┤
│  🎯 Task Analyzer     │ 分析任务类型和需求               │
│  📋 Skills Selector  │ 选择最合适的 Skills 组合        │
│  🔄 Workflow Engine  │ 管理执行顺序和流程               │
│  📊 Data Manager     │ 处理 Skills 间数据传递           │
│  🧠 Memory Bridge    │ 维护上下文和记忆                  │
│  ⚡ Result Integrator│ 整合多 Skills 结果               │
└─────────────────────────────────────────────────────────┘
```

### 执行流程

1. **接收任务**: 用户输入自然语言任务
2. **任务分析**: 提取关键实体、意图、约束条件
3. **Skills 选择**: 基于分析结果选择 Skills
4. **生成计划**: 确定执行顺序（并行/串行）
5. **执行调度**: 按计划调用 Skills
6. **数据整合**: 收集并合并各 Skill 输出
7. **结果输出**: 返回最终结果给用户

## Skills 组合预设

### 预设 1: 智能问答系统

```yaml
skills:
  - agent-orchestrate
  - memory-setup
  - pinecone
  - rag
mode: sequential
description: "构建基于本地知识库的问答系统"
```

### 预设 2: Web 自动化工厂

```yaml
skills:
  - clawbrowser
  - playwright-cli-openclaw
  - ai-writing-agent
mode: parallel
description: "自动抓取网页、内容分析和处理"
```

### 预设 3: 代码助手

```yaml
skills:
  - agent-designer
  - code-refactor
  - qf-code-review
  - gitflow
mode: sequential
description: "代码生成、审查和版本管理"
```

### 预设 4: 多智能体协作

```yaml
skills:
  - multi-agent-coordinator
  - agent-team-orchestration
  - friday-multi-agent-orchestrator
mode: parallel
description: "多个智能体协同处理复杂任务"
```

### 预设 5: 数据处理管道

```yaml
skills:
  - rag-ingest
  - embeddings
  - memory-qdrant
  - local-rag-search
mode: sequential
description: "文档处理、向量化和检索"
```

## Examples

### Example 1: 复杂任务一句完成

```bash
# 输入
omni-coordinator "分析这个网页内容，提取关键信息并存入知识库"

# Omni 自动：
# 1. clawbrowser → 抓取网页
# 2. ai-writing-agent → 内容分析
# 3. pinecone/rag → 存入知识库
# 4. 返回结果
```

### Example 2: 多技能组合

```bash
# 输入
omni-coordinator "帮我写一段代码，实现用户登录功能，并进行安全审查"

# Omni 自动：
# 1. ai-writing-agent → 生成代码
# 2. code-refactor → 代码优化
# 3. qf-code-review → 安全审查
# 4. gitflow → 版本管理
```

### Example 3: 知识库问答

```bash
# 输入
omni-coordinator "基于我们的文档回答：OpenClaw如何配置子代理？"

# Omni 自动：
# 1. pinecone → 检索相关文档
# 2. rag → 处理检索结果
# 3. gemini → 生成答案
# 4. 返回答案和引用来源
```

### Example 4: 并行任务处理

```bash
# 输入
omni-coordinator --parallel "同时处理：1)抓取科技新闻 2)分析股票数据 3)生成报告"

# Omni 并行执行三个任务，最后整合结果
```

## Environment Variables

```bash
# Omni Coordinator 配置
OMNI_MODE=auto                    # 调度模式
OMNI_MAX_SKILLS=5                 # 最大并发 Skills
OMNI_TIMEOUT=300                  # 超时时间
OMNI_LOG_LEVEL=info               # 日志级别

# Skills 目录
SKILLS_DIR=/home/node/.openclaw/workspace/skills

# 记忆配置
OMNI_MEMORY_DIR=/home/node/.openclaw/workspace/memory
```

## Troubleshooting

### 问题：Skills 选择不当

```
检查: omni logs --analysis
调整: omni config set allowed_skills [...]
```

### 问题：执行顺序错误

```
检查: omni plan --show
调整: omni config set mode=manual
```

### 问题：数据传递失败

```
检查: omni debug --data-flow
调整: 确认 Skills 间的数据格式兼容
```

### 问题：超时

```
检查: omni status --long-running
调整: omni config set timeout=600
```

## Performance Tips

### 1. 优化 Skills 选择

- 尽量精确描述任务
- 指定任务类型可以加速分析
- 限制并发 Skills 数量

### 2. 记忆缓存

- 相同任务会使用缓存
- `omni clear-cache` 清除缓存

### 3. 并行加速

- 独立任务使用 `--parallel`
- 依赖任务使用 `--sequential`

### 4. 监控执行

```bash
omni status          # 查看当前状态
omni logs -f         # 实时日志
omni stats           # 性能统计
```

## Dependencies

- OpenClaw Gateway
- 至少 1 个其他 Skill（Omni 不能单独工作）
- 推荐: agent-orchestrate, memory-setup

## See Also

- [agent-orchestrate](../agent-orchestrate/SKILL.md) - 智能体编排
- [memory-setup](../memory-setup/SKILL.md) - 记忆系统配置
- [pinecone](../pinecone/SKILL.md) - 向量数据库
- [clawbrowser](../clawbrowser/SKILL.md) - 浏览器控制
- [multi-agent-coordinator](../multi-agent-coordinator/SKILL.md) - 多智能体协调
## Functions

### Core Functions

```python
def main():
    '''Main entry point'''
    pass

def process(data):
    '''Process input data'''
    return processed_data

def validate(config):
    '''Validate configuration'''
    return True
```

### Helper Functions

```python
def log(message):
    '''Log message with timestamp'''
    print(f"[{datetime.now()}] {message}")

def error_handler(e):
    '''Handle errors gracefully'''
    logger.error(f"Error: {e}")
```


## Modules

### Main Module

```python
class Skill:
    def __init__(self, config):
        self.config = config
        
    def run(self, input_data):
        '''Execute skill with input'''
        return self.process(input_data)
```

### Data Module

```python
class DataHandler:
    def load(self, path):
        '''Load data from file'''
        pass
        
    def save(self, data, path):
        '''Save data to file'''
        pass
```

## Setup

### Installation

```bash
pip install -r requirements.txt
npm install  # if Node.js
```

### Configuration

Create a config file at `config.yaml`:

```yaml
skill:
  enabled: true
  timeout: 300
```

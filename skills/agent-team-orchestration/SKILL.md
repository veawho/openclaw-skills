---
name: agent-team-orchestration
description: "Orchestrate multi-agent teams with defined roles, task lifecycles, handoff protocols, and review workflows. Use when: (1) Setting up a team of 2+ agents with different specializations, (2) Defining task routing and lifecycle (inbox → spec → build → review → done), (3) Creating handoff protocols between agents, (4) Establishing review and quality gates, (5) Managing async communication and artifact sharing between agents."
---

# Agent Team Orchestration


## 中文说明

### 简介

agent-team-orchestration - "Orchestrate multi-agent teams with defined roles, task lifecycles, handoff protocols, and review workflows. Use when: (1) Setting up a team of 2+ agents with different specializations, (2) Defining task routing and lifecycle (inbox → spec → build → review → done), (3) Creating handoff protocols between agents, (4) Establishing review and quality gates, (5) Managing async communication and artifact sharing between agents."

### 使用方法

此 Skill 已安装到 `/home/node/.openclaw/workspace/skills/agent-team-orchestration/`

1. 查看 SKILL.md 了解详细用法
2. 如有 scripts/run.sh，可直接运行
3. 参照 Examples 章节中的命令进行操作

### 适用场景

- 请参考 ## When to Use 章节
- 如有疑问，请查看 ## Troubleshooting 章节

### 快速开始

```bash
# 查看帮助
cd /home/node/.openclaw/workspace/skills/agent-team-orchestration
cat SKILL.md

# 运行（如有脚本）
./scripts/run.sh
```

### 注意事项

- 请确保已安装所需依赖
- 建议先阅读 ## Setup 或 ## Installation 章节
- 详细配置说明见 ## Configuration 章节

## Overview

  Production playbook for running multi-agent teams with clear roles, structured task flow, and quality gates. 

## When to Use

- Agent team management

## OVERVIEW_PLACEHOLDER ## Quick Start: Minimal 2-Agent Team

A builder and a reviewer. The simplest useful team.

### 1. Define Roles

```
Orchestrator (you) — Route tasks, track state, report results
Builder agent     — Execute work, produce artifacts
```

### 2. Spawn a Task

```
1. Create task record (file, DB, or task board)
2. Spawn builder with:
   - Task ID and description
   - Output path for artifacts
   - Handoff instructions (what to produce, where to put it)
3. On completion: review artifacts, mark done, report
```

### 3. Add a Reviewer

```
Builder produces artifact → Reviewer checks it → Orchestrator ships or returns
```

That's the core loop. Everything below scales this pattern.

## Core Concepts

### Roles

Every agent has one primary role. Overlap causes confusion.

| Role | Purpose | Model guidance |
|------|---------|---------------|
| **Orchestrator** | Route work, track state, make priority calls | High-reasoning model (handles judgment) |
| **Builder** | Produce artifacts — code, docs, configs | Can use cost-effective models for mechanical work |
| **Reviewer** | Verify quality, push back on gaps | High-reasoning model (catches what builders miss) |
| **Ops** | Cron jobs, standups, health checks, dispatching | Cheapest model that's reliable |

→ *Read [references/team-setup.md](references/team-setup.md) when defining a new team or adding agents.*

### Task States

Every task moves through a defined lifecycle:

```
Inbox → Assigned → In Progress → Review → Done | Failed
```

**Rules:**
- Orchestrator owns state transitions — don't rely on agents to update their own status
- Every transition gets a comment (who, what, why)
- Failed is a valid end state — capture why and move on

→ *Read [references/task-lifecycle.md](references/task-lifecycle.md) when designing task flows or debugging stuck tasks.*

### Handoffs

When work passes between agents, the handoff message includes:

1. **What was done** — summary of changes/output
2. **Where artifacts are** — exact file paths
3. **How to verify** — test commands or acceptance criteria
4. **Known issues** — anything incomplete or risky
5. **What's next** — clear next action for the receiving agent

Bad handoff: *"Done, check the files."*
Good handoff: *"Built auth module at `/shared/artifacts/auth/`. Run `npm test auth` to verify. Known issue: rate limiting not implemented yet. Next: reviewer checks error handling edge cases."*

### Reviews

Cross-role reviews prevent quality drift:

- **Builders review specs** — "Is this feasible? What's missing?"
- **Reviewers check builds** — "Does this match the spec? Edge cases?"
- **Orchestrator reviews priorities** — "Is this the right work right now?"

Skip the review step and quality degrades within 3-5 tasks. Every time.

→ *Read [references/communication.md](references/communication.md) when setting up agent communication channels.*
→ *Read [references/patterns.md](references/patterns.md) for proven multi-step workflows.*

## Reference Files

| File | Read when... |
|------|-------------|
| [team-setup.md](references/team-setup.md) | Defining agents, roles, models, workspaces |
| [task-lifecycle.md](references/task-lifecycle.md) | Designing task states, transitions, comments |
| [communication.md](references/communication.md) | Setting up async/sync communication, artifact paths |
| [patterns.md](references/patterns.md) | Implementing specific workflows (spec→build→test, parallel research, escalation) |

## Common Pitfalls

### Spawning without clear artifact output paths
Agent produces great work, but you can't find it. Always specify the exact output path in the spawn prompt. Use a shared artifacts directory with predictable structure.

### No review step = quality drift
"It's a small change, skip review." Do this three times and you have compounding errors. Every artifact gets at least one set of eyes that didn't produce it.

### Agents not commenting on task progress
Silent agents create coordination blind spots. Require comments at: start, blocker, handoff, completion. If an agent goes silent, assume it's stuck.

### Not verifying agent capabilities before assigning
Assigning browser-based testing to an agent without browser access. Assigning image work to a text-only model. Check capabilities before routing.

### Orchestrator doing execution work
The orchestrator routes and tracks — it doesn't build. The moment you start "just quickly doing this one thing," you've lost oversight of the rest of the team.

## When NOT to Use This Skill

- **Single-agent setups** — Just follow standard AGENTS.md conventions. Team orchestration adds overhead that solo agents don't need.
- **One-off task delegation** — Use `sessions_spawn` directly. This skill is for sustained workflows with multiple handoffs.
- **Simple question routing** — If you're just forwarding a question to a specialist, that's a message, not a workflow.

This skill is for **sustained team workflows** — recurring collaboration patterns where agents depend on each other's output over multiple tasks.

## Tools

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

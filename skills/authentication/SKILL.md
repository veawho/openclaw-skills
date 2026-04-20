---
name: authentication
description: "Proving identity: sessions, tokens, MFA, recovery. Use when implementing login, token refresh, or auth bugs."
description_zh: "Proving identity: sessions, tokens, MFA, recovery. 用于 implementing login, token refresh, 或 uth bugs."。
---

# Authentication Skill


## 中文说明

### 简介

authentication - "Proving identity: sessions, tokens, MFA, recovery. Use when implementing login, token refresh, or auth bugs."

### 使用方法

此 Skill 已安装到 `/home/node/.openclaw/workspace/skills/authentication/`

1. 查看 SKILL.md 了解详细用法
2. 如有 scripts/run.sh，可直接运行
3. 参照 Examples 章节中的命令进行操作

### 适用场景

- 请参考 ## When to Use 章节
- 如有疑问，请查看 ## Troubleshooting 章节

### 快速开始

```bash
# 查看帮助
cd /home/node/.openclaw/workspace/skills/authentication
cat SKILL.md

# 运行（如有脚本）
./scripts/run.sh
```

### 注意事项

- 请确保已安装所需依赖
- 建议先阅读 ## Setup 或 ## Installation 章节
- 详细配置说明见 ## Configuration 章节

## Overview

Structured guidance for Authentication work—sessions, tokens, MFA, recovery.


```python
# Token refresh example
def refresh_token(refresh_token):
    response = oauth_client.refresh_token(refresh_token)
    return response["access_token"]
```



## When to Use

- Implementing login or token refresh
- Authentication bugs or issues
- Building auth systems
- Preparing auth reviews or rollouts

This skill provides structured guidance for **Authentication** work. Act as an active guide: confirm triggers, propose the stages below, and adapt if the user wants a lighter pass.

## When to Offer This Workflow

**Trigger conditions:**
- User mentions **authentication** or closely related work
- They want a structured workflow rather than ad-hoc tips
- They are preparing a review, rollout, or stakeholder communication

**Initial offer:**
Explain the four stages briefly and ask whether to follow this workflow or work freeform. If they decline, continue in their preferred style.

## Workflow Stages

### Stage 1: Clarify context & goals

Anchor on **threat model: sessions vs tokens**. Ask what success looks like, constraints, and what must not break. Capture unknowns early.

### Stage 2: Design or plan the approach

Translate goals into a concrete plan around **passwords, MFA, and recovery**. Compare alternatives and explicit trade-offs; avoid implicit assumptions.

### Stage 3: Implement, validate, and harden

Execute with verification loops tied to **token lifetime and refresh**. Prefer small steps, measurable checks, and rollback points where risk is high.

### Stage 4: Operate, communicate, and iterate

Close the loop with **logging, lockout, and abuse**: monitoring, documentation, stakeholder updates, and lessons learned for the next cycle.

## Checklist Before Completion

- Goals and constraints are explicit for **Authentication Skill**
- Risks and trade-offs are stated, not hand-waved
- Verification steps match the change’s impact (tests, canary, peer review)
- Operational follow-through is covered (monitoring, docs, owners)

## Tips for Effective Guidance

- Be procedural: stage-by-stage, with clear exit criteria
- Ask for missing context (environment, scale, deadlines) before prescribing
- Prefer checklists and concrete examples over generic platitudes
- If the user declines the workflow, switch to freeform help without lecturing

## Handling Deviations

- If the user wants to skip a stage: confirm and continue with what they need.
- If context is missing: ask targeted questions before strong recommendations.
- Prefer concrete examples, trade-offs, and verification steps over generic advice.

## Quality Bar

- Each recommendation should be **actionable** (what to do next).
- Call out **failure modes** relevant to Authentication (security, scale, UX, or ops).
- Keep tone direct and respectful of the user’s time.

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

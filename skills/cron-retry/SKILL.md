---
name: cron-retry
description: Auto-retry failed cron jobs on connection recovery. Use when cron jobs fail due to network errors and should be retried when connectivity is restored. Integrates with heartbeat to detect failed jobs and re-run them automatically.
---

# Cron Retry Skill


## 中文说明

### 简介

cron-retry - Auto-retry failed cron jobs on connection recovery. Use when cron jobs fail due to network errors and should be retried when connectivity is restored. Integrates with heartbeat to detect failed jobs and re-run them automatically.

### 使用方法

此 Skill 已安装到 `/home/node/.openclaw/workspace/skills/cron-retry/`

1. 查看 SKILL.md 了解详细用法
2. 如有 scripts/run.sh，可直接运行
3. 参照 Examples 章节中的命令进行操作

### 适用场景

- 请参考 ## When to Use 章节
- 如有疑问，请查看 ## Troubleshooting 章节

### 快速开始

```bash
# 查看帮助
cd /home/node/.openclaw/workspace/skills/cron-retry
cat SKILL.md

# 运行（如有脚本）
./scripts/run.sh
```

### 注意事项

- 请确保已安装所需依赖
- 建议先阅读 ## Setup 或 ## Installation 章节
- 详细配置说明见 ## Configuration 章节

## Overview

Auto-retry failed cron jobs on connection recovery. Use when cron jobs fail due to network errors and should be retried when connectivity is restored. Integrates with heartbeat to detect failed jobs and re-run them automatically.

## When to Use

- TODO: add common use cases


Automatically detect and retry cron jobs that failed due to network/connection errors.

## Quick Start (Heartbeat Integration)

Add this to your `HEARTBEAT.md`:

```markdown
## Cron Recovery Check
Check for cron jobs with lastStatus: "error". If the error matches network patterns (connection error, sendMessage failed, fetch failed, ETIMEDOUT, ECONNREFUSED), retry the job using cron tool with action: "run" and the job ID. Report what was recovered.
```

That's it. On each heartbeat, failed network jobs get retried automatically.

## How It Works

1. On heartbeat, check all cron jobs via `cron list`
2. Filter for jobs where `lastStatus = "error"` and `enabled = true`
3. Check if `lastError` matches network-related patterns
4. Re-run eligible jobs via `cron run`
5. Report results

## Network Error Patterns (Retryable)

These errors indicate transient network issues worth retrying:

- `Network request.*failed`
- `Connection error`
- `ECONNREFUSED`
- `ETIMEDOUT`
- `ENOTFOUND`
- `sendMessage.*failed`
- `fetch failed`
- `socket hang up`

## What Gets Retried vs Skipped

**Retried:**
- Network timeouts
- Connection refused
- Message send failures
- DNS lookup failures

**Skipped (not retried):**
- Logic errors (bad config, missing data)
- Auth failures
- Disabled jobs
- Jobs that just ran successfully

## Manual Recovery Check

To check and retry failed jobs manually:

```bash
# List all jobs and their status
clawdbot cron list

# Find failed jobs
clawdbot cron list | jq '.jobs[] | select(.state.lastStatus == "error") | {name, error: .state.lastError}'

# Retry a specific job
clawdbot cron run --id <JOB_ID>
```

## Agent Implementation

When implementing the heartbeat check:

```
1. Call cron tool with action: "list"
2. For each job in response.jobs:
   - Skip if job.enabled !== true
   - Skip if job.state.lastStatus !== "error"
   - Check if job.state.lastError matches network patterns
   - If retryable: call cron tool with action: "run", jobId: job.id
3. Report: "Recovered X jobs" or "No failed jobs to recover"
```

## Example Scenario

1. **7:00 PM** — Evening briefing cron fires
2. **Network hiccup** — Telegram send fails
3. **Job marked** `lastStatus: "error"`, `lastError: "Network request for 'sendMessage' failed!"`
4. **7:15 PM** — Connection restored, heartbeat runs
5. **Skill detects** the failed job, sees it's a network error
6. **Retries** the job → briefing delivered
7. **Reports**: "Recovered 1 job: evening-wrap-briefing"

## Safety

- Only retries transient network errors
- Respects job enabled state
- Won't create retry loops (checks lastRunAtMs)
- Reports all recovery attempts

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

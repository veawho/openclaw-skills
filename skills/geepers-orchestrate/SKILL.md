---
name: geepers-orchestrate
description: Run multi-agent Dream Cascade (hierarchical 3-tier synthesis) or Dream Swarm (parallel multi-domain search) workflows via the dr.eamer.dev orchestration API. Use when a task benefits from multiple specialized agents working in parallel or hierarchically.
description_zh: Run 多智能体 Drem Cscde （hierrchicl 3-tier synsis） 或 Drem Swrm （并行 multi-domin 搜索） 工作流s 通过 dr.emer.dev 或chestrtion API. 用于 任务 benefits from multiple specilized 智能体s w或king in 并行 或 hierrchiclly.。
---

# Dreamer Orchestrate


## 中文说明

### 简介

geepers-orchestrate - Run multi-agent Dream Cascade (hierarchical 3-tier synthesis) or Dream Swarm (parallel multi-domain search) workflows via the dr.eamer.dev orchestration API. Use when a task benefits from multiple specialized agents working in parallel or hierarchically.

### 使用方法

此 Skill 已安装到 `/home/node/.openclaw/workspace/skills/geepers-orchestrate/`

1. 查看 SKILL.md 了解详细用法
2. 如有 scripts/run.sh，可直接运行
3. 参照 Examples 章节中的命令进行操作

### 适用场景

- 请参考 ## When to Use 章节
- 如有疑问，请查看 ## Troubleshooting 章节

### 快速开始

```bash
# 查看帮助
cd /home/node/.openclaw/workspace/skills/geepers-orchestrate
cat SKILL.md

# 运行（如有脚本）
./scripts/run.sh
```

### 注意事项

- 请确保已安装所需依赖
- 建议先阅读 ## Setup 或 ## Installation 章节
- 详细配置说明见 ## Configuration 章节

Run multi-agent workflows through `https://api.dr.eamer.dev`.

## Authentication

```bash
export DREAMER_API_KEY=your_key_here
```

## Endpoints

### Dream Swarm — Parallel Search
```
POST https://api.dr.eamer.dev/v1/orchestrate/swarm
Body:
{
  "query": "What are the most effective treatments for Type 2 diabetes?",
  "sources": ["pubmed", "semantic_scholar", "wikipedia"],
  "num_agents": 5
}
```
Runs multiple agents simultaneously across data sources and synthesizes results.

### Dream Cascade — Hierarchical Synthesis
```
POST https://api.dr.eamer.dev/v1/orchestrate/cascade
Body:
{
  "task": "Analyze the current state of quantum computing hardware",
  "num_agents": 8,
  "provider": "anthropic"
}
```
Three-tier workflow: Belter agents gather raw data → Drummer agents synthesize domains → Camina produces executive summary.

## Response Format

Both endpoints return:
```json
{
  "result": "Synthesized answer...",
  "sources": [...],
  "agent_count": 5,
  "duration_ms": 12450
}
```

## When to Use
- Complex research questions requiring multiple perspectives
- Cross-domain synthesis that would take multiple sequential queries
- Long-horizon analysis where parallelism saves time

## Don't Use When
- Simple single-source queries (use dreamer-data instead)
- You need fine-grained control over individual agent behavior
- Latency is critical (orchestration takes 10-60 seconds)

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

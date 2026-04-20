---
name: arxiv-watcher
description: Search and summarize papers from ArXiv. Use when the user asks for the latest research, specific topics on ArXiv, or a daily summary of AI papers.
---

# ArXiv Watcher


## 中文说明

### 简介

arxiv-watcher - Search and summarize papers from ArXiv. Use when the user asks for the latest research, specific topics on ArXiv, or a daily summary of AI papers.

### 使用方法

此 Skill 已安装到 `/home/node/.openclaw/workspace/skills/arxiv-watcher/`

1. 查看 SKILL.md 了解详细用法
2. 如有 scripts/run.sh，可直接运行
3. 参照 Examples 章节中的命令进行操作

### 适用场景

- 请参考 ## When to Use 章节
- 如有疑问，请查看 ## Troubleshooting 章节

### 快速开始

```bash
# 查看帮助
cd /home/node/.openclaw/workspace/skills/arxiv-watcher
cat SKILL.md

# 运行（如有脚本）
./scripts/run.sh
```

### 注意事项

- 请确保已安装所需依赖
- 建议先阅读 ## Setup 或 ## Installation 章节
- 详细配置说明见 ## Configuration 章节

## Overview

  This skill interacts with the ArXiv API to find and summarize the latest research papers. 

## When to Use

- arXiv paper monitoring

## OVERVIEW_PLACEHOLDER ## Capabilities

- **Search**: Find papers by keyword, author, or category.
- **Summarize**: Fetch the abstract and provide a concise summary.
- **Save to Memory**: Automatically record summarized papers to `memory/RESEARCH_LOG.md` for long-term tracking.
- **Deep Dive**: Use `web_fetch` on the PDF link to extract more details if requested.

## Workflow

1. Use `scripts/search_arxiv.sh "<query>"` to get the XML results.
2. Parse the XML (look for `<entry>`, `<title>`, `<summary>`, and `<link title="pdf">`).
3. Present the findings to the user.
4. **MANDATORY**: Append the title, authors, date, and summary of any paper discussed to `memory/RESEARCH_LOG.md`. Use the format:
   ```markdown
   ### [YYYY-MM-DD] TITLE_OF_PAPER
   - **Authors**: Author List
   - **Link**: ArXiv Link
   - **Summary**: Brief summary of the paper and its relevance.
   ```

## Examples

- "Busca los últimos papers sobre LLM reasoning en ArXiv."
- "Dime de qué trata el paper con ID 2512.08769."
- "Hazme un resumen de las novedades de hoy en ArXiv sobre agentes."

## Resources

- `scripts/search_arxiv.sh`: Direct API access script.

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

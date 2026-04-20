---
name: rag-ingest
description: 将 Agent 已解读好的正文写入 Qdrant（kb_main）。仅做 chunk、embedding 和向量写入，不负责抓取与精炼。
metadata: { "openclaw": { "emoji": "🧠", "requires": { "bins": ["node"], "env": ["QDRANT_URL", "EMBED_API_KEY"] }, "primaryEnv": "QDRANT_URL" } }
---

# rag-ingest


## 中文说明

### 简介

rag-ingest - 将 Agent 已解读好的正文写入 Qdrant（kb_main）。仅做 chunk、embedding 和向量写入，不负责抓取与精炼。

### 使用方法

此 Skill 已安装到 `/home/node/.openclaw/workspace/skills/rag-ingest/`

1. 查看 SKILL.md 了解详细用法
2. 如有 scripts/run.sh，可直接运行
3. 参照 Examples 章节中的命令进行操作

### 适用场景

- 请参考 ## When to Use 章节
- 如有疑问，请查看 ## Troubleshooting 章节

### 快速开始

```bash
# 查看帮助
cd /home/node/.openclaw/workspace/skills/rag-ingest
cat SKILL.md

# 运行（如有脚本）
./scripts/run.sh
```

### 注意事项

- 请确保已安装所需依赖
- 建议先阅读 ## Setup 或 ## Installation 章节
- 详细配置说明见 ## Configuration 章节

## Overview

将 Agent 已解读好的正文写入 Qdrant（kb_main）。仅做 chunk、embedding 和向量写入，不负责抓取与精炼。

## When to Use

- TODO: add common use cases


## Usage

```bash
# 直接通过 --content 传入正文
node skills/rag-ingest/scripts/ingest.mjs \
  --doc-id "doc-001" \
  --topic-tags "net,security" \
  --content "已解读好的长文本..."

# 从 stdin 读取正文（推荐与 deep-research/summarize 配合）
echo "已解读好的长文本..." | node skills/rag-ingest/scripts/ingest.mjs \
  --doc-id "doc-002" \
  --topic-tags "web,http" \
  --source "https://example.com/article"
```

## Parameters

| Param         | Required | Example                        | Description                          |
|--------------|----------|--------------------------------|--------------------------------------|
| `--doc-id`   | yes      | `doc-001`                      | 文档 ID，用于标识/覆盖同一文档       |
| `--topic-tags` | yes    | `net,security`                 | 逗号分隔标签，用于检索过滤          |
| `--content`  | no       | `"..."`                       | 正文；不传时从 stdin 读取           |
| `--source`   | no       | `"https://example.com"`       | 来源标识，写入 payload.source       |
| `--collection` | no     | `kb_main`                      | Qdrant collection 名称              |



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


## Examples

### Basic Example

```bash
# Install
pip install {skill_dir}

# Run
{skill_dir} --help
```

### Advanced Example

```bash
# With options
{skill_dir} run --input "data" --output "result"

# Batch mode
{skill_dir} batch --files "*.txt"
```


## Getting Started

1. Install the skill
2. Configure settings
3. Run your first command
4. Explore advanced features

For more details, see the Examples section above.

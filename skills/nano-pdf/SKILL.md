---
name: nano-pdf
description: Edit PDFs with natural-language instructions using the nano-pdf CLI.
homepage: https://pypi.org/project/nano-pdf/
metadata: {"clawdbot":{"emoji":"📄","requires":{"bins":["nano-pdf"]},"install":[{"id":"uv","kind":"uv","package":"nano-pdf","bins":["nano-pdf"],"label":"Install nano-pdf (uv)"}]}}
---

# nano-pdf


## 中文说明

### 简介

nano-pdf - Edit PDFs with natural-language instructions using the nano-pdf CLI.

### 使用方法

此 Skill 已安装到 `/home/node/.openclaw/workspace/skills/nano-pdf/`

1. 查看 SKILL.md 了解详细用法
2. 如有 scripts/run.sh，可直接运行
3. 参照 Examples 章节中的命令进行操作

### 适用场景

- 请参考 ## When to Use 章节
- 如有疑问，请查看 ## Troubleshooting 章节

### 快速开始

```bash
# 查看帮助
cd /home/node/.openclaw/workspace/skills/nano-pdf
cat SKILL.md

# 运行（如有脚本）
./scripts/run.sh
```

### 注意事项

- 请确保已安装所需依赖
- 建议先阅读 ## Setup 或 ## Installation 章节
- 详细配置说明见 ## Configuration 章节

## Overview

  Use `nano-pdf` to apply edits to a specific page in a PDF using a natural-language instruction. 

## When to Use

- PDF processing and analysis

## Quick start

```bash
nano-pdf edit deck.pdf 1 "Change the title to 'Q3 Results' and fix the typo in the subtitle"
```

Notes:
- Page numbers are 0-based or 1-based depending on the tool’s version/config; if the result looks off by one, retry with the other.
- Always sanity-check the output PDF before sending it out.

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


## Examples

### Extract Text from PDF

```bash
nano-pdf extract document.pdf --pages 1-5
```

### Edit PDF Content

```bash
# Edit first page title
nano-pdf edit report.pdf 0 "Change title to 'Annual Report 2026'"

# Fix typos
nano-pdf edit report.pdf 2 "Fix spelling error in paragraph 3"
```

### Merge PDFs

```bash
nano-pdf merge file1.pdf file2.pdf output.pdf
```

### Split PDF

```bash
nano-pdf split large.pdf --pages 10 --output prefix_
```

## Tips

- Always backup original PDF before editing
- Use `--dry-run` to preview changes without applying
- Check page numbering convention (0-based vs 1-based)


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

---
name: ai-writing-agent
description: AI writing assistant that generates structured articles, blog posts, and marketing content
version: 1.1.0
author: nguyet601
tags:
- writing
- content
- blog
- ai
- copywriting
---

# AI Writing Agent


## 中文说明

### 简介

ai-writing-agent - AI writing assistant that generates structured articles, blog posts, and marketing content

### 使用方法

此 Skill 已安装到 `/home/node/.openclaw/workspace/skills/ai-writing-agent/`

1. 查看 SKILL.md 了解详细用法
2. 如有 scripts/run.sh，可直接运行
3. 参照 Examples 章节中的命令进行操作

### 适用场景

- 请参考 ## When to Use 章节
- 如有疑问，请查看 ## Troubleshooting 章节

### 快速开始

```bash
# 查看帮助
cd /home/node/.openclaw/workspace/skills/ai-writing-agent
cat SKILL.md

# 运行（如有脚本）
./scripts/run.sh
```

### 注意事项

- 请确保已安装所需依赖
- 建议先阅读 ## Setup 或 ## Installation 章节
- 详细配置说明见 ## Configuration 章节

## Overview

See description in frontmatter.

## When to Use

- Writing articles and blog posts
- Marketing content generation
- Structured content creation ## 功能

这个 AI Agent 可以：

- 根据主题生成完整文章
- 自动生成吸引人的标题
- 组织清晰的文章结构
- 生成博客内容
- 生成营销文案
- 生成知识型文章

## 使用方式

用户只需要提供一个简单的写作需求，例如：

- 写一篇关于 AI 的博客
- 写一篇关于远程工作的文章
- 写一篇 SEO 内容营销文章
- 写一篇产品介绍文案

AI Writing Agent 会自动理解需求，并生成完整文章。

## 工作流程

AI Writing Agent 执行以下步骤：

1. 理解用户的主题和写作目标
2. 分析目标读者
3. 生成 SEO 友好的标题
4. 设计文章结构（包含 H2 小标题）
5. 生成完整正文内容
6. 在结尾给出总结和行动建议

## 输出格式

请严格按照以下结构输出：

标题
SEO 描述
正文（包含 H2 小标题结构）
总结
CTA（鼓励读者采取行动）

## 示例

用户输入：

Write a blog post about the benefits of AI tools for productivity.

AI Writing Agent 输出：

标题  
AI 工具如何提升工作效率

正文  
（完整文章内容）

总结  
总结文章核心观点，并给出结论。

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

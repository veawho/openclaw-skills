---
name: knowledge-capture
description: Transform conversations and discussions into structured Notion documentation
description_zh: Trns用于m 对话s 和 discussions into structured Notion 文档tion。
---

## Overview


## 中文说明

### 简介

knowledge-capture - Transform conversations and discussions into structured Notion documentation

### 使用方法

此 Skill 已安装到 `/home/node/.openclaw/workspace/skills/knowledge-capture/`

1. 查看 SKILL.md 了解详细用法
2. 如有 scripts/run.sh，可直接运行
3. 参照 Examples 章节中的命令进行操作

### 适用场景

- 请参考 ## When to Use 章节
- 如有疑问，请查看 ## Troubleshooting 章节

### 快速开始

```bash
# 查看帮助
cd /home/node/.openclaw/workspace/skills/knowledge-capture
cat SKILL.md

# 运行（如有脚本）
./scripts/run.sh
```

### 注意事项

- 请确保已安装所需依赖
- 建议先阅读 ## Setup 或 ## Installation 章节
- 详细配置说明见 ## Configuration 章节

The Knowledge Capture skill transforms conversations, discussions, and unstructured information into organized, structured documentation in Notion. It helps you preserve institutional knowledge by capturing important conversations and converting them into actionable, well-formatted documentation.

## When to Use

Use this skill when you need to:
- Convert transcripts or conversation notes into structured documentation
- Create meeting summaries with action items
- Build knowledge base articles from discussions
- Archive important conversations for future reference
- Extract key insights and decisions from discussions

## Features

- **Smart Content Extraction**: Automatically identifies key points, decisions, and action items from conversations
- **Structured Organization**: Creates well-organized Notion documents with proper hierarchy
- **Metadata Capture**: Preserves participants, dates, and context information
- **Action Item Tracking**: Extracts and formats action items with ownership and deadlines
- **Cross-linking**: Automatically creates links to related documentation and team members

## Requirements

- **Notion API Access**: Integration token with appropriate permissions
- **Target Workspace**: Notion workspace where documentation will be stored
- **Template (Optional)**: Pre-defined Notion template for consistent structure

## Implementation Details

This skill uses the Notion API to:

1. Parse input content (text, transcripts, or discussion notes)
2. Extract key information using structural analysis
3. Format content according to Notion document standards
4. Create or update Notion pages with captured knowledge
5. Maintain cross-references and relationships

### Typical Workflow

```
Input: Conversation/Discussion
  ↓
Parse & Extract
  ↓
Identify: Key Points, Decisions, Action Items
  ↓
Format for Notion
  ↓
Create/Update Notion Document
  ↓
Output: Structured Documentation
```

## Example Use Cases

1. **Team Meeting Notes**
   - Input: Meeting transcript
   - Output: Organized meeting summary with decisions and next steps

2. **Customer Call Documentation**
   - Input: Call notes and transcript
   - Output: Customer interaction record with key requirements

3. **Architecture Discussion**
   - Input: Design discussion notes
   - Output: Architectural decision record with alternatives and rationale

4. **Interview Notes**
   - Input: Interview transcript
   - Output: Structured candidate or user research documentation

## Configuration

Set up these environment variables or Notion settings:

```env
NOTION_API_TOKEN=your_token_here
NOTION_DATABASE_ID=your_database_id
```

## See Also

- [Research Documentation](/skills/research-documentation) - For research-focused documentation
- [Meeting Intelligence](/skills/meeting-intelligence) - For meeting preparation and follow-up
- [Notion API Documentation](https://developers.notion.com)

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

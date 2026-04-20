---
name: private-knowledge-base
description: Personal knowledge base for PDFs, papers, and documents with cross-document Q&A and concept retrieval. Use when: (1) User asks questions about stored documents ("which doc mentions X?"), (2) Need to summarize concepts across multiple PDFs, (3) User wants to ingest new PDFs/papers into knowledge base, (4) Cross-document linking and association is needed, (5) Fast semantic search over personal document collection.
description_zh: Personl 知识库 用于 PDFs, ppers, 和 文档s 使用 cross-文档 问答 和 concept retrievl. 用于: （1） User sks questions bout st或ed 文档s （"which doc mentions X?"）, （2） Need to summrize concepts cross multiple PDFs, （3） User wnts to ingest new PDFs/ppers into 知识库, （4） Cross-文档 linking 和 ssocition is needed, （5） Fst 语义搜索 over personl 文档 collection.。
version: 1.0.0
---

# Private Knowledge Base


## 中文说明

### 简介

private-knowledge-base - Personal knowledge base for PDFs, papers, and documents with cross-document Q&A and concept retrieval. Use when: (1) User asks questions about stored documents ("which doc mentions X?"), (2) Need to summarize concepts across multiple PDFs, (3) User wants to ingest new PDFs/papers into knowledge base, (4) Cross-document linking and association is needed, (5) Fast semantic search over personal document collection.

### 使用方法

此 Skill 已安装到 `/home/node/.openclaw/workspace/skills/private-knowledge-base/`

1. 查看 SKILL.md 了解详细用法
2. 如有 scripts/run.sh，可直接运行
3. 参照 Examples 章节中的命令进行操作

### 适用场景

- 请参考 ## When to Use 章节
- 如有疑问，请查看 ## Troubleshooting 章节

### 快速开始

```bash
# 查看帮助
cd /home/node/.openclaw/workspace/skills/private-knowledge-base
cat SKILL.md

# 运行（如有脚本）
./scripts/run.sh
```

### 注意事项

- 请确保已安装所需依赖
- 建议先阅读 ## Setup 或 ## Installation 章节
- 详细配置说明见 ## Configuration 章节

## Overview

Personal knowledge base for PDFs, papers, and documents with cross-document Q&A and concept retrieval. Use when: (1) User asks questions about stored documents ("which doc mentions X?"), (2) Need to summarize concepts across multiple PDFs, (3) User wants to ingest new PDFs/papers into knowledge base, (4) Cross-document linking and association is needed, (5) Fast semantic search over personal document collection.

## When to Use

- TODO: add common use cases


Personal document storage and retrieval system for PDFs, papers, and research documents.

## Quick Start

### Ingest Documents

```bash
# Add PDF to knowledge base
./scripts/ingest.sh ~/path/to/document.pdf

# Process entire folder
./scripts/ingest-folder.sh ~/papers/
```

### Query Knowledge Base

```bash
# Search for concept across all documents
./scripts/search.sh "transformer architecture"

# Get summary of concept from relevant docs
./scripts/summarize.sh "attention mechanism"
```

## Core Workflows

### 1. Document Ingestion

When user provides new PDFs or papers:

1. Create document entry in `kb/index.json`
2. Extract text and metadata
3. Generate embeddings for semantic search
4. Store in `kb/docs/` with normalized name

### 2. Cross-Document Q&A

When user asks "which document mentions X?" or "summarize X from my docs":

1. Search embeddings for relevant passages
2. Retrieve source documents
3. Synthesize answer across documents
4. Cite sources with document names and page numbers

### 3. Concept Linking

Build associations between documents:
- Shared concepts
- Citation relationships
- Topic clusters

## File Structure

```
private-knowledge-base/
├── SKILL.md
├── scripts/
│   ├── ingest.sh          # Single document ingestion
│   ├── ingest-folder.sh   # Batch ingestion
│   ├── search.sh          # Semantic search
│   └── summarize.sh       # Cross-document summary
├── references/
│   └── schema.md          # KB index schema
└── kb/                    # Created at runtime
    ├── index.json
    ├── embeddings/
    └── docs/
```

## Usage Examples

**User**: "我之前存的文档里，哪篇提到了 transformer?"
→ Run `./scripts/search.sh "transformer"`

**User**: "总结一下我文档里关于 attention 的内容"
→ Run `./scripts/summarize.sh "attention"`

**User**: "把这篇 PDF 加到知识库"
→ Run `./scripts/ingest.sh <pdf-path>`

## Configuration

Set knowledge base location:
```bash
export KB_ROOT=~/.openclaw/workspace/kb
```

Default: `~/kb` if not set.


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

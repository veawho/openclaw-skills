---
name: akashic-knowledge-base
version: 1.0.0
description: Query your knowledge base using AI-powered search. Combines web search with chat AI for comprehensive answers.
description_zh: Query your 知识库 using AI-powered 搜索. Combines web 搜索 使用 cht AI 用于 comprehensive nswers.。
tags:
  - knowledge
  - search
  - qa
  - chat
  - web-search
triggers:
  - search for
  - find information
  - look up
  - what is
  - tell me about
  - knowledge base
tools:
  - mcp:akashic:rag_query
  - mcp:akashic:web_search
  - mcp:akashic:chat_completion
  - mcp:akashic:translate_content
requires:
  mcp:
    - akashic
---

# Akashic Knowledge Base


## 中文说明

### 简介

akashic-knowledge-base - Query your knowledge base using AI-powered search. Combines web search with chat AI for comprehensive answers.

### 使用方法

此 Skill 已安装到 `/home/node/.openclaw/workspace/skills/akashic-knowledge-base/`

1. 查看 SKILL.md 了解详细用法
2. 如有 scripts/run.sh，可直接运行
3. 参照 Examples 章节中的命令进行操作

### 适用场景

- 请参考 ## When to Use 章节
- 如有疑问，请查看 ## Troubleshooting 章节

### 快速开始

```bash
# 查看帮助
cd /home/node/.openclaw/workspace/skills/akashic-knowledge-base
cat SKILL.md

# 运行（如有脚本）
./scripts/run.sh
```

### 注意事项

- 请确保已安装所需依赖
- 建议先阅读 ## Setup 或 ## Installation 章节
- 详细配置说明见 ## Configuration 章节

## Overview

  You are a knowledge assistant powered by the Akashic platform. You help users find information through web search and AI-powered analysis. 

## When to Use

- Semantic knowledge base

## OVERVIEW_PLACEHOLDER ## Capabilities

- **RAG Query**: Search the internal knowledge base using hybrid vector + BM25 search
- **Web Search**: Real-time search using SerpApi (Google) with Tavily fallback
- **Chat AI**: Multi-model AI for answering questions and analyzing search results
- **Translation**: Multilingual support for queries and answers

## Workflow

1. **Understand the question**: Determine if this needs an internal knowledge base query, a web search, or can be answered directly
2. **Knowledge Base Search** (preferred for internal data): Use `rag_query` to search the internal knowledge base
   - Set `include_answer: true` for AI-synthesized answers
   - Use `max_results: 5` for comprehensive retrieval
3. **Web Search** (for external/real-time info): Use `web_search` to find relevant information
   - Use `search_depth: "basic"` for simple factual queries
   - Use `search_depth: "advanced"` for complex topics needing more context
   - Set `include_answer: true` for AI-summarized search results
4. **Synthesize**: Use `chat_completion` to combine search results into a clear answer
5. **Translate** (if needed): Use `translate_content` when the user needs answers in a different language

## Rules

- For questions about internal/proprietary data, always try `rag_query` first
- For questions about real-time or external information, use `web_search`
- For complex questions, combine both `rag_query` and `web_search`, then synthesize with `chat_completion`
- Always cite sources when presenting information from search
- If the user asks in a non-English language, respond in the same language
- For follow-up questions, build on previous search context

## Examples

User: "What does our company policy say about data retention?"
→ Use `rag_query` with query="data retention policy", include_answer=true

User: "What is the current market cap of NVIDIA?"
→ Use `web_search` with query="NVIDIA current market cap 2026", include_answer=true

User: "Compare our internal ESG metrics with industry benchmarks"
→ Use `rag_query` for internal metrics, `web_search` for industry benchmarks, then `chat_completion` to synthesize

User: "Translate the search results about AI regulations into Japanese"
→ First search, then use `translate_content` with target_lang="ja"

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

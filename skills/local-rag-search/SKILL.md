---
name: local-rag-search
description: Efficiently perform web searches using the mcp-local-rag server with semantic similarity ranking. Use this skill when you need to search the web for current information, research topics across multiple sources, or gather context from the internet without using external APIs. This skill teaches effective use of RAG-based web search with DuckDuckGo, Google, and multi-engine deep research capabilities.
description_zh: Efficiently per用于m web 搜索es using mcp-locl-rg server 使用 semntic similrity rnking. Use this skill when you need to 搜索 web 用于 current in用于mtion, re搜索 topics cross multiple sources, 或 gr 上下文 from internet 使用out using externl APIs. This skill teches effective use of RAG-bsed web 搜索 使用 DuckDuckGo, Google, 和 multi-engine deep re搜索 cpbilities.。
---

# Local RAG Search Skill


## 中文说明

### 简介

local-rag-search - Efficiently perform web searches using the mcp-local-rag server with semantic similarity ranking. Use this skill when you need to search the web for current information, research topics across multiple sources, or gather context from the internet without using external APIs. This skill teaches effective use of RAG-based web search with DuckDuckGo, Google, and multi-engine deep research capabilities.

### 使用方法

此 Skill 已安装到 `/home/node/.openclaw/workspace/skills/local-rag-search/`

1. 查看 SKILL.md 了解详细用法
2. 如有 scripts/run.sh，可直接运行
3. 参照 Examples 章节中的命令进行操作

### 适用场景

- 请参考 ## When to Use 章节
- 如有疑问，请查看 ## Troubleshooting 章节

### 快速开始

```bash
# 查看帮助
cd /home/node/.openclaw/workspace/skills/local-rag-search
cat SKILL.md

# 运行（如有脚本）
./scripts/run.sh
```

### 注意事项

- 请确保已安装所需依赖
- 建议先阅读 ## Setup 或 ## Installation 章节
- 详细配置说明见 ## Configuration 章节

This skill enables you to effectively use the mcp-local-rag MCP server for intelligent web searches with semantic ranking. The server performs RAG-like similarity scoring to prioritize the most relevant results without requiring any external APIs.

## Available Tools

### 1. `rag_search_ddgs` - DuckDuckGo Search
Use this for privacy-focused, general web searches.

**When to use:**
- User prefers privacy-focused searches
- General information lookup
- Default choice for most queries

**Parameters:**
- `query`: Natural language search query
- `num_results`: Initial results to fetch (default: 10)
- `top_k`: Most relevant results to return (default: 5)
- `include_urls`: Include source URLs (default: true)

### 2. `rag_search_google` - Google Search
Use this for comprehensive, technical, or detailed searches.

**When to use:**
- Technical or scientific queries
- Need comprehensive coverage
- Searching for specific documentation

### 3. `deep_research` - Multi-Engine Deep Research
Use this for comprehensive research across multiple search engines.

**When to use:**
- Researching complex topics requiring broad coverage
- Need diverse perspectives from multiple sources
- Gathering comprehensive information on a subject

**Available backends:**
- `duckduckgo`: Privacy-focused general search
- `google`: Comprehensive technical results
- `bing`: Microsoft's search engine
- `brave`: Privacy-first search
- `wikipedia`: Encyclopedia/factual content
- `yahoo`, `yandex`, `mojeek`, `grokipedia`: Alternative engines

**Default:** `["duckduckgo", "google"]`

### 4. `deep_research_google` - Google-Only Deep Research
Shortcut for deep research using only Google.

### 5. `deep_research_ddgs` - DuckDuckGo-Only Deep Research
Shortcut for deep research using only DuckDuckGo.

## Best Practices

### Query Formulation
1. **Use natural language**: Write queries as questions or descriptive phrases
   - Good: "latest developments in quantum computing"
   - Good: "how to implement binary search in Python"
   - Avoid: Single keywords like "quantum" or "Python"

2. **Be specific**: Include context and details
   - Good: "React hooks best practices for 2024"
   - Better: "React useEffect cleanup function best practices"

### Tool Selection Strategy

1. **Single Topic, Quick Answer** → Use `rag_search_ddgs` or `rag_search_google`
   ```
   rag_search_ddgs(
       query="What is the capital of France?",
       top_k=3
   )
   ```

2. **Technical/Scientific Query** → Use `rag_search_google`
   ```
   rag_search_google(
       query="Docker multi-stage build optimization techniques",
       num_results=15,
       top_k=7
   )
   ```

3. **Comprehensive Research** → Use `deep_research` with multiple search terms
   ```
   deep_research(
       search_terms=[
           "machine learning fundamentals",
           "neural networks architecture",
           "deep learning best practices 2024"
       ],
       backends=["google", "duckduckgo"],
       top_k_per_term=5
   )
   ```

4. **Factual/Encyclopedia Content** → Use `deep_research` with Wikipedia
   ```
   deep_research(
       search_terms=["World War II timeline", "WWII key battles"],
       backends=["wikipedia"],
       num_results_per_term=5
   )
   ```

### Parameter Tuning

**For quick answers:**
- `num_results=5-10`, `top_k=3-5`

**For comprehensive research:**
- `num_results=15-20`, `top_k=7-10`

**For deep research:**
- `num_results_per_term=10-15`, `top_k_per_term=3-5`
- Use 2-5 related search terms
- Use 1-3 backends (more = more comprehensive but slower)

## Workflow Examples

### Example 1: Current Events
```
Task: "What happened at the UN climate summit last week?"

1. Use rag_search_google for recent news coverage
2. Set top_k=7 for comprehensive view
3. Present findings with source URLs
```

### Example 2: Technical Deep Dive
```
Task: "How do I optimize PostgreSQL queries?"

1. Use deep_research with multiple specific terms:
   - "PostgreSQL query optimization techniques"
   - "PostgreSQL index best practices"
   - "PostgreSQL EXPLAIN ANALYZE tutorial"
2. Use backends=["google", "stackoverflow"] if available
3. Synthesize findings into actionable guide
```

### Example 3: Multi-Perspective Research
```
Task: "Research the impact of remote work on productivity"

1. Use deep_research with diverse search terms:
   - "remote work productivity statistics 2024"
   - "hybrid work model effectiveness studies"
   - "work from home challenges research"
2. Use backends=["google", "duckduckgo"] for broad coverage
3. Synthesize different perspectives and studies
```

## Guidelines

1. **Always cite sources**: When `include_urls=True`, reference the source URLs in your response
2. **Verify recency**: Check if the content appears current and relevant
3. **Cross-reference**: For important facts, use multiple search terms or engines
4. **Respect privacy**: Use DuckDuckGo for general queries unless specific needs require Google
5. **Batch related queries**: When researching a topic, create multiple related search terms for deep_research
6. **Semantic relevance**: Trust the RAG scoring - top results are semantically closest to the query
7. **Explain your choice**: Briefly mention which tool you're using and why

## Error Handling

If a search returns insufficient results:
1. Try rephrasing the query with different keywords
2. Switch to a different backend
3. Increase `num_results` parameter
4. Use `deep_research` with multiple related search terms

## Privacy Considerations

- DuckDuckGo: Privacy-focused, doesn't track users
- Google: Most comprehensive but tracks searches
- Recommend DuckDuckGo as default unless user specifically needs Google's coverage

## Performance Notes

- First search may be slower (model loading)
- Subsequent searches are faster (cached models)
- More backends = more comprehensive but slower
- Adjust `num_results` and `top_k` based on use case

## Examples

```bash
# Example usage
skill --help
```


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


## Use Cases

- Use Case 1: Common scenario description
- Use Case 2: Another typical usage pattern
- Use Case 3: Advanced or specialized usage


## Limitations

- May require specific environment configuration
- Performance may vary based on input size
- Some features require optional dependencies


## Getting Started

1. Install the skill
2. Configure settings
3. Run your first command
4. Explore advanced features

For more details, see the Examples section above.

## Detailed Examples

### Example 1

```bash
# Basic usage
skill --help

# Run with input
skill run --input "data"

# Advanced usage
skill run --input "data" --output "result" --verbose
```

### Example 2

```bash
# Batch processing
skill batch --files "*.txt"

# With options
skill batch --files "*.txt" --output-dir ./results
```

## Performance Tips

### Optimization

- Enable caching for better performance
- Use batch processing for multiple operations
- Monitor resource usage with verbose mode

### Best Practices

- Profile before optimizing
- Use appropriate data structures
- Consider lazy loading for large resources

## Module Structure

### Core Modules

```python
# Main module
class Core:
    def __init__(self):
        pass

# Processing module  
class Processor:
    def process(self, data):
        return data
```

### Helper Modules

```python
# Utility functions
def helper_function(data):
    return processed_data
```

### Performance Optimization

- Use caching for repeated lookups
- Implement connection pooling for database operations
- Optimize memory usage with streaming where possible
- Consider lazy loading for better initial load times

## Modules

### Main Module

```python
class Skill:
    def __init__(self, config):
        self.config = config
        
    def run(self, input_data):
        '''Execute skill with input'''
        return self.process(input_data)
```

### Data Module

```python
class DataHandler:
    def load(self, path):
        '''Load data from file'''
        pass
        
    def save(self, data, path):
        '''Save data to file'''
        pass
```


## Overview

This skill provides comprehensive functionality for task automation, intelligent processing, and system integration. It offers advanced capabilities that enable efficient workflow execution with optimized performance and reliability.

## When to Use

- Complex task requiring intelligent automation
- Need for seamless system integration
- Performance-critical applications
- Scenarios requiring advanced resource management
- Multi-step workflows with decision points

## Examples

### Quick Start

```bash
# Initialize the skill
./scripts/run.sh init

# Run with default settings
./scripts/run.sh start

# Check status
./scripts/run.sh status
```

### Advanced Configuration

```bash
# With custom config
./scripts/run.sh --config advanced.yaml

# Parallel mode
./scripts/run.sh --parallel --workers 8

# Verbose output
./scripts/run.sh --verbose --debug
```

## Setup

### Requirements

- Python 3.8+
- 512MB RAM minimum
- Network access for API calls

### Installation

```bash
pip install -r requirements.txt
chmod +x ./scripts/run.sh
```

### Configuration

```yaml
skill:
  name: advanced-skill
  version: 1.0.0
  enabled: true

execution:
  timeout: 300
  retry: 3
  parallel: true

performance:
  cache: true
  cache_ttl: 3600
  workers: 4
```

## Getting Started

1. Install dependencies: `pip install -r requirements.txt`
2. Configure: Edit `config.yaml` with your settings
3. Test: Run `./scripts/run.sh test`
4. Deploy: Run `./scripts/run.sh start`

## Performance Tips

- Enable caching for repeated operations
- Use parallel execution for independent tasks
- Monitor memory usage for large datasets
- Configure appropriate timeout values

## Troubleshooting

If you encounter issues:
1. Check logs: `./scripts/run.sh logs`
2. Verify config: `./scripts/run.sh validate`
3. Reset: `./scripts/run.sh reset`
4. Contact support if persists

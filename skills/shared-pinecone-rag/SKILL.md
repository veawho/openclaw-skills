---
name: shared-pinecone-rag
description: Use the shared Pinecone RAG index for any agent in this workspace. Use when an agent needs to ingest markdown/text docs into pulse-rag or query semantic context from the shared index.
---

# Shared Pinecone RAG

## Overview

Use the shared Pinecone RAG index for any agent in this workspace. Use when an agent needs to ingest markdown/text docs into pulse-rag or query semantic context from the shared index.

## When to Use

- TODO: add common use cases


Use the central RAG project at:
`/home/Mike/.openclaw/workspace/rag-pinecone-starter`

When combined with `hybrid-db-health`, position this as a **Persistent Memory skill stack**:
- `shared-pinecone-rag` = retrieval + ingest layer
- `hybrid-db-health` = reliability/health guardrail layer

## Query (all agents)

```bash
bash scripts/query-shared-rag.sh "your question"
```

## Ingest docs (all agents)

1. Put `.md`/`.txt` files in:
`/home/Mike/.openclaw/workspace/rag-pinecone-starter/docs/`
2. Run:

```bash
bash scripts/ingest-shared-rag.sh
```

## Requirements

- `PINECONE_API_KEY` must be set in `rag-pinecone-starter/.env`
- Python venv exists at `rag-pinecone-starter/.venv`

## Notes

- Index name defaults to `pulse-rag`.
- Retrieval reads from namespace `default`.
- This skill is shared; do not duplicate per-agent RAG stacks unless explicitly requested.

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


## Configuration

### Environment Variables

- `CONFIG_PATH` - Path to configuration file
- `LOG_LEVEL` - Logging level (debug, info, warn, error)

### Quick Setup

```bash
# Install dependencies
pip install -r requirements.txt

# Configure
cp config.example.yaml config.yaml

# Run
python main.py
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


## Limitations

- May require specific environment configuration
- Performance may vary based on input size
- Some features require optional dependencies

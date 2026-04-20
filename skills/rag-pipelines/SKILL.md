---
name: rag-pipelines
description: Deep RAG workflow—document ingestion, chunking, metadata, retrieval and reranking, grounding and citations, evaluation, and failure modes (hallucination, staleness). Use when building or debugging retrieval-augmented generation systems.
---

# RAG Pipelines (Deep Workflow)

## Overview

Deep RAG workflow—document ingestion, chunking, metadata, retrieval and reranking, grounding and citations, evaluation, and failure modes.


```python
# RAG pipeline example
from rag_lib import Pipeline

pipeline = Pipeline()
pipeline.ingest(documents)
result = pipeline.query(question)
```



## When to Use

- Building Q&A over internal docs
- Support assistants or copilots
- Hallucinations, wrong citations, or stale answers
- New content types (PDF, HTML, code repositories)

RAG quality is dominated by **chunking**, **retrieval**, and **evaluation**—not the LLM alone. Treat the system as data engineering plus generation with explicit failure modes.

## When to Offer This Workflow

**Trigger conditions:**

- Building Q&A over internal docs, support assistants, or copilots
- Hallucinations, wrong citations, or stale answers
- New content types (PDF, HTML, code repositories)

**Initial offer:**

Use **six stages**: (1) task & success criteria, (2) ingestion & cleaning, (3) chunking & metadata, (4) retrieval & rerank, (5) generation & grounding, (6) evaluation & monitoring). Confirm embedding model and retrieval stack (vector DB, search engine, hybrid).

---

## Stage 1: Task & Success Criteria

**Goal:** Define what a “good” answer contains: required citations, length, tone, and when to refuse.

**Exit condition:** Written rubric with examples of acceptable vs unacceptable answers.

---

## Stage 2: Ingestion & Cleaning

**Goal:** Deterministic text extraction (strip boilerplate, handle PDF/OCR if needed); deduplicate documents; track source URL and `updated_at` for staleness.

### Practices

- Version pipelines when parsers change (re-embed job)

---

## Stage 3: Chunking & Metadata

**Goal:** Tune chunk size and overlap to query patterns—not one global token count for all content.

### Practices

- Attach metadata for ACL filtering (tenant, product area)
- Prefer structure-aware splits for docs (headings, sections)

---

## Stage 4: Retrieval & Rerank

**Goal:** Hybrid lexical + dense retrieval often beats vector-only for keyword-heavy queries.

### Practices

- Cross-encoder reranking on top-k for quality (watch latency)
- Query rewriting for multi-turn contexts

---

## Stage 5: Generation & Grounding

**Goal:** System prompts that require using only provided context; explicit “not found” behavior; optional citation format (snippet, doc id, link).

---

## Stage 6: Evaluation & Monitoring

**Goal:** Offline golden questions with expected supporting docs; online thumbs-down reasons; monitor retrieval hit rate, nDCG@k, and age of sources used.

---

## Final Review Checklist

- [ ] Rubric and refusal behavior defined
- [ ] Ingestion deterministic; dedupe and versioning
- [ ] Chunking and metadata match queries and ACLs
- [ ] Hybrid retrieval and rerank tuned with metrics
- [ ] Grounding and citation behavior enforced in prompts
- [ ] Offline eval plus production monitoring

## Tips for Effective Guidance

- Debug retrieval before blaming the LLM.
- Long chunks hurt precision; short chunks hurt context—sweep experiments.
- See also **vector-databases** and **llm-evaluation** skills for depth.

## Handling Deviations

- **Code RAG:** symbol- or AST-aware chunking often beats line-based splits.
- **High-stakes domains:** add human review gates and audit logs for sources cited.

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

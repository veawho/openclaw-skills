---
name: memory-lancedb-hybrid
description: LanceDB long-term memory plugin with BM25 + vector hybrid search (RRF or linear reranking).
description_zh: LnceDB long-term mem或y 插件 使用 BM25 + vect或 hybrid 搜索 （RRF 或 liner rernking）.。
---

# LanceDB Hybrid Search (Memory Plugin)


## 中文说明

### 简介

memory-lancedb-hybrid - LanceDB long-term memory plugin with BM25 + vector hybrid search (RRF or linear reranking).

### 使用方法

此 Skill 已安装到 `/home/node/.openclaw/workspace/skills/memory-lancedb-hybrid/`

1. 查看 SKILL.md 了解详细用法
2. 如有 scripts/run.sh，可直接运行
3. 参照 Examples 章节中的命令进行操作

### 适用场景

- 请参考 ## When to Use 章节
- 如有疑问，请查看 ## Troubleshooting 章节

### 快速开始

```bash
# 查看帮助
cd /home/node/.openclaw/workspace/skills/memory-lancedb-hybrid
cat SKILL.md

# 运行（如有脚本）
./scripts/run.sh
```

### 注意事项

- 请确保已安装所需依赖
- 建议先阅读 ## Setup 或 ## Installation 章节
- 详细配置说明见 ## Configuration 章节

## Overview

LanceDB long-term memory plugin with BM25 + vector hybrid search (RRF or linear reranking).

## When to Use

- TODO: add common use cases


This skill packages a **drop-in OpenClaw memory plugin** that adds **hybrid search** to LanceDB memory:

- **Vector search** (semantic)
- **BM25 full-text search** (exact terms)
- Configurable reranking:
  - `rrf` (Reciprocal Rank Fusion, recommended)
  - `linear` (weighted combination)

It is based on (and credits) OpenClaw PR **openclaw/openclaw#7636**.

## What you get

A local plugin (extension) located at:

- `plugin/` → **overrides the built-in plugin id** `memory-lancedb` (adds hybrid search)

Once enabled, it provides the same tools as the bundled LanceDB memory plugin:

- `memory_store`
- `memory_recall`
- `memory_forget`

…but `memory_recall`/auto-recall/forget now use hybrid search when enabled.

## Install / Enable

1) Ensure the skill folder exists (ClawHub install puts it under your workspace):

- `~/.openclaw/workspace/skills/memory-lancedb-hybrid/plugin`

2) Install the plugin dependencies (once):

```bash
cd ~/.openclaw/workspace/skills/memory-lancedb-hybrid/plugin
npm install --omit=dev
```

3) Add the plugin to OpenClaw’s plugin load paths.

This plugin keeps the id `memory-lancedb`, so it will **override** the bundled `memory-lancedb` extension when discovered via `plugins.load.paths` (higher precedence than bundled).

Edit `~/.openclaw/openclaw.json`:

```json5
{
  plugins: {
    load: {
      // Point at the plugin directory inside this skill
      paths: ["~/.openclaw/workspace/skills/memory-lancedb-hybrid/plugin"]
    },

    // Ensure the memory slot points at LanceDB memory
    slots: {
      memory: "memory-lancedb"
    },

    // Configure LanceDB memory (this override adds the `hybrid` config block)
    entries: {
      "memory-lancedb": {
        enabled: true,
        config: {
          embedding: {
            apiKey: "${OPENAI_API_KEY}",
            model: "text-embedding-3-small"
          },

          // Optional
          dbPath: "~/.openclaw/memory/lancedb",

          // Optional
          autoCapture: true,
          autoRecall: true,

          // Hybrid search options
          hybrid: {
            enabled: true,
            reranker: "rrf"

            // If using reranker: "linear", you can also set:
            // vectorWeight: 0.7,
            // textWeight: 0.3,
          }
        }
      }
    }
  }
}
```

4) Restart the Gateway.

Hybrid search needs an FTS index on the `text` column; the plugin will attempt to create it automatically. If FTS setup fails for any reason, the plugin logs a debug message and falls back to vector-only search.

## Config reference

All config lives under `plugins.entries.memory-lancedb.config`.

- `hybrid.enabled` (boolean, default `true`)
- `hybrid.reranker` (`rrf` | `linear`, default `rrf`)
- `hybrid.vectorWeight` (number 0–1, default `0.7`, only used for `linear`)
- `hybrid.textWeight` (number 0–1, default `0.3`, only used for `linear`)

## Notes / troubleshooting

- This plugin does not modify OpenClaw’s install on disk; it **overrides** the bundled `memory-lancedb` at runtime (remove `plugins.load.paths` to revert).
- If you already have LanceDB memory data on disk, you can keep using the same `dbPath`.
- If you see no hybrid effect, make sure `hybrid.enabled` is true and that the FTS index was created (check Gateway logs).

## Files

- `plugin/index.ts` – plugin implementation (hybrid search)
- `plugin/config.ts` – config parsing + UI hints
- `plugin/openclaw.plugin.json` – manifest + JSON Schema (used for strict config validation)

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


## Limitations

- May require specific environment configuration
- Performance may vary based on input size
- Some features require optional dependencies

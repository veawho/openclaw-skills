---
name: knowledge-graph
description: "Embedded knowledge graph for persistent structured knowledge. ALWAYS use proactively — do NOT wait for user to ask. Auto-triggers on: (1) any mention of people, projects, devices, services, organizations, or infrastructure — search KG first, add if new, (2) decisions or architectural choices worth remembering, (3) credentials or API keys (store in vault), (4) relationships between entities (who owns what, what runs where, what depends on what), (5) recurring concepts, principles, or lessons learned, (6) preferences and opinions (likes, dislikes, reviews), (7) places and locations (where someone lives, travels, frequents), (8) life events and milestones (birthdays, trips, meetings), (9) habits and routines (daily patterns, recurring behaviors), (10) knowledge artifacts — research papers, articles, insights, ideas, interesting facts shared by the user, (11) know-how and procedures — how to do something, debugging approaches, workflows, mental models, problem-solving frameworks. Also use when recalling facts, answering questions about known entities, or needing structured context. Run install script on first use. NOT for: ephemeral daily notes (use memory/), transient conversation, or rapidly changing data."
description_zh: "Embedded 知识图谱 用于 持久化 structured knowledge. ALWAYS use proctively — do NOT wit 用于 user to sk. Auto-triggers on: （1） ny mention of people, projects, devices, services, 或gniztions, 或 infrstructure — 搜索 KG first, dd if new, （2） decisions 或 rchitecturl choices w或th remembering, （3） credentils 或 API keys （st或e in vult）, （4） reltionships between entities （who owns wht, wht 运行s where, wht depends on wht）, （5） recurring concepts, principles, 或 lessons lerned, （6） preferences 和 opinions （likes, dislikes, reviews）, （7） plces 和 loctions （where someone lives, trvels, frequents）, （8） life events 和 milestones （birthdys, trips, meetings）, （9） hbits 和 routines （dily ptterns, recurring behvi或s）, （10） knowledge rtifcts — re搜索 ppers, rticles, insights, ides, interesting fcts shred by user, （11） know-how 和 procedures — how to do something, 调试 pproches, 工作流s, mentl models, problem-solving frmew或ks. Also use when reclling fcts, nswering questions bout known entities, 或 needing structured 上下文. Run instll script on first use. NOT 用于: ephemerl dily notes （use mem或y/）, trnsient 对话, 或 rpidly chnging dt."。
---

# Knowledge Graph Skill


## 中文说明

### 简介

knowledge-graph - "Embedded knowledge graph for persistent structured knowledge. ALWAYS use proactively — do NOT wait for user to ask. Auto-triggers on: (1) any mention of people, projects, devices, services, organizations, or infrastructure — search KG first, add if new, (2) decisions or architectural choices worth remembering, (3) credentials or API keys (store in vault), (4) relationships between entities (who owns what, what runs where, what depends on what), (5) recurring concepts, principles, or lessons learned, (6) preferences and opinions (likes, dislikes, reviews), (7) places and locations (where someone lives, travels, frequents), (8) life events and milestones (birthdays, trips, meetings), (9) habits and routines (daily patterns, recurring behaviors), (10) knowledge artifacts — research papers, articles, insights, ideas, interesting facts shared by the user, (11) know-how and procedures — how to do something, debugging approaches, workflows, mental models, problem-solving frameworks. Also use when recalling facts, answering questions about known entities, or needing structured context. Run install script on first use. NOT for: ephemeral daily notes (use memory/), transient conversation, or rapidly changing data."

### 使用方法

此 Skill 已安装到 `/home/node/.openclaw/workspace/skills/knowledge-graph-skill/`

1. 查看 SKILL.md 了解详细用法
2. 如有 scripts/run.sh，可直接运行
3. 参照 Examples 章节中的命令进行操作

### 适用场景

- 请参考 ## When to Use 章节
- 如有疑问，请查看 ## Troubleshooting 章节

### 快速开始

```bash
# 查看帮助
cd /home/node/.openclaw/workspace/skills/knowledge-graph-skill
cat SKILL.md

# 运行（如有脚本）
./scripts/run.sh
```

### 注意事项

- 请确保已安装所需依赖
- 建议先阅读 ## Setup 或 ## Installation 章节
- 详细配置说明见 ## Configuration 章节

## Overview

Embedded knowledge graph for persistent structured knowledge. ALWAYS use proactively — do NOT wait for user to ask. Auto-triggers on: (1) any mention of people, projects, devices, services, organizations, or infrastructure — search KG first, add if new, (2) decisions or architectural choices worth remembering, (3) credentials or API keys (store in vault), (4) relationships between entities (who owns what, what runs where, what depends on what), (5) recurring concepts, principles, or lessons learned, (6) preferences and opinions (likes, dislikes, reviews), (7) places and locations (where someone lives, travels, frequents), (8) life events and milestones (birthdays, trips, meetings), (9) habits and routines (daily patterns, recurring behaviors), (10) knowledge artifacts — research papers, articles, insights, ideas, interesting facts shared by the user, (11) know-how and procedures — how to do something, debugging approaches, workflows, mental models, problem-solving frameworks. Also use when recalling facts, answering questions about known entities, or needing structured context. Run install script on first use. NOT for: ephemeral daily notes (use memory/), transient conversation, or rapidly changing data.

## When to Use

- TODO: add common use cases


Personal KG stored as JSON, queried via CLI scripts. Produces a compact KGML summary for session context.
Core instructions are in AGENTS.md (auto-injected by install). This file covers setup, advanced usage, and reference only.

## First-Time Setup

```bash
node scripts/install.mjs [--workspace /path/to/workspace] [--platform openclaw|claude|gemini]
```
Auto-detects platform and patches the agent instructions file (`AGENTS.md`, `CLAUDE.md`, or `GEMINI.md`) with KG instructions + graph summary. Idempotent.

## KGML Format Reference

```
#KGML v2 | <count>e <count>r | depth:<N> | <date>
[category]
Label(Alias):type — attr1,attr2
  ChildLabel(CA):type — attrs    ← indent = parent>child
%rels
A>verb>B C>verb>D                ← cross-branch relations (aliases)
%vault key1,key2                 ← vault key names (no values)
```

## Advanced Query Commands

Beyond the basics in AGENTS.md (`find`, `traverse`, `rels`):
```bash
node scripts/query.mjs children <id>      # Direct children
node scripts/query.mjs type <type>         # All entities of a type
node scripts/query.mjs cat <category>      # All in category
node scripts/query.mjs orphans             # Unlinked entities
node scripts/query.mjs stats               # Graph statistics
node scripts/query.mjs recent [--days 7]   # Created/updated recently
node scripts/query.mjs timeline [--from YYYY-MM-DD] [--to YYYY-MM-DD]
node scripts/query.mjs changed             # Modified after creation
node scripts/query.mjs uncertain           # Confidence < 0.5
```

## Merge

```bash
node scripts/merge.mjs --target <id> --source <id> --mode absorb|nest
```

## Vault (secrets)

```bash
node scripts/vault.mjs set <key> <value> --note "description"
node scripts/vault.mjs get <key>          # Raw value (for piping)
node scripts/vault.mjs list               # Keys only
node scripts/vault.mjs del <key>
```

## Depth Heuristic — How Many Layers to Extract

Before adding a rich knowledge item (article, paper, report, system description), assess complexity first:

```bash
# Score text content and get recommended depth + checklist:
node scripts/depth-check.mjs "paste text or summary here"
echo "article text" | node scripts/depth-check.mjs
node scripts/depth-check.mjs --file /path/to/article.txt
node scripts/depth-check.mjs --json    # machine-readable

# Score interpretation:
# 0-1 → 1 layer (root only)
# 2-3 → 2 layers (root + concepts)
# 4-5 → 3 layers (root → domains → mechanisms)
# 6-7 → 4+ layers (full extraction with orgs/events/policies + cross-relations)
```

**Key rule:** Never stop at 2 layers for complex content. If score ≥ 4, extract all named orgs, events, policies, and cross-relations — not just the top-level themes.

## Visualization

```bash
node scripts/visualize.mjs                # → data/kg-viz.html
node scripts/visualize.mjs --output /tmp/graph.html
```
ALWAYS use this script. Do NOT write custom HTML. Output is self-contained, offline, no CDN.

Parent edges render as **blue dashed arrows** (60% opacity). Regular edges are red solid arrows.

## Configuration

All settings have sensible defaults. Override only what you need — config stores only your changes.

```bash
node scripts/config.mjs                       # list all settings with current values
node scripts/config.mjs get <key>              # get a value (e.g. summary.tokenBudget)
node scripts/config.mjs set <key> <value>      # set a value
node scripts/config.mjs reset <key>            # reset single key to default
node scripts/config.mjs reset --all            # reset everything
node scripts/config.mjs --json                 # full config as JSON
```

### Available Settings

| Section | Key | Default | Description |
|---------|-----|---------|-------------|
| **summary** | `tokenBudget` | 5000 | Max tokens for kg-summary.md |
| | `maxChildDepth` | auto | Tree depth (null=auto: 3/<100, 2/100-400, 1/>400) |
| | `maxAttrLen` | 40 | Max characters for attribute values |
| | `maxPerRoot` | 4 | Max relations shown per root subtree |
| | `compactThreshold` | 400 | Entity count for compact mode |
| | `mediumThreshold` | 200 | Entity count for medium depth |
| **validation** | `minEntities` | 30 | Min entities for extraction PASS |
| | `minRelationRatio` | 0.5 | Relations per entity ratio |
| | `minDepth` | 3 | Min hierarchy depth for PASS |
| | `minEvents` | 3 | Min event nodes for PASS |
| **depthCheck** | `entityCapForEstimate` | 50 | Cap NER count for target estimation |
| | `minEntitiesMultiplier` | 1.0 | Named entities → min target multiplier |
| | `extraEntities` | 30 | Added to min for max entity range |
| **consolidation** | `autoNest` | true | Auto-nest single-relation orphans |
| | `mergeSuggestions` | true | Suggest merges for similar labels |
| | `pruneEmptyAttrs` | true | Remove empty/null attrs |
| | `levenshteinThreshold` | 2 | Max edit distance for merge suggestions |
| **visualization** | `repulsion` | 5000 | Physics repulsion force |
| | `edgeRestLength` | 160 | Default edge rest length |
| | `overlapPenalty` | 3 | Overlap repulsion multiplier |
| | `simulationSteps` | 500 | Physics simulation iterations |
| | `initialSpread` | 1.5 | Initial node spread multiplier |
| | `zoomAnimationMs` | 400 | Zoom-to-node animation duration |

Config file: `data/kg-config.json` (per-agent, gitignored).

## Cross-Agent Access (read-only)

```javascript
import { createReader } from '<path-to-skill>/lib/reader.mjs';
const kg = createReader();
kg.search("query"); kg.traverse("id", { depth: 2 }); kg.stats();
```
Or CLI: `node scripts/export.mjs --format json --target /path/to/output.json`

## Memory Import

```bash
node scripts/import-memory.mjs            # dry-run
node scripts/import-memory.mjs --apply    # add with confidence 0.5
```
Then: `node scripts/query.mjs uncertain` to review auto-imported entities.

## Knowledge Entity Guide

The `knowledge` type covers both declarative and procedural knowledge. Use attrs and tags to differentiate:

| Kind | Tags | Key attrs | Example |
|------|------|-----------|---------|
| Fact/finding | `#fact`, `#til` | `source`, `field`, `summary` | "LLMs use ~4 chars per token" |
| Research/paper | `#paper`, `#research` | `source`, `field`, `summary`, `author` | AI alignment paper findings |
| Idea | `#idea` | `summary`, `status` | "Build a CLI for KG queries" |
| How-to/procedure | `#howto`, `#procedure` | `steps`, `context`, `summary` | "How to deploy on Pi" |
| Mental model | `#mental-model`, `#framework` | `steps`, `context`, `summary` | "Debug network: ping→DNS→firewall" |
| Workflow | `#workflow` | `steps`, `context`, `summary` | "Code review: tests first, then impl" |

**Attrs for procedural knowledge:**
- `steps`: ordered procedure as string (use `→` or numbered: `"1. Check logs → 2. Reproduce → 3. Fix → 4. Test"`)
- `context`: when/where to apply this knowledge (e.g. `"when network is down"`, `"during code review"`)
- `summary`: short description of what this knowledge is about

## Consolidation

Run `node scripts/consolidate.mjs` weekly or when entity count > 80. Then `summarize.mjs`.

## Security

- NEVER print vault values in chat or log to memory/ files
- vault.enc.json and .vault-key must never be in context
- Other agents: read-only via reader.mjs, NO write access

## Examples

```bash
# Example usage
skill --help
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

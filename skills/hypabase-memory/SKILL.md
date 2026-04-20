---
name: hypabase-memory
description: Persistent memory for agents. Stores preferences, decisions, facts, and events as a connected knowledge graph.
description_zh: Persistent mem或y 用于 智能体s. St或es preferences, decisions, fcts, 和 events s connected 知识图谱.。
metadata:
  clawdbot:
    emoji: "🧠"
    requires:
      env: []
      bins: ["uvx"]
    primaryEnv: "HYPABASE_DB_PATH"
    files: []
---

# Hypabase Memory


## 中文说明

### 简介

hypabase-memory - Persistent memory for agents. Stores preferences, decisions, facts, and events as a connected knowledge graph.

### 使用方法

此 Skill 已安装到 `/home/node/.openclaw/workspace/skills/hypabase-memory/`

1. 查看 SKILL.md 了解详细用法
2. 如有 scripts/run.sh，可直接运行
3. 参照 Examples 章节中的命令进行操作

### 适用场景

- 请参考 ## When to Use 章节
- 如有疑问，请查看 ## Troubleshooting 章节

### 快速开始

```bash
# 查看帮助
cd /home/node/.openclaw/workspace/skills/hypabase-memory
cat SKILL.md

# 运行（如有脚本）
./scripts/run.sh
```

### 注意事项

- 请确保已安装所需依赖
- 建议先阅读 ## Setup 或 ## Installation 章节
- 详细配置说明见 ## Configuration 章节

Persistent memory for agents. Stores preferences, decisions, facts, and events as a connected knowledge graph. Recalled by who, what, when, or why.

## Setup

Add the MCP server to your OpenClaw config (`~/.openclaw/openclaw.json`):

```json
{
  "mcpServers": {
    "hypabase-memory": {
      "command": "uvx",
      "args": ["--from", "hypabase", "hypabase-memory"],
      "env": { "HYPABASE_DB_PATH": "hypabase.db" }
    }
  }
}
```

`uvx` handles all Python dependencies automatically. Requires [uv](https://docs.astral.sh/uv/).

## Quick start

Store a memory — one verb, roles for the participants:

```
remember(penman='(prefers :subject Alice :object Python :memory_type semantic)')
```

Recall it:

```
recall(entity="Alice")                              # everything about Alice
recall(entity="Alice", action="assign", role="subject")  # what Alice assigned
recall(entity=["Alice", "Bob"])                     # memories involving both
recall(mood="planned")                              # all plans
```

## When to Remember

Store a memory when the user:
- Makes a decision or states a preference
- Shares a fact about themselves, their team, or a project
- Assigns a task or delegates work
- Describes an event, meeting, or outcome
- Explains a procedure or workflow

## PENMAN Notation

Every memory is a verb with participants in role slots:

```
(verb :role "entity" :role "entity" ...)
```

Examples:

```
(prefers :subject Alice :object Python :memory_type semantic)

(assigned :subject Alice :object "billing task" :recipient Bob
 :instrument Jira :locus Monday :tense past :memory_type episodic)

(has :subject "quick sort" :attribute "time complexity"
 :value "O(n log n)" :memory_type semantic)
```

Multiple atoms in a single call:

```
(deployed :subject Alice :object API :locus Monday :tense past)
(reviewed :subject Bob :object API :locus Tuesday :tense past)
```

**One action per memory.** When a sentence contains multiple actions, decompose into separate atoms. Shared entities link them in the graph.

"Alice told Bob to migrate the database":

```
(told :subject Alice :recipient Bob :object "database migration" :tense past)
(migrate :subject Bob :object database :mood planned)
```

Any role slot can hold a nested atom:

```
(believes :subject Alice :object (is :subject deadline :value Friday))
```

## Entity Naming

Same string after lowercasing = same entity. Different strings = different entities until `consolidate()` merges them.

- Pick one canonical name per entity and reuse it.
- Use full descriptive names: "machine learning" not "ML", "JavaScript" not "JS".
- Call `consolidate()` periodically to merge similar names via semantic similarity.

## Tools

### remember(penman, source?, confidence?)

Store memories as PENMAN atoms.

- `penman` (required): One or more PENMAN atoms.
- `source` (optional): Provenance source. Default: `"memory"`.
- `confidence` (optional): 0.0–1.0. Default: `1.0`.

### recall(entity?, action?, role?, memory_type?, mood?, negated?, since?, before?, limit?, min_strength?)

Query memories. At least one parameter required.

- `entity`: Name or list of names.
- `action`: Filter by verb.
- `role`: Filter by role (`subject`/`object`/`instrument`/`recipient`/`source`/`locus`/`attribute`/`value`).
- `memory_type`: `episodic` / `semantic` / `procedural`.
- `mood`: `actual` / `planned` / `uncertain` / `normative` / `conditional`.
- `negated`: `true` = only negated, `false` = only positive.
- `since` / `before`: ISO date strings.
- `limit`: Max results (default: 10).
- `min_strength`: Minimum memory strength threshold.

### consolidate(entity?)

Merge similar entities and compress repeated memories.

### forget(older_than_days?, min_strength?, entity?)

Expire old or low-strength memories (soft delete).

## Reference

### Roles

Eight roles. Fill in what applies, skip what doesn't.

| PENMAN role | Recall role | Meaning | Example |
|-------------|-------------|---------|---------|
| `:subject` | `subject` | Who or what it's about | Alice |
| `:object` | `object` | What is acted on | the proposal |
| `:instrument` | `instrument` | Tool, method, or means | Slack |
| `:recipient` | `recipient` | Who receives or benefits | Bob |
| `:origin` | `source` | Where it came from | the old system |
| `:locus` | `locus` | Where, when, or context | sprint review |
| `:attribute` | `attribute` | A named property | time complexity |
| `:value` | `value` | The specific value | O(n log n) |

### Memory types

| Type | Use for | Decay rate |
|------|---------|------------|
| `episodic` | Events, meetings, conversations | Fast |
| `semantic` | Facts, preferences, definitions | Slow |
| `procedural` | How-to, workflows, processes | Slowest |

### Moods

| Mood | When to use |
|------|-------------|
| `actual` | Something that happened or is true (default) |
| `planned` | Something intended to happen |
| `uncertain` | Something that might be true |
| `normative` | Something that should or shouldn't be |
| `conditional` | Something that depends on a condition |

### Modifiers

| Modifier | Values | Default |
|----------|--------|---------|
| `:tense` | `past`, `present`, `future` | -- |
| `:negated` | `true`, `false` | `false` |
| `:importance` | `0.0` to `1.0` | -- |
| `:cause` | Nested atom: why it happened | -- |
| `:purpose` | Nested atom: what for | -- |
| `:condition` | Nested atom: if/when/unless | -- |

### Environment variables

- `HYPABASE_DB_PATH` -- SQLite database path (default: `hypabase.db`)
- `HYPABASE_EMBEDDER` -- Embedder for semantic search:
  - `fastembed` (default) -- BAAI/bge-small-en-v1.5 via ONNX
  - `openai` -- text-embedding-3-small (requires `OPENAI_API_KEY`)
  - `sentence-transformers` -- all-MiniLM-L6-v2
  - `none` -- disable embeddings


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


## Examples

### Basic Example

```bash
# Install
pip install {skill_dir}

# Run
{skill_dir} --help
```

### Advanced Example

```bash
# With options
{skill_dir} run --input "data" --output "result"

# Batch mode
{skill_dir} batch --files "*.txt"
```


## Getting Started

1. Install the skill
2. Configure settings
3. Run your first command
4. Explore advanced features

For more details, see the Examples section above.

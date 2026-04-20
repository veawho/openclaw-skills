---
name: Neo4j
description: Write Cypher queries with proper patterns for merging, traversal, and performance.
metadata: {"clawdbot":{"emoji":"🕸️","requires":{"anyBins":["cypher-shell","neo4j"]},"os":["linux","darwin","win32"]}}
---

## Overview

Write Cypher queries with proper patterns for merging, traversal, and performance.

## When to Use

- Working with graph databases
- Writing Cypher queries
- Neo4j database operations
- Graph traversal and pattern matching

## Common Issues

### MERGE Trap

```cypher
# DONT: creates duplicates
MERGE (a)-[:KNOWS]->(b)

# DO: merge nodes separately, then relationship
MERGE (a:User {id: $id})
MERGE (b:User {id: $bid})
MERGE (a)-[:KNOWS]->(b)

# Safe upsert with ON CREATE/ON MATCH
MERGE (n:User {id: $id})
ON CREATE SET n.created = timestamp()
ON MATCH SET n.updated = timestamp()
```

### Indexes

```cypher
# Always index properties used in WHERE
CREATE INDEX FOR (n:User) ON (n.email)

# Unique constraint auto-creates index
CREATE CONSTRAINT FOR (n:User) REQUIRE n.id IS UNIQUE

# Full-text index for text search
CREATE FULLTEXT INDEX FOR (n:Post) ON EACH [n.title, n.body]

# Check plan before production
EXPLAIN MATCH (u:User) WHERE u.email = 'test@example.com' RETURN u
```

### Variable-Length Paths

```cypher
# Always set upper bound
MATCH (a)-[:KNOWS*1..5]-(b)

# Use allShortestPaths for multiple paths
MATCH p = allShortestPaths((a)-[:KNOWS*]-(b))
RETURN p
```

### Batch Operations

```cypher
# Batch creates in transactions
CALL {
  UNWIND $list AS item
  CREATE (n:Node {id: item.id})
} IN TRANSACTIONS OF 1000 ROWS

# Batch deletes
MATCH (n:Old) WITH n LIMIT 10000 DETACH DELETE n
```

### Parameter Injection

```cypher
# Always use parameters
MATCH (u:User {id: $userId}) RETURN u

# List parameter for IN
WHERE n.id IN $ids
```

## Original Reference

### MERGE Trap

- `MERGE` matches the FULL pattern—`MERGE (a)-[:KNOWS]->(b)` creates duplicates if relationship missing
- Safe upsert: merge nodes separately, then merge relationship
- Use `ON CREATE SET` and `ON MATCH SET` for conditional properties—without these, nothing updates on match
- For simple node upsert: `MERGE (n:User {id: $id})` with unique constraint on id

## Indexes

- No index on property = full label scan—always index properties used in WHERE
- Unique constraint auto-creates index—prefer constraint over plain index when applicable
- Check plan with `EXPLAIN` before production—look for "NodeByLabelScan" without filter pushdown
- Text search needs full-text index: `CREATE FULLTEXT INDEX FOR (n:Post) ON EACH [n.title, n.body]`

## Variable-Length Paths

- Unbounded `[*]` explodes on connected graphs—always set upper bound `[*1..5]`
- `[*0..]` includes start node—usually unintended, start from `[*1..]`
- `shortestPath()` returns one path only—use `allShortestPaths()` for all equally short paths
- Filter inside path is expensive: `[r:KNOWS* WHERE r.active]` scans then filters—consider data model change

## Cartesian Product

- Two disconnected patterns multiply: `MATCH (a:User), (b:Product)` returns rows × rows
- Connect patterns or split with WITH—unintended cartesian kills performance
- Same variable in two patterns = implicit join, no cartesian
- `PROFILE` query shows "CartesianProduct" operator when it happens

## WITH Scope Reset

- Only variables in WITH carry forward—`MATCH (a)--(b) WITH a` loses `b`
- Aggregation forces WITH: `MATCH (u:User) WITH u.country AS c, count(*) AS n`
- Common mistake: filtering after aggregation requires second WITH
- Pagination: `WITH n ORDER BY n.created SKIP 10 LIMIT 10`

## NULL Propagation

- `OPTIONAL MATCH` returns NULL for missing patterns—NULLs propagate through expressions
- `WHERE` after OPTIONAL MATCH filters out NULLs—use `COALESCE()` to preserve rows
- `count(NULL)` returns 0—useful: `OPTIONAL MATCH (u)-[:REVIEWED]->(p) RETURN count(p)`
- Property access on NULL throws no error, returns NULL—silent data loss

## Direction

- Query direction ignored with no arrow: `(a)-[:KNOWS]-(b)` matches both ways
- Creation requires direction—must pick one, can't create undirected
- Wrong direction = empty results—if relationship is `(a)-[:OWNS]->(b)`, query `(b)-[:OWNS]->(a)` finds nothing

## Batch Operations

- Large creates in single transaction exhaust heap—use `CALL {} IN TRANSACTIONS OF 1000 ROWS`
- `UNWIND $list AS item CREATE (n:Node {id: item.id})` for batch inserts
- `apoc.periodic.iterate()` for complex batch logic with progress
- Delete in batches: `MATCH (n:Old) WITH n LIMIT 10000 DETACH DELETE n` in loop

## Parameter Injection

- Always use parameters `$param` not string concatenation—prevents Cypher injection
- Parameters also enable query plan caching—literal values recompile each time
- Pass as map: `{param: value}` in driver, `:param {param: value}` in browser
- List parameter for IN: `WHERE n.id IN $ids`

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

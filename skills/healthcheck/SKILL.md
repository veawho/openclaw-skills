---
name: healthcheck
description: Track water and sleep with JSON file storage
description_zh: Trck wter 和 sleep 使用 JSON file st或ge。
version: 1.0.2
tags: health, tracking
---

# Health Tracker


## 中文说明

### 简介

healthcheck - Track water and sleep with JSON file storage

### 使用方法

此 Skill 已安装到 `/home/node/.openclaw/workspace/skills/healthcheck/`

1. 查看 SKILL.md 了解详细用法
2. 如有 scripts/run.sh，可直接运行
3. 参照 Examples 章节中的命令进行操作

### 适用场景

- 请参考 ## When to Use 章节
- 如有疑问，请查看 ## Troubleshooting 章节

### 快速开始

```bash
# 查看帮助
cd /home/node/.openclaw/workspace/skills/healthcheck
cat SKILL.md

# 运行（如有脚本）
./scripts/run.sh
```

### 注意事项

- 请确保已安装所需依赖
- 建议先阅读 ## Setup 或 ## Installation 章节
- 详细配置说明见 ## Configuration 章节

## Overview

Track water intake and sleep with JSON file storage.

## When to Use

- Tracking daily water intake
- Monitoring sleep patterns
- Health habit tracking
- Simple health metrics logging

Simple tracking for water intake and sleep using JSON file.

## Data Format

File: `{baseDir}/health-data.json`

```json
{
  "water": [{"time": "ISO8601", "cups": 2}],
  "sleep": [{"time": "ISO8601", "action": "sleep|wake"}]
}
```

## Add Water Record

When user says "uống X cốc" or "uống nước X cốc":

```bash
node -e "const fs=require('fs');const f='{baseDir}/health-data.json';let d={water:[],sleep:[]};try{d=JSON.parse(fs.readFileSync(f))}catch(e){}d.water.push({time:new Date().toISOString(),cups:CUPS});fs.writeFileSync(f,JSON.stringify(d));console.log('Da ghi: '+CUPS+' coc')"
```

Replace `CUPS` with number from user input.

## Add Sleep Record

When user says "đi ngủ":

```bash
node -e "const fs=require('fs');const f='{baseDir}/health-data.json';let d={water:[],sleep:[]};try{d=JSON.parse(fs.readFileSync(f))}catch(e){}d.sleep.push({time:new Date().toISOString(),action:'sleep'});fs.writeFileSync(f,JSON.stringify(d));console.log('Da ghi: di ngu')"
```

## Add Wake Record

When user says "thức dậy" or "dậy rồi":

```bash
node -e "const fs=require('fs');const f='{baseDir}/health-data.json';let d={water:[],sleep:[]};try{d=JSON.parse(fs.readFileSync(f))}catch(e){}const last=d.sleep.filter(s=>s.action==='sleep').pop();d.sleep.push({time:new Date().toISOString(),action:'wake'});fs.writeFileSync(f,JSON.stringify(d));if(last){const h=((new Date()-new Date(last.time))/3600000).toFixed(1);console.log('Da ngu: '+h+' gio')}else{console.log('Da ghi: thuc day')}"
```

## View Stats

When user says "thống kê" or "xem thống kê":

```bash
node -e "const fs=require('fs');const f='{baseDir}/health-data.json';let d={water:[],sleep:[]};try{d=JSON.parse(fs.readFileSync(f))}catch(e){}console.log('Water:',d.water.length,'records');console.log('Sleep:',d.sleep.length,'records');const today=d.water.filter(w=>new Date(w.time).toDateString()===new Date().toDateString());console.log('Today:',today.reduce((s,w)=>s+w.cups,0),'cups')"
```

## Update Record

To update last water entry:

```bash
node -e "const fs=require('fs');const f='{baseDir}/health-data.json';let d=JSON.parse(fs.readFileSync(f));d.water[d.water.length-1].cups=NEW_CUPS;fs.writeFileSync(f,JSON.stringify(d));console.log('Updated')"
```

## Delete Record

To delete last water entry:

```bash
node -e "const fs=require('fs');const f='{baseDir}/health-data.json';let d=JSON.parse(fs.readFileSync(f));d.water.pop();fs.writeFileSync(f,JSON.stringify(d));console.log('Deleted')"
```

## Notes

- Uses Node.js built-in modules only
- File auto-created if missing
- All timestamps in ISO8601 format

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

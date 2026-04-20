---
name: Medical Document Processor
description: 醫療文檔處理技能 - 病歷摘要、報告分析、醫學文獻整理。適用於醫生、醫療專業人員。觸發詞：病歷、醫療報告、醫學文獻、clinical notes、medical document、病歷摘要、出院小結、門診記錄。
description_zh: 醫療文檔處理技能 - 病歷摘要、報告分析、醫學文獻整理。適用於醫生、醫療專業人員。觸發詞：病歷、醫療報告、醫學文獻、clinicl notes、medicl 文档、病歷摘要、出院小結、門診記錄。
version: 1.0.0
author: psy仔
slug: medical-document-processor
---

# Medical Document Processor


## 中文说明

### 简介

Medical Document Processor - 醫療文檔處理技能 - 病歷摘要、報告分析、醫學文獻整理。適用於醫生、醫療專業人員。觸發詞：病歷、醫療報告、醫學文獻、clinical notes、medical document、病歷摘要、出院小結、門診記錄。

### 使用方法

此 Skill 已安装到 `/home/node/.openclaw/workspace/skills/medical-document-processor/`

1. 查看 SKILL.md 了解详细用法
2. 如有 scripts/run.sh，可直接运行
3. 参照 Examples 章节中的命令进行操作

### 适用场景

- 请参考 ## When to Use 章节
- 如有疑问，请查看 ## Troubleshooting 章节

### 快速开始

```bash
# 查看帮助
cd /home/node/.openclaw/workspace/skills/medical-document-processor
cat SKILL.md

# 运行（如有脚本）
./scripts/run.sh
```

### 注意事项

- 请确保已安装所需依赖
- 建议先阅读 ## Setup 或 ## Installation 章节
- 详细配置说明见 ## Configuration 章节

醫療文檔智能處理技能，專為醫療專業人員設計。

## Overview

  醫療文檔智能處理技能，專為醫療專業人員設計。 

## When to Use

- Medical document processing

## OVERVIEW_PLACEHOLDER ## 功能

### 1. 病歷摘要
將冗長病歷壓縮為結構化摘要：
- 主訴、現病史、既往史
- 體檢發現
- 診斷與鑑別診斷
- 治療方案

### 2. 醫療報告分析
- 檢驗報告解讀
- 影像報告摘要
- 病理報告整理

### 3. 醫學文獻整理
- 文獻重點提取
- 研究方法摘要
- 結論與臨床意義

## 使用方式

**病歷摘要：**
```
請幫我摘要這份病歷：[貼上病歷內容]
```

**報告分析：**
```
分析這份檢驗報告：[貼上報告]
```

**文獻整理：**
```
整理這篇文獻的重點：[貼上文獻或連結]
```

## 輸出格式

預設使用結構化 Markdown：
- ✅ 清晰標題
- ✅ 重點加粗
- ✅ 表格整理數據
- ✅ 臨床建議

## 注意事項

- 不提供診斷建議，僅做文檔整理
- 保護患者隱私，去除個人識別信息
- 醫療決策需由執業醫師判斷

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

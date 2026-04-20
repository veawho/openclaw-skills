---
name: automation-workflow-builder
description: 自动化工作流构建器，设计并执行跨平台自动化流程，支持触发器、条件判断、多步骤操作。
description_zh: 自动化工作流构建器，设计并执行跨平台自动化流程，支持触发器、条件判断、多步骤操作。
metadata:
  openclaw:
    requires:
      bins:
        - exec
        - read
        - write
        - web_fetch
---

# 自动化工作流构建器 v1.0.0


## 中文说明

### 简介

automation-workflow-builder - 自动化工作流构建器，设计并执行跨平台自动化流程，支持触发器、条件判断、多步骤操作。

### 使用方法

此 Skill 已安装到 `/home/node/.openclaw/workspace/skills/automation-workflow-builder/`

1. 查看 SKILL.md 了解详细用法
2. 如有 scripts/run.sh，可直接运行
3. 参照 Examples 章节中的命令进行操作

### 适用场景

- 请参考 ## When to Use 章节
- 如有疑问，请查看 ## Troubleshooting 章节

### 快速开始

```bash
# 查看帮助
cd /home/node/.openclaw/workspace/skills/automation-workflow-builder
cat SKILL.md

# 运行（如有脚本）
./scripts/run.sh
```

### 注意事项

- 请确保已安装所需依赖
- 建议先阅读 ## Setup 或 ## Installation 章节
- 详细配置说明见 ## Configuration 章节

## Overview

  设计并执行自动化工作流，替代重复性人工操作。 

## When to Use

- Automation workflow creation

## OVERVIEW_PLACEHOLDER ## 功能特性

### 1. 触发器系统
- 定时触发（Cron）
- 文件变化触发
- API webhook 触发
- 手动触发

### 2. 条件判断
- IF/ELSE 逻辑
- 多条件组合
- 数据过滤

### 3. 操作节点
- 文件操作（读/写/移动/复制）
- 网络请求（GET/POST）
- 数据处理（转换/格式化）
- 命令执行
- 通知发送

### 4. 工作流模板
- 数据同步
- 内容发布
- 报告生成
- 监控告警

## 快速使用示例

```javascript
// 示例 1：定时抓取 + 处理 + 保存
const workflow = {
  trigger: { type: "cron", schedule: "0 */6 * * *" },
  steps: [
    { action: "fetch", url: "https://api.example.com/data" },
    { action: "transform", script: "process(data)" },
    { action: "save", path: "./output/data.json" }
  ]
}

// 示例 2：文件监控 + 自动处理
const workflow = {
  trigger: { type: "watch", path: "./inbox" },
  steps: [
    { action: "read", file: "${trigger.file}" },
    { action: "process", type: "convert" },
    { action: "move", to: "./processed" }
  ]
}

// 示例 3：多步骤数据同步
const workflow = {
  trigger: { type: "manual" },
  steps: [
    { action: "fetch", url: "source-api", output: "data1" },
    { action: "fetch", url: "another-api", output: "data2" },
    { action: "merge", inputs: ["data1", "data2"] },
    { action: "upload", destination: "cloud-storage" }
  ]
}
```

## 预置工作流模板

### 模板 1：竞品价格监控
```
触发：每天 9:00
步骤：
1. 抓取竞品网站价格
2. 与本地数据对比
3. 如有变化，发送通知
4. 保存历史记录
```

### 模板 2：内容自动发布
```
触发：新文件添加到./drafts
步骤：
1. 读取草稿内容
2. 格式化/优化
3. 发布到目标平台
4. 记录发布日志
```

### 模板 3：数据报告生成
```
触发：每周一 8:00
步骤：
1. 从多个 API 拉取数据
2. 合并、计算指标
3. 生成图表/表格
4. 导出 PDF/Excel
5. 发送邮件/消息
```

## 使用场景

1. **电商运营** - 价格监控、库存同步、订单处理
2. **内容创作** - 素材收集、格式转换、多平台发布
3. **数据分析** - 数据抓取、清洗、报告生成
4. **客户服务** - 自动回复、工单处理、反馈收集
5. **项目管理** - 进度跟踪、状态同步、提醒通知

## 定制开发

需要定制化自动化工作流、企业级集成方案？

📧 联系：careytian-ai@github

---

## 许可证

MIT-0

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

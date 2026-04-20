---
name: explain-code
description: 用可视化图表和类比解释代码。在解释代码如何工作、教授代码库或用户询问如何工作时使用
---

## Overview

在解释代码时，总是包含:

## When to Use

- 用户询问代码如何工作
- 解释代码库的结构
- 教授编程概念
- 调试时解释代码逻辑

## 方法

```
1. 先打比方做类比: 将代码与日常生活中的事物进行比较
2. 画图表: 使用ASCII art来展示流程、结构或关系
3. 遍历代码: 一步一步地解释发生了什么
4. Highlight突出问题: 常见的错误或误解是什么？
```

## 示例

```
# 类比: 把函数比作工厂流水线
# 图表: ASCII展示数据流动
# 遍历: 逐行解释代码执行
```

保持解释自然。对于复杂的概念，可以用多个类比。

1. **先打比方做类比**: 将代码与日常生活中的事物进行比较
2. **画图表**: 使用ASCII art来展示流程、结构或关系
3. **遍历代码**: 一步一步地解释发生了什么
4. **Highlight突出问题**: 常见的错误或误解是什么？

保持解释自然。对于复杂的概念，可以用多个类比。

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

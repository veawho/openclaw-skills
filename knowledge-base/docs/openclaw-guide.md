# OpenClaw 使用指南

## 安装 Skills

安装 skills 使用 clawhub 命令：

```bash
clawhub install <skill-name>
```

## 配置子代理

在 openclaw.json 中配置：

```json
{
  "agents": {
    "defaults": {
      "subagents": {
        "maxConcurrent": 16
      }
    }
  }
}
```

## 使用知识库

1. 构建知识库：`kb build`
2. 导入文档：`kb import <path>`
3. 问答：`kb query "问题"`

# OpenClaw Workspace 文件说明

## Workspace 根目录文件

### AGENTS.md
- 定义智能体行为规范
- 包含会话启动规则
- 定义内存和上下文管理方式
- 包含 Heartbeat 心跳机制

### SOUL.md
- 定义 AI 人格和角色
- 核心真理和行为准则
- 指导如何更聪明地参与群聊
- 避免 stiff, generic replies

### TOOLS.md
- 本地工具配置备忘
- 包含摄像头位置
- SSH 配置
- TTS 语音偏好
- 设备别名

### USER.md
- 用户信息模板
- 记录用户偏好和上下文
- 构建用户档案

### IDENTITY.md
- AI 身份定义
- 名字、特点、风格
- Emoji 签名

### BOOTSTRAP.md
- 首次启动引导
- 用于认识用户
- 建立基本身份

### HEARTBEAT.md
- 心跳检查清单模板
- 周期性检查任务
- 减少 API 调用的批处理

## Memory 目录

- /home/node/.openclaw/workspace/memory/YYYY-MM-DD.md
- 每日记录文件
- 包含日常工作和决策
- 用于长期记忆维护

## Skills 目录

- /home/node/.openclaw/workspace/skills/
- 包含 131 个已安装的 Skills
- 每个 Skill 包含 SKILL.md 描述文件

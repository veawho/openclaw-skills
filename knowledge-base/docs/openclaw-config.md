# OpenClaw 配置文档

## 网关配置 (Gateway)

| 配置项 | 值 |
|--------|-----|
| 端口 | 18789 |
| 模式 | local |
| 绑定 | auto |
| 认证模式 | token |
| Token | 57d72ab8d098dffeab6c5415a52dbd2c |

## 代理配置 (Agents)

| 配置项 | 值 |
|--------|-----|
| 主模型 | minimax/MiniMax-M2.7 |
| Workspace | /home/node/.openclaw/workspace |
| Subagent 最大并发 | 16 |
| 允许所有 Agent | true |

## 模型配置 (Models)

| 配置项 | 值 |
|--------|-----|
| 提供商 | minimax |
| API 地址 | https://api.minimaxi.com/anthropic |
| 上下文窗口 | 204800 tokens |
| 最大输出 | 131072 tokens |
| 输入成本 | $0.3/1M tokens |
| 输出成本 | $1.2/1M tokens |

## 渠道配置 (Channels)

### Telegram

| 配置项 | 值 |
|--------|-----|
| 启用 | true |
| 机器人Token | ${TELEGRAM_BOT_TOKEN} |
| DM策略 | allowlist |
| 允许用户 | 1521667184 |
| 群组提及 | requireMention=true |

## 插件配置 (Plugins)

| 插件 | 状态 |
|------|------|
| minimax | enabled |

## 版本信息

| 配置项 | 值 |
|--------|-----|
| 版本 | 2026.4.15 |
| 最后更新 | 2026-04-19T17:36:16.980Z |

## 环境变量

```bash
TELEGRAM_BOT_TOKEN=xxx  # Telegram 机器人 Token
```

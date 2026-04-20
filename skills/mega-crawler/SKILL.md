---
name: mega-crawler
description: 强悍的爬虫构架 - 整合 clawbrowser、playwright、ai-writing-agent、vector-memory 等能力，实现智能爬取、自动分类、向量存储、语义检索的完整爬虫系统。
description_zh: 强悍的爬虫构架 - 整合 clawbrowser、playwright、ai-writing-agent、vector-memory 等能力，实现智能爬取、自动分类、向量存储、语义检索的完整爬虫系统。
version: 1.0.0
author: "巫师 叔叔"
---

# Mega Crawler - 强悍爬虫构架

## Overview

整合多个 Skills 构建完整爬虫系统：

```
爬取 → 解析 → 分类 → 向量化 → 存储 → 检索 → 问答
```

### 核心组件

| 组件 | Skills | 功能 |
|------|--------|------|
| **浏览器控制** | clawbrowser, playwright | 网页抓取 |
| **AI 处理** | ai-writing-agent, gemini | 内容分析 |
| **向量化** | pinecone, embeddings | 语义存储 |
| **知识库** | knowledge-base-builder | RAG 检索 |
| **调度** | omni-coordinator | 任务协调 |
| **监控** | stability-guardian | 稳定性保障 |

## Architecture

```
┌─────────────────────────────────────────────────────────────────┐
│                      Mega Crawler                                │
├─────────────────────────────────────────────────────────────────┤
│  🎯 Omni-Coordinator (调度中心)                                 │
│  ├── 任务分析 → 调度决策 → 结果整合                             │
├─────────────────────────────────────────────────────────────────┤
│  🌐 爬取层 (clawbrowser + playwright)                            │
│  ├── Playwright CLI → 浏览器自动化                               │
│  ├── 网页抓取 → JS 渲染支持                                      │
│  └── 增量爬取 → 定时任务                                         │
├─────────────────────────────────────────────────────────────────┤
│  🤖 AI 处理层 (ai-writing-agent + gemini)                       │
│  ├── 内容解析 → 关键信息提取                                     │
│  ├── 自动分类 → 标签生成                                         │
│  └── 摘要生成 → 质量评估                                          │
├─────────────────────────────────────────────────────────────────┤
│  📊 向量层 (pinecone + embeddings)                              │
│  ├── 文本向量化 → 1536 维向量                                     │
│  ├── 相似度检索 → Top-K 结果                                     │
│  └── 元数据存储 → 来源/时间/标签                                  │
├─────────────────────────────────────────────────────────────────┤
│  💾 存储层 (knowledge-base + vector-memory)                      │
│  ├── 结构化存储 → 文档管理                                       │
│  ├── 全文检索 → 关键词匹配                                       │
│  └── 知识图谱 → 实体关系                                         │
├─────────────────────────────────────────────────────────────────┤
│  🛡️ 监控层 (stability-guardian + watchdog)                      │
│  ├── 健康检查 → 自动恢复                                         │
│  ├── 性能监控 → 限流保护                                         │
│  └── 告警通知 → 问题追踪                                         │
└─────────────────────────────────────────────────────────────────┘
```

## Features

### 1. 智能爬取

- 支持 JavaScript 渲染
- 增量更新检测
- 定时自动爬取
- 反反爬策略
- 多线程并发

### 2. AI 内容处理

- 自动摘要生成
- 关键词提取
- 自动分类打标
- 情感分析
- 内容质量评估

### 3. 向量检索

- 语义相似度搜索
- 混合检索 (向量+关键词)
- 多维度过滤
- 相关性排序

### 4. 知识库管理

- 文档版本管理
- 增量更新
- 去重检测
- 冲突处理

## Quick Start

### 一键启动爬虫

```bash
# 使用 Omni-Coordinator
omni-coordinator "启动爬虫，爬取 https://example.com"
```

### 手动启动

```bash
# 1. 初始化爬虫
mega-crawler init --name my-crawler --url https://example.com

# 2. 配置爬取规则
mega-crawler config --depth 3 --concurrency 5

# 3. 启动爬取
mega-crawler crawl --full

# 4. 查询结果
mega-crawler search "查询内容"
```

## Configuration

```yaml
crawler:
  name: mega-crawler
  seed_urls:
    - https://example.com
    - https://example.org
  
 爬取配置:
    max_depth: 3
    concurrency: 5
    delay: 1
    timeout: 30
    retry: 3
    
  解析配置:
    selectors:
      title: "h1, .title"
      content: "article, .content"
      links: "a[href]"
    
  AI处理:
    enabled: true
    model: gemini
    summary_length: 200
    extract_tags: true
    
  向量存储:
    provider: pinecone
    dimension: 1536
    metric: cosine
    
  存储:
    provider: lancedb
    path: ./data/knowledge-base
```

## Crawl Commands

### 基础命令

```bash
mega-crawler init <name>           # 初始化爬虫
mega-crawler crawl [url]           # 开始爬取
mega-crawler pause                  # 暂停爬取
mega-crawler resume                  # 恢复爬取
mega-crawler stop                    # 停止爬取
```

### 查询命令

```bash
mega-crawler search <query>        # 语义搜索
mega-crawler list                   # 列出文档
mega-crawler stats                  # 查看统计
mega-crawler export                 # 导出数据
```

### 管理命令

```bash
mega-crawler config                 # 配置
mega-crawler status                 # 状态
mega-crawler logs                   # 日志
mega-crawler clean                  # 清理
```

## Use Cases

### 1. 新闻监控

```bash
mega-crawler init news-monitor
mega-crawler config --urls "news.site1.com,news.site2.com"
mega-crawler config --schedule "0 * * *"  # 每小时
mega-crawler crawl
```

### 2. 竞品分析

```bash
mega-crawler init competitor-analysis
mega-crawler config --urls "competitor.com/*"
mega-crawler config --ai-analysis true
mega-crawler crawl --full
mega-crawler search "产品定价"
```

### 3. 知识收集

```bash
mega-crawler init knowledge-base
mega-crawler config --urls "docs.site.com/*"
mega-crawler config --vectorize true
mega-crawler crawl
mega-crawler search "如何使用"
```

### 4. 价格监控

```bash
mega-crawler init price-monitor
mega-crawler config --urls "shop.com/products/*"
mega-crawler config --track-price true
mega-crawler crawl --schedule "0 12 * * *"  # 每天中午
mega-crawler alert --threshold 10%  # 价格变化超过10%告警
```

## Performance

| 指标 | 数值 |
|------|------|
| 并发数 | 5-10 |
| 爬取速度 | 100+ pages/min |
| 向量化延迟 | < 100ms |
| 检索延迟 | < 50ms |
| 成功率 | > 95% |

## Monitoring

```bash
# 查看爬虫状态
mega-crawler status

# 查看性能指标
mega-crawler metrics

# 查看告警历史
mega-crawler alerts

# 健康检查
mega-crawler health
```

## Examples

### Example 1: 完整爬取流程

```bash
# 初始化
mega-crawler init my-project --url https://example.com

# 配置
mega-crawler config --depth 3 --ai-summary true --vectorize true

# 爬取
mega-crawler crawl --full

# 搜索
mega-crawler search "相关信息"
```

### Example 2: 定时爬取

```bash
# 配置定时任务
mega-crawler schedule "0 8 * * *" --crawl

# 查看定时任务
mega-crawler schedule --list

# 删除定时任务
mega-crawler schedule --delete my-project
```

### Example 3: 批量爬取

```bash
# 批量URL
mega-crawler batch urls.txt

# 并发爬取
mega-crawler crawl --parallel --workers 10
```

## Integration

### 与其他 Skills 配合

| 场景 | Skills 组合 |
|------|------------|
| 智能爬取 | clawbrowser + ai-writing-agent |
| 向量检索 | pinecone + embeddings |
| 知识管理 | knowledge-base + vector-memory |
| 自动调度 | omni-coordinator + cron-retry |
| 监控告警 | stability-guardian + watchdog |

## Troubleshooting

### 爬取失败

```bash
# 查看日志
mega-crawler logs --error

# 重试失败页面
mega-crawler retry --failed

# 清除缓存重新爬取
mega-crawler clean --cache && mega-crawler crawl
```

### 性能问题

```bash
# 降低并发
mega-crawler config --concurrency 3

# 清理旧数据
mega-crawler clean --old

# 查看资源使用
mega-crawler metrics
```

## See Also

- [clawbrowser](../clawbrowser/SKILL.md) - 浏览器控制
- [omni-coordinator](../omni-coordinator/SKILL.md) - 调度中心
- [knowledge-base-builder](../knowledge-base-builder/SKILL.md) - 知识库
- [stability-guardian](../stability-guardian/SKILL.md) - 稳定性保障
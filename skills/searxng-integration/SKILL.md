---
name: searxng-integration
description: SearXNG 搜索引擎集成 - 整合 SearXNG 元搜索引擎与 Mega Crawler，提供聚合搜索、元搜索、结果缓存功能，增强爬虫的数据源采集能力。
description_zh: SearXNG 搜索引擎集成 - 整合 SearXNG 元搜索引擎与 Mega Crawler，提供聚合搜索、元搜索、结果缓存功能，增强爬虫的数据源采集能力。
version: 1.0.0
author: "巫师 叔叔"
---

# SearXNG Integration - SearXNG 搜索引擎集成

## Overview

整合 SearXNG 元搜索引擎与 Mega Crawler，实现：

```
SearXNG 元搜索 → 结果聚合 → 精选爬取 → 向量化存储 → 语义检索
```

## Architecture

```
┌─────────────────────────────────────────────────────────────────┐
│                    SearXNG Integration                            │
├─────────────────────────────────────────────────────────────────┤
│  🔍 SearXNG (Docker)                                            │
│  ├── 元搜索引擎 (聚合多个搜索引擎)                               │
│  ├── 隐私保护 (不追踪用户)                                      │
│  └── API 接口 (localhost:8888)                                  │
├─────────────────────────────────────────────────────────────────┤
│  🌐 Crawler Layer                                               │
│  ├── 搜索结果 → 智能筛选                                        │
│  ├── 外链 → 自动爬取                                            │
│  └── 增量更新 → 定时同步                                        │
├─────────────────────────────────────────────────────────────────┤
│  💾 Storage Layer                                                │
│  ├── 原始结果 → 缓存                                            │
│  ├── 去重处理 → 去重库                                          │
│  └── 向量化 → 知识库                                            │
└─────────────────────────────────────────────────────────────────┘
```

## Features

### 1. 元搜索增强

- 聚合 70+ 搜索引擎结果
- 隐私保护 (不暴露 IP)
- 结果去重和排序
- API 访问 (localhost:8888)

### 2. 搜索结果利用

- 提取搜索结果中的 URL
- 按相关性筛选优质源
- 自动分类 (新闻/博客/论坛等)
- 定时更新搜索结果

### 3. 与 Crawler 集成

```
搜索 "关键词" → 获取结果URLs → 精选爬取 → 向量存储
```

### 4. 结果缓存

- 缓存搜索结果
- 减少重复搜索
- 离线访问
- 历史追踪

## Configuration

### SearXNG 配置 (Docker)

```yaml
# docker-compose.yml
searxng:
  image: searxng/searxng
  ports:
    - "8888:8080"
  environment:
    - SEARXNG_BASE_URL=http://localhost:8888/
  volumes:
    - ./searxng:/etc/searxng
```

### 集成配置

```yaml
searxng:
  endpoint: http://localhost:8888
  timeout: 10
  engines:
    - google
    - bing
    - duckduckgo
    - wikipedia
    
crawler:
  search_enabled: true
  auto_crawl: true
  max_results: 50
  filter:
    domain_whitelist:
      - wikipedia.org
      - github.com
      - medium.com
    spam_filter: true
```

## Quick Start

### 1. 搜索

```bash
searxng-search "OpenClaw skills"
```

### 2. 聚合搜索 + 爬取

```bash
searxng-crawl "AI news" --limit 20
```

### 3. 定时搜索

```bash
searxng-schedule "技术趋势" --interval 3600
```

## Commands

### 搜索命令

```bash
searxng search <query>              # 基本搜索
searxng search <query> --engines google,bing  # 指定引擎
searxng search <query> --limit 50  # 结果数量
searxng search <query> --format json  # JSON输出
```

### 爬取命令

```bash
searxng crawl <query>              # 搜索+爬取
searxng crawl <query> --full       # 完整爬取
searxng crawl <query> --incremental  # 增量更新
```

### 管理命令

```bash
searxng status                     # 查看状态
searxng cache                      # 查看缓存
searxng clear                      # 清理缓存
searxng stats                      # 统计信息
```

## Integration with Crawler

### 数据流

1. **SearXNG 搜索** → 获取 URL 列表
2. **结果筛选** → 去除重复/低质量
3. **Crawler 爬取** → 访问目标页面
4. **AI 处理** → 内容分析
5. **向量化** → 存储到知识库
6. **检索** → 语义搜索

### 示例

```bash
# 搜索 + 自动爬取
searxng-crawl "机器学习教程" --limit 30

# 等同于:
# 1. searxng search "机器学习教程" --limit 30
# 2. 提取 URLs
# 3. mega-crawler crawl --urls <urls>
# 4. 向量化存储
```

## SearXNG API

### 搜索 API

```
GET http://localhost:8888/search?q=<query>&format=json
```

### 响应格式

```json
{
  "results": [
    {
      "title": "Result Title",
      "url": "https://example.com",
      "content": "Snippet...",
      "engine": "google",
      "score": 0.95
    }
  ]
}
```

### 使用 Python

```python
import requests

def search(query):
    response = requests.get(
        "http://localhost:8888/search",
        params={"q": query, "format": "json"}
    )
    return response.json()["results"]
```

## Use Cases

### 1. 新闻聚合

```bash
# 搜索多个来源的新闻
searxng-crawl "AI 技术新闻" --engines google,bing,yahoo --limit 50

# 定时更新
searxng-schedule "AI 技术新闻" --interval 3600
```

### 2. 竞品监控

```bash
# 监控竞争对手动态
searxng-crawl "竞争对手名称" --filter domain:competitor.com

# 设置告警
searxng-alert "新产品发布" --keywords "竞品,发布"
```

### 3. 趋势追踪

```bash
# 追踪技术趋势
searxng-crawl "2024 技术趋势" --sources medium,dev.to,github

# 生成报告
searxng report --period 7d
```

### 4. 知识补充

```bash
# 基于知识库搜索补充
searxng-crawl "相关主题" --related-to existing-kb

# 自动去重
searxng-crawl "补充知识" --dedup
```

## Performance

| 指标 | 数值 |
|------|------|
| 搜索延迟 | < 500ms |
| 结果数量 | 50-100/查询 |
| 并发搜索 | 5 |
| 缓存命中率 | > 60% |

## Monitoring

```bash
# 查看 SearXNG 状态
searxng status

# 查看搜索统计
searxng stats

# 查看缓存
searxng cache --list

# 健康检查
searxng health
```

## Troubleshooting

### SearXNG 无响应

```bash
# 检查 Docker 状态
docker ps | grep searx

# 检查端口
netstat -tuln | grep 8888

# 重启 SearXNG
docker restart searxng
```

### 搜索结果为空

```bash
# 检查 API
curl "http://localhost:8888/search?q=test&format=json"

# 查看日志
docker logs searxng
```

## See Also

- [mega-crawler](../mega-crawler/SKILL.md) - 爬虫构架
- [knowledge-base-builder](../knowledge-base-builder/SKILL.md) - 知识库
- [stability-guardian](../stability-guardian/SKILL.md) - 稳定性保障
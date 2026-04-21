---
name: xiaohongshu-crawler
description: 小红书内容爬取工具，支持搜索笔记（需要登录）、获取笔记详情、用户信息、热门笔记等公开内容爬取功能。
description_zh: 小红书内容爬取工具，支持搜索笔记、获取笔记详情、用户信息、热门笔记等公开内容的批量爬取和分析。
version: 1.0.0
author: "巫师 叔叔"
---

# Xiaohongshu Crawler

小红书（Xiaohongshu）内容爬取工具，支持搜索、笔记详情、用户信息等公开内容的获取。

## Overview

小红书内容爬取工具，支持搜索笔记、获取笔记详情、用户信息、热门笔记等公开内容的批量爬取和分析。

## When to Use

- 批量获取小红书笔记内容
- 分析热门笔记趋势
- 获取特定用户发布的内容
- 竞品分析和内容监控
- 数据分析和研究报告

## Performance

### Optimization

- 使用缓存减少重复请求
- 并发控制避免被限流
- 增量更新只爬取新内容
- 结果批量处理

### Benchmarks

| 操作 | 时间 | 成功率 |
|------|------|--------|
| 搜索 | < 2s | > 95% |
| 笔记详情 | < 1s | > 98% |
| 批量爬取 | ~100/分钟 | > 90% |

## 🚀 安装

```bash
clawhub install xiaohongshu-crawler
npm install
```

## ⚙️ 快速配置

### 1. 获取 Cookie（搜索功能必需）

```bash
node scripts/get-cookie.js
```

按提示扫码登录后输入 `save` 即可。

### 2. 测试 Cookie

```bash
node scripts/test-cookie.js
```

显示 "✅ Cookie 有效" 即可使用。

## Examples

### Basic Usage

```bash
# 快速搜索
node scripts/quick-search.js "关键词" [数量]

# 深度爬取
node scripts/deep-crawl.js "关键词" [数量]

# 获取笔记详情
node scripts/get-note.js "笔记ID"

# 获取用户信息
node scripts/get-user.js "用户ID"

# 获取热门笔记
node scripts/hot-notes.js
```

### Advanced Usage

```bash
# 批量爬取
node scripts/batch-crawl.js --keywords "美妆,护肤" --limit 100

# 生成报告
node scripts/generate-report.js --input data.json

# 增量更新
node scripts/incremental-crawl.js --since 2024-01-01
```

### Code Integration

```javascript
const XiaohongshuCrawler = require('./lib/index');

async function main() {
  const crawler = new XiaohongshuCrawler({
    cookie: process.env.XHS_COOKIE
  });
  
  // 搜索
  const results = await crawler.search('关键词', { limit: 50 });
  console.log(`找到 ${results.length} 条笔记`);
  
  // 获取详情
  for (const note of results) {
    const detail = await crawler.getNoteDetail(note.id);
    console.log(detail.title);
  }
}

main().catch(console.error);
```

## API Reference

### Core Functions

```javascript
const crawler = new XiaohongshuCrawler({ cookie: 'cookie' });

// 搜索笔记
await crawler.search(keyword, options);

// 获取笔记详情
await crawler.getNoteDetail(noteId);

// 获取用户信息
await crawler.getUserInfo(userId);

// 获取热门笔记
await crawler.getHotNotes();

// 批量爬取
await crawler.batchCrawl(keywords, options);
```

### Configuration Options

```javascript
{
  cookie: 'string',
  timeout: 30000,
  retry: 3,
  concurrency: 5,
  delay: { min: 2000, max: 8000 }
}
```

## Configuration

```yaml
xiaohongshu:
  cookie: "your-cookie-here"
  timeout: 30000
  retry: 3
  concurrency: 5
  delay:
    min: 2000
    max: 8000
```

## Modules

### Main Module

```javascript
class XiaohongshuCrawler {
  constructor(config)
  async search(keyword, options)
  async getNoteDetail(noteId)
  async getUserInfo(userId)
  async getHotNotes()
  async batchCrawl(keywords, options)
}
```

### Helper Modules

```javascript
class CacheManager {
  get(key)
  set(key, value, ttl)
  clear()
}

class RequestManager {
  async request(url, options)
  async retry(fn, maxRetries)
}
```

## Dependencies

```bash
npm install axios cheerio
```

## Getting Started

1. 安装依赖: `npm install`
2. 获取 Cookie: `node scripts/get-cookie.js`
3. 测试 Cookie: `node scripts/test-cookie.js`
4. 开始爬取: `node scripts/quick-search.js "关键词"`

## ⚠️ 使用规范

### 合规使用

- ✅ **允许：** 个人学习研究、公开内容爬取、小批量数据（<50 条/次）
- ❌ **禁止：** 商业用途、大规模高频爬取、私人内容、绕过付费、分发数据

### 反爬保护

- 默认随机延迟 2-8 秒
- 每分钟最多 10 个请求
- 模拟人类浏览行为

## Troubleshooting

### Cookie 过期

```bash
# 重新获取 Cookie
node scripts/get-cookie.js
```

### 请求被限流

```bash
# 降低并发
node scripts/crawl.js --concurrency 2
```

### 数据为空

检查 Cookie 是否有效：`node scripts/test-cookie.js`
---
name: playwright-scraper-skill
description: Playwright-based web scraping OpenClaw Skill with anti-bot protection. Successfully tested on complex sites like Discuss.com.hk.
description_zh: Plywright-bsed 网页抓取 OpenClw Skill 使用 nti-bot protection. Successfully tested on complex sites like Discuss.com.hk.。
version: 1.2.0
author: Simon Chan
---

# Playwright Scraper Skill


## 中文说明

### 简介

playwright-scraper-skill - Playwright-based web scraping OpenClaw Skill with anti-bot protection. Successfully tested on complex sites like Discuss.com.hk.

### 使用方法

此 Skill 已安装到 `/home/node/.openclaw/workspace/skills/playwright-scraper-skill/`

1. 查看 SKILL.md 了解详细用法
2. 如有 scripts/run.sh，可直接运行
3. 参照 Examples 章节中的命令进行操作

### 适用场景

- 请参考 ## When to Use 章节
- 如有疑问，请查看 ## Troubleshooting 章节

### 快速开始

```bash
# 查看帮助
cd /home/node/.openclaw/workspace/skills/playwright-scraper-skill
cat SKILL.md

# 运行（如有脚本）
./scripts/run.sh
```

### 注意事项

- 请确保已安装所需依赖
- 建议先阅读 ## Setup 或 ## Installation 章节
- 详细配置说明见 ## Configuration 章节

## Overview

Playwright-based web scraping OpenClaw Skill with anti-bot protection. Successfully tested on complex sites like Discuss.com.hk.

## When to Use

- TODO: add common use cases


A Playwright-based web scraping OpenClaw Skill with anti-bot protection. Choose the best approach based on the target website's anti-bot level.

---

## 🎯 Use Case Matrix

| Target Website | Anti-Bot Level | Recommended Method | Script |
|---------------|----------------|-------------------|--------|
| **Regular Sites** | Low | web_fetch tool | N/A (built-in) |
| **Dynamic Sites** | Medium | Playwright Simple | `scripts/playwright-simple.js` |
| **Cloudflare Protected** | High | **Playwright Stealth** ⭐ | `scripts/playwright-stealth.js` |
| **YouTube** | Special | deep-scraper | Install separately |
| **Reddit** | Special | reddit-scraper | Install separately |

---

## 📦 Installation

```bash
cd playwright-scraper-skill
npm install
npx playwright install chromium
```

---

## 🚀 Quick Start

### 1️⃣ Simple Sites (No Anti-Bot)

Use OpenClaw's built-in `web_fetch` tool:

```bash
# Invoke directly in OpenClaw
Hey, fetch me the content from https://example.com
```

---

### 2️⃣ Dynamic Sites (Requires JavaScript)

Use **Playwright Simple**:

```bash
node scripts/playwright-simple.js "https://example.com"
```

**Example output:**
```json
{
  "url": "https://example.com",
  "title": "Example Domain",
  "content": "...",
  "elapsedSeconds": "3.45"
}
```

---

### 3️⃣ Anti-Bot Protected Sites (Cloudflare etc.)

Use **Playwright Stealth**:

```bash
node scripts/playwright-stealth.js "https://m.discuss.com.hk/#hot"
```

**Features:**
- Hide automation markers (`navigator.webdriver = false`)
- Realistic User-Agent (iPhone, Android)
- Random delays to mimic human behavior
- Screenshot and HTML saving support

---

### 4️⃣ YouTube Video Transcripts

Use **deep-scraper** (install separately):

```bash
# Install deep-scraper skill
npx clawhub install deep-scraper

# Use it
cd skills/deep-scraper
node assets/youtube_handler.js "https://www.youtube.com/watch?v=VIDEO_ID"
```

---

## 📖 Script Descriptions

### `scripts/playwright-simple.js`
- **Use Case:** Regular dynamic websites
- **Speed:** Fast (3-5 seconds)
- **Anti-Bot:** None
- **Output:** JSON (title, content, URL)

### `scripts/playwright-stealth.js` ⭐
- **Use Case:** Sites with Cloudflare or anti-bot protection
- **Speed:** Medium (5-20 seconds)
- **Anti-Bot:** Medium-High (hides automation, realistic UA)
- **Output:** JSON + Screenshot + HTML file
- **Verified:** 100% success on Discuss.com.hk

---

## 🎓 Best Practices

### 1. Try web_fetch First
If the site doesn't have dynamic loading, use OpenClaw's `web_fetch` tool—it's fastest.

### 2. Need JavaScript? Use Playwright Simple
If you need to wait for JavaScript rendering, use `playwright-simple.js`.

### 3. Getting Blocked? Use Stealth
If you encounter 403 or Cloudflare challenges, use `playwright-stealth.js`.

### 4. Special Sites Need Specialized Skills
- YouTube → deep-scraper
- Reddit → reddit-scraper
- Twitter → bird skill

---

## 🔧 Customization

All scripts support environment variables:

```bash
# Set screenshot path
SCREENSHOT_PATH=/path/to/screenshot.png node scripts/playwright-stealth.js URL

# Set wait time (milliseconds)
WAIT_TIME=10000 node scripts/playwright-simple.js URL

# Enable headful mode (show browser)
HEADLESS=false node scripts/playwright-stealth.js URL

# Save HTML
SAVE_HTML=true node scripts/playwright-stealth.js URL

# Custom User-Agent
USER_AGENT="Mozilla/5.0 ..." node scripts/playwright-stealth.js URL
```

---

## 📊 Performance Comparison

| Method | Speed | Anti-Bot | Success Rate (Discuss.com.hk) |
|--------|-------|----------|-------------------------------|
| web_fetch | ⚡ Fastest | ❌ None | 0% |
| Playwright Simple | 🚀 Fast | ⚠️ Low | 20% |
| **Playwright Stealth** | ⏱️ Medium | ✅ Medium | **100%** ✅ |
| Puppeteer Stealth | ⏱️ Medium | ✅ Medium-High | ~80% |
| Crawlee (deep-scraper) | 🐢 Slow | ❌ Detected | 0% |
| Chaser (Rust) | ⏱️ Medium | ❌ Detected | 0% |

---

## 🛡️ Anti-Bot Techniques Summary

Lessons learned from our testing:

### ✅ Effective Anti-Bot Measures
1. **Hide `navigator.webdriver`** — Essential
2. **Realistic User-Agent** — Use real devices (iPhone, Android)
3. **Mimic Human Behavior** — Random delays, scrolling
4. **Avoid Framework Signatures** — Crawlee, Selenium are easily detected
5. **Use `addInitScript` (Playwright)** — Inject before page load

### ❌ Ineffective Anti-Bot Measures
1. **Only changing User-Agent** — Not enough
2. **Using high-level frameworks (Crawlee)** — More easily detected
3. **Docker isolation** — Doesn't help with Cloudflare

---

## 🔍 Troubleshooting

### Issue: 403 Forbidden
**Solution:** Use `playwright-stealth.js`

### Issue: Cloudflare Challenge Page
**Solution:**
1. Increase wait time (10-15 seconds)
2. Try `headless: false` (headful mode sometimes has higher success rate)
3. Consider using proxy IPs

### Issue: Blank Page
**Solution:**
1. Increase `waitForTimeout`
2. Use `waitUntil: 'networkidle'` or `'domcontentloaded'`
3. Check if login is required

---

## 📝 Memory & Experience

### 2026-02-07 Discuss.com.hk Test Conclusions
- ✅ **Pure Playwright + Stealth** succeeded (5s, 200 OK)
- ❌ Crawlee (deep-scraper) failed (403)
- ❌ Chaser (Rust) failed (Cloudflare)
- ❌ Puppeteer standard failed (403)

**Best Solution:** Pure Playwright + anti-bot techniques (framework-independent)

---

## 🚧 Future Improvements

- [ ] Add proxy IP rotation
- [ ] Implement cookie management (maintain login state)
- [ ] Add CAPTCHA handling (2captcha / Anti-Captcha)
- [ ] Batch scraping (parallel URLs)
- [ ] Integration with OpenClaw's `browser` tool

---

## 📚 References

- [Playwright Official Docs](https://playwright.dev/)
- [puppeteer-extra-plugin-stealth](https://github.com/berstend/puppeteer-extra/tree/master/packages/puppeteer-extra-plugin-stealth)
- [deep-scraper skill](https://clawhub.com/opsun/deep-scraper)

## Examples

```bash
# Example usage
skill --help
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


## API Reference

### Main Functions

```python
# Initialize
skill = Skill()

# Process data
result = skill.process(input_data)

# Cleanup
skill.close()
```

### Configuration

```python
# With options
config = {"option1": "value1", "option2": "value2"}
skill = Skill(config)
```


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


## Limitations

- May require specific environment configuration
- Performance may vary based on input size
- Some features require optional dependencies

## Detailed Examples

### Example 1

```bash
# Basic usage
skill --help

# Run with input
skill run --input "data"

# Advanced usage
skill run --input "data" --output "result" --verbose
```

### Example 2

```bash
# Batch processing
skill batch --files "*.txt"

# With options
skill batch --files "*.txt" --output-dir ./results
```

## Setup

### Prerequisites

- Required dependencies listed below
- System requirements

### Installation

```bash
# Install via pip
pip install skill_name

# Or from source
git clone https://github.com/example/skill.git
cd skill
pip install -e .
```

### Configuration

Create a config file or set environment variables as needed.

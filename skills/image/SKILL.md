---
name: Image
slug: image
version: 1.0.4
homepage: https://clawic.com/skills/image
description: "Create, inspect, process, and optimize image files and visual assets with reliable format choice, resizing, compression, color-profile, metadata, and platform-export checks. Use when (1) the task is about images, screenshots, logos, product photos, or graphics; (2) resizing, converting, compressing, cropping, metadata, or export specs matter; (3) the asset must survive web, social, ecommerce, or print delivery without quality or format mistakes."
description_zh: "Crete, inspect, 处理, 和 optimize 图像 files 和 visul ssets 使用 relible 用于mt choice, resizing, compression, col或-profile, metdt, 和 plt用于m-exp或t checks. 用于 （1） 任务 is bout 图像s, 截图s, logos, product photos, 或 grphics; （2） resizing, converting, compressing, cropping, metdt, 或 exp或t specs mtter; （3） sset must survive web, socil, ecommerce, 或 print delivery 使用out qulity 或 用于mt mistkes."。
changelog: "Expanded the skill with branding, screenshot, accessibility, and richer platform-specific workflows while preserving stronger image-processing guidance."
metadata: {"clawdbot":{"emoji":"🖼️","os":["linux","darwin","win32"]}}
---

## When to Use


## 中文说明

### 简介

Image - "Create, inspect, process, and optimize image files and visual assets with reliable format choice, resizing, compression, color-profile, metadata, and platform-export checks. Use when (1) the task is about images, screenshots, logos, product photos, or graphics; (2) resizing, converting, compressing, cropping, metadata, or export specs matter; (3) the asset must survive web, social, ecommerce, or print delivery without quality or format mistakes."

### 使用方法

此 Skill 已安装到 `/home/node/.openclaw/workspace/skills/image/`

1. 查看 SKILL.md 了解详细用法
2. 如有 scripts/run.sh，可直接运行
3. 参照 Examples 章节中的命令进行操作

### 适用场景

- 请参考 ## When to Use 章节
- 如有疑问，请查看 ## Troubleshooting 章节

### 快速开始

```bash
# 查看帮助
cd /home/node/.openclaw/workspace/skills/image
cat SKILL.md

# 运行（如有脚本）
./scripts/run.sh
```

### 注意事项

- 请确保已安装所需依赖
- 建议先阅读 ## Setup 或 ## Installation 章节
- 详细配置说明见 ## Configuration 章节

Use when the main artifact is an image file or visual asset, especially when format choice, resizing, cropping, compression, metadata, transparency, color profile, responsive delivery, social specs, marketplace requirements, or print readiness matter.

If the task is destination-specific, load the matching file before deciding:
- `web.md` for responsive delivery, LCP/CLS, `srcset`, lazy loading, SVG, and modern web formats.
- `social.md` for platform dimensions, safe zones, and feed/story/banner exports.
- `ecommerce.md` for marketplace product-image rules, white backgrounds, zoom, and catalog consistency.
- `photography.md` for RAW, ICC profiles, print export, EXIF, and non-destructive editing.
- `branding.md` for logos, icons, favicons, app icons, SVG consistency, and small-size legibility.
- `screenshots.md` for UI captures, documentation images, annotations, redaction, and marketing/device frames.
- `accessibility.md` for alt text, decorative vs informative images, text in images, charts, and contrast-aware image delivery.
- `commands.md` when the user needs concrete ImageMagick or Pillow examples.

Keep the main workflow in this file, then pull in the specialized file for the exact delivery context instead of guessing from generic image advice.

## Quick Reference

| Situation | Load | Why |
|-----------|------|-----|
| Web optimization, responsive images, lazy loading, SVG | `web.md` | Avoid CLS/LCP mistakes, oversized assets, and wrong web formats |
| Color profiles, metadata, RAW, print, non-destructive workflows | `photography.md` | Protect color intent, print readiness, and master-file quality |
| Social platform dimensions, safe zones, banners, previews | `social.md` | Prevent unsafe crops, unreadable text, and uploader recompression surprises |
| Product photos, marketplace standards, catalog consistency | `ecommerce.md` | Preserve zoom detail, white-background compliance, and catalog consistency |
| Logos, favicons, SVGs, app icons, icon sets | `branding.md` | Protect small-size legibility, SVG consistency, and multi-format icon delivery |
| UI screenshots, docs captures, redaction, annotations | `screenshots.md` | Avoid blurry captures, privacy leaks, and misleading before/after comparisons |
| Alt text, text-in-image risk, charts, decorative vs informative images | `accessibility.md` | Keep image work usable and compliant, not only visually correct |
| ImageMagick and Pillow commands | `commands.md` | Use concrete commands once the export decision is already clear |

## Fast Workflow

1. Identify the asset type: photo, screenshot, UI capture, logo, diagram, social card, product image, or print source.
2. Identify the destination: web page, social upload, marketplace gallery, print handoff, internal archive, or further editing pipeline.
3. Decide whether the source should remain vector, layered, or RAW instead of being flattened too early.
4. Inspect the file before editing: dimensions, aspect ratio, orientation, transparency, color profile, metadata, and current compression damage.
5. Load the destination-specific file if the job is web, social, ecommerce, photography/print, branding, screenshots, accessibility, or command-heavy.
6. Make the minimum safe transformation set: crop, resize, convert, compress, strip or preserve metadata, and export.
7. Validate the exported result in the destination context, not only in the editor.

## Asset-Type Defaults

| Asset type | Usually best starting point | Watch out for |
|-----------|-----------------------------|---------------|
| Photo | WebP or AVIF for web, JPEG fallback, layered/RAW master for editing | Color profile shifts, overcompression, platform recompression |
| Product photo | JPEG or WebP for delivery, high-res clean master | White background, edge cleanup, zoom detail, consistency |
| Screenshot or UI capture | PNG or lossless WebP | JPEG blur, privacy leaks, unreadable text |
| Logo or simple icon | SVG master, PNG fallbacks only when needed | Tiny details, unsupported SVG pipelines, dark/light contrast |
| Social/OG card | PNG or high-quality JPEG sized for preview | Unsafe crop, tiny text, double compression |
| Diagram or chart | SVG when possible, PNG when fixed raster needed | Thin lines, low contrast, missing explanatory text |
| Print image | TIFF or high-quality JPEG with correct profile | Wrong profile, wrong physical size, no bleed |

## Core Rules

### 1. Choose the workflow by destination, not by habit

- Web delivery, social export, ecommerce prep, print output, and archive preservation are different image jobs.
- A screenshot, product photo, logo, infographic, and print asset should not default to the same format or compression strategy.
- Image generation is a different workflow from image processing; treat generated assets as inputs that still need inspection and export discipline.
- If the destination is specialized, read the matching file before locking format, crop, quality, or metadata decisions.
- If the file will be edited again later, preserve a master-grade source before making lightweight delivery exports.

### 2. Pick formats by content, not by trend

- Photos usually want AVIF or WebP for modern web delivery, with JPEG fallback when compatibility matters.
- Screenshots, UI captures, diagrams, and text-heavy graphics often need PNG or lossless WebP to avoid blurry edges.
- Logos, icons, and simple illustrations should stay vector (`.svg`) when the target supports it.
- Transparency changes the decision: JPEG drops alpha, while PNG, WebP, and AVIF can preserve it.
- Animated GIF is rarely the best output; animated WebP, MP4, or WebM are usually smaller and cleaner.
- TIFF, PSD, layered formats, and RAW files are working formats or masters, not normal delivery outputs.
- If a platform re-encodes uploads aggressively, optimize for how that platform recompresses rather than for ideal local viewing.
- Screenshots, diagrams, and charts with sharp edges often benefit from lossless output even when photos do not.

### 3. Preserve color, transparency, and detail deliberately

- Web assets should usually end in sRGB unless the destination explicitly needs something else.
- Stripping or changing ICC profiles can shift colors even when the pixels themselves did not change.
- Transparent assets need alpha-safe formats and validation against both light and dark backgrounds.
- Repeated lossy saves compound damage, so keep a clean source and minimize recompression loops.
- Upscaling, denoising, sharpening, and background removal should be treated as visible edits, not harmless export steps.

### 4. Resize, crop, and compress in the right order

- Decide aspect ratio first, crop second, resize third, and compress last.
- Do not upscale by default; extra pixels do not create missing detail.
- Retina or HiDPI exports should be intentional, not automatic overkill.
- As a starting point, 2x is the normal Retina export and 3x should be deliberate, not default.
- Social cards, ecommerce slots, and marketplace galleries often crop aggressively, so protect the real focal area and any critical text.
- A file that fits the pixel spec can still fail if the crop cuts off faces, products, labels, or UI affordances.
- If text is embedded inside the image, validate at the smallest realistic preview size, not only at full resolution.

### 5. Treat metadata and orientation as real delivery concerns

- EXIF orientation can make an image look upright in one viewer and rotated in another after export.
- Public web assets usually should strip GPS and unnecessary camera metadata.
- Copyright, author, or provenance metadata may need to be preserved for editorial, legal, or archive use.
- Metadata decisions are part of the workflow, not an afterthought.
- Preserve filenames and output naming conventions when downstream systems map assets by exact names or SKU patterns.
- Do not strip metadata blindly if the workflow depends on authoring info, rights data, timestamps, or orientation.

### 6. Use practical budgets and delivery defaults

- For web work, use budgets as a forcing function, not as decoration.
- A useful default starting point is: hero image under 200 KB, content image under 100 KB, thumbnail under 30 KB, raster icon under 5 KB.
- Reserve layout space with explicit dimensions or aspect ratio when the image ships on the web.
- Do not lazy-load the primary hero or likely LCP image.
- A file that "looks fine locally" is not finished if it breaks CLS, LCP, or responsive delivery in the real page.
- A small file is not automatically good if detail, text legibility, product edges, or gradients collapse.
- If a platform will recompress the image anyway, leave enough headroom that the second compression does not destroy the result.

### 7. Validate against the actual destination

- Platform specs are not interchangeable: web hero, social preview, app store art, marketplace gallery, and print ad all have different constraints.
- Ecommerce images may need background consistency, edge cleanliness, square-safe crops, and zoom-friendly detail.
- Social images need safe composition because feeds crop previews differently across platforms.
- Print assets care about physical size, bleed, and color handling in ways web exports do not.
- If the asset ships on the web, remember the surrounding delivery too: width, height, alt text, and whether the image should carry text at all.
- If the asset will be uploaded to a third-party platform, check the post-upload result because many pipelines resize, strip profiles, flatten metadata, or recompress again.
- If the image carries meaning, validate its accessibility too: alt text strategy, text legibility, decorative vs informative role, and whether the meaning should have stayed in HTML or surrounding copy.

### 8. Batch safely and keep the original reversible

- Work from originals or clean masters, not from already-optimized outputs.
- Batch processing should apply consistent rules, but still spot-check representative files before touching the whole set.
- One wrong crop preset, color conversion, or lossy export can damage an entire batch quickly.
- Keep per-destination exports separated from masters so the next edit does not accidentally start from a degraded derivative.

## Specialized Cases Worth Loading

- Load `branding.md` when the asset is a logo, app icon, favicon, social avatar, badge, or reusable icon set.
- Load `screenshots.md` when the asset is a UI capture, bug report image, tutorial screenshot, release-note image, or device-framed marketing visual.
- Load `accessibility.md` when the image needs alt text, contains embedded text, carries chart/diagram meaning, or may be decorative instead of informative.

## What Good Looks Like

- The chosen format matches the content and the destination, not a blanket preference.
- The exported file keeps the right focal area, text legibility, transparency, and color intent.
- Metadata is preserved or stripped deliberately.
- The file size is efficient without obvious visual damage.
- The asset still works after the actual upload, embed, or platform preview step.
- The agent has not flattened a vector, layered, or RAW source earlier than necessary.
- The asset is still understandable in its real use context, not just visually attractive in isolation.

## Common Traps

- Saving transparent images as JPEG and silently losing the alpha channel.
- Using JPEG for screenshots or UI captures and turning sharp text into mush.
- Shipping a file that matches the requested dimensions but has the wrong aspect ratio or unsafe crop.
- Recompressing the same JPEG multiple times and blaming the tool instead of the workflow.
- Stripping metadata and accidentally breaking orientation, licensing context, or provenance needs.
- Forgetting sRGB and wondering why colors shift between editing tools, browsers, and marketplaces.
- Using SVG where the target platform strips it, rasterizes it badly, or blocks it entirely.
- Assuming AVIF or WebP is safe everywhere when some platforms, email clients, or upload pipelines still normalize back to JPEG or PNG.
- Embedding critical text into images where HTML or native UI text should have carried the meaning.
- Hitting the file-size budget but missing visual quality because the image was resized, cropped, or sharpened badly.
- Rasterizing a logo too early and then fighting blurry exports forever.
- Shipping a screenshot with secrets, personal data, or unstable timestamps still visible.
- Treating alt text, captions, or chart summaries as someone else's problem after the pixels look good.

## Related Skills
Install with `clawhub install <slug>` if user confirms:
- `image-edit` — Masking, cleanup, inpainting, and targeted visual edits.
- `image-generation` — AI image generation and editing across current model providers.
- `photography` — Capture, color, and print-oriented photo workflows.
- `svg` — Vector graphics workflows when raster files are the wrong output.
- `ecommerce` — Marketplace and product-listing requirements that often constrain image delivery.

## Feedback

- If useful: `clawhub star image`
- Stay updated: `clawhub sync`

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

## Modules

### Main Module

```python
class Skill:
    def __init__(self, config):
        self.config = config
        
    def run(self, input_data):
        '''Execute skill with input'''
        return self.process(input_data)
```

### Data Module

```python
class DataHandler:
    def load(self, path):
        '''Load data from file'''
        pass
        
    def save(self, data, path):
        '''Save data to file'''
        pass
```

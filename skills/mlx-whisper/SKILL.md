---
name: mlx-whisper
version: 1.0.0
description: Local speech-to-text with MLX Whisper (Apple Silicon optimized, no API key).
homepage: https://github.com/ml-explore/mlx-examples/tree/main/whisper
metadata: {"clawdbot":{"emoji":"🍎","requires":{"bins":["mlx_whisper"]},"install":[{"id":"pip","kind":"pip","package":"mlx-whisper","bins":["mlx_whisper"],"label":"Install mlx-whisper (pip)"}]}}
---

# MLX Whisper

## Overview

Local speech-to-text with MLX Whisper (Apple Silicon optimized, no API key).

## When to Use

- TODO: add common use cases


Local speech-to-text using Apple MLX, optimized for Apple Silicon Macs.

## Quick Start

```bash
mlx_whisper /path/to/audio.mp3 --model mlx-community/whisper-large-v3-turbo
```

## Common Usage

```bash
# Transcribe to text file
mlx_whisper audio.m4a -f txt -o ./output

# Transcribe with language hint
mlx_whisper audio.mp3 --language en --model mlx-community/whisper-large-v3-turbo

# Generate subtitles (SRT)
mlx_whisper video.mp4 -f srt -o ./subs

# Translate to English
mlx_whisper foreign.mp3 --task translate
```

## Models (download on first use)

| Model | Size | Speed | Quality |
|-------|------|-------|---------|
| mlx-community/whisper-tiny | ~75MB | Fastest | Basic |
| mlx-community/whisper-base | ~140MB | Fast | Good |
| mlx-community/whisper-small | ~470MB | Medium | Better |
| mlx-community/whisper-medium | ~1.5GB | Slower | Great |
| mlx-community/whisper-large-v3 | ~3GB | Slowest | Best |
| mlx-community/whisper-large-v3-turbo | ~1.6GB | Fast | Excellent (Recommended) |

## Notes

- Requires Apple Silicon Mac (M1/M2/M3/M4)
- Models cache to `~/.cache/huggingface/`
- Default model is `mlx-community/whisper-tiny`; use `--model mlx-community/whisper-large-v3-turbo` for best results

## Tools

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

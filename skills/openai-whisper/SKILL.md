---
name: openai-whisper
description: Local speech-to-text with the Whisper CLI (no API key).
homepage: https://openai.com/research/whisper
metadata: {"clawdbot":{"emoji":"🎙️","requires":{"bins":["whisper"]},"install":[{"id":"brew","kind":"brew","formula":"openai-whisper","bins":["whisper"],"label":"Install OpenAI Whisper (brew)"}]}}
---

# Whisper (CLI)

## Overview

Use `whisper` to transcribe audio locally.

## When to Use

- Transcribing audio files to text
- Translating speech to English
- Creating subtitles from audio
- Converting voice notes to text

## Quick start

```bash
# Transcribe to text
whisper /path/audio.mp3 --model medium --output_format txt --output_dir .

# Translate to English
whisper /path/audio.m4a --task translate --output_format srt
```

## Notes

- Models download to `~/.cache/whisper` on first run.
- `--model` defaults to `turbo` on this install.
- Use smaller models for speed, larger for accuracy.

## Tools

### CLI Commands

```bash
# Transcribe audio
whisper /path/to/audio.mp3 --model medium

# Translate to English
whisper /path/to/audio.m4a --task translate

# Specify output format
whisper audio.wav --output_format srt --output_dir ./subtitles
```

### Model Options

- `tiny` - Fastest, lowest accuracy
- `base` - Balanced
- `small` - Better accuracy
- `medium` - High accuracy
- `large` - Best accuracy



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


## Examples

### Basic Example

```bash
# Install
pip install {skill_dir}

# Run
{skill_dir} --help
```

### Advanced Example

```bash
# With options
{skill_dir} run --input "data" --output "result"

# Batch mode
{skill_dir} batch --files "*.txt"
```


## Getting Started

1. Install the skill
2. Configure settings
3. Run your first command
4. Explore advanced features

For more details, see the Examples section above.

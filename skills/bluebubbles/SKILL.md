---
name: bluebubbles
description: Build or update the BlueBubbles external channel plugin for Clawdbot (extension package, REST send/probe, webhook inbound).
---

# BlueBubbles plugin

## Overview

  Use this skill when working on the BlueBubbles channel plugin. 

## When to Use

- iMessage via BlueBubbles

## OVERVIEW_PLACEHOLDER ## Layout
- Extension package: `extensions/bluebubbles/` (entry: `index.ts`).
- Channel implementation: `extensions/bluebubbles/src/channel.ts`.
- Webhook handling: `extensions/bluebubbles/src/monitor.ts` (register via `api.registerHttpHandler`).
- REST helpers: `extensions/bluebubbles/src/send.ts` + `extensions/bluebubbles/src/probe.ts`.
- Runtime bridge: `extensions/bluebubbles/src/runtime.ts` (set via `api.runtime`).
- Catalog entry for onboarding: `src/channels/plugins/catalog.ts`.

## Internal helpers (use these, not raw API calls)
- `probeBlueBubbles` in `extensions/bluebubbles/src/probe.ts` for health checks.
- `sendMessageBlueBubbles` in `extensions/bluebubbles/src/send.ts` for text delivery.
- `resolveChatGuidForTarget` in `extensions/bluebubbles/src/send.ts` for chat lookup.
- `sendBlueBubblesReaction` in `extensions/bluebubbles/src/reactions.ts` for tapbacks.
- `sendBlueBubblesTyping` + `markBlueBubblesChatRead` in `extensions/bluebubbles/src/chat.ts`.
- `downloadBlueBubblesAttachment` in `extensions/bluebubbles/src/attachments.ts` for inbound media.
- `buildBlueBubblesApiUrl` + `blueBubblesFetchWithTimeout` in `extensions/bluebubbles/src/types.ts` for shared REST plumbing.

## Webhooks
- BlueBubbles posts JSON to the gateway HTTP server.
- Normalize sender/chat IDs defensively (payloads vary by version).
- Skip messages marked as from self.
- Route into core reply pipeline via the plugin runtime (`api.runtime`) and `clawdbot/plugin-sdk` helpers.
- For attachments/stickers, use `<media:...>` placeholders when text is empty and attach media paths via `MediaUrl(s)` in the inbound context.

## Config (core)
- `channels.bluebubbles.serverUrl` (base URL), `channels.bluebubbles.password`, `channels.bluebubbles.webhookPath`.
- Action gating: `channels.bluebubbles.actions.reactions` (default true).

## Message tool notes
- **Reactions:** The `react` action requires a `target` (phone number or chat identifier) in addition to `messageId`. Example: `action=react target=+15551234567 messageId=ABC123 emoji=❤️`

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

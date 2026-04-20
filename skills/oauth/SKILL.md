---
name: OAuth
description: Implement OAuth 2.0 and OpenID Connect flows securely.
description_zh: Implement OAuth 2.0 和 OpenID Connect flows securely.。
metadata: {"clawdbot":{"emoji":"🔑","os":["linux","darwin","win32"]}}
---

## Overview


## 中文说明

### 简介

OAuth - Implement OAuth 2.0 and OpenID Connect flows securely.

### 使用方法

此 Skill 已安装到 `/home/node/.openclaw/workspace/skills/oauth/`

1. 查看 SKILL.md 了解详细用法
2. 如有 scripts/run.sh，可直接运行
3. 参照 Examples 章节中的命令进行操作

### 适用场景

- 请参考 ## When to Use 章节
- 如有疑问，请查看 ## Troubleshooting 章节

### 快速开始

```bash
# 查看帮助
cd /home/node/.openclaw/workspace/skills/oauth
cat SKILL.md

# 运行（如有脚本）
./scripts/run.sh
```

### 注意事项

- 请确保已安装所需依赖
- 建议先阅读 ## Setup 或 ## Installation 章节
- 详细配置说明见 ## Configuration 章节

Implement OAuth 2.0 and OpenID Connect flows securely.

## When to Use

- Implementing login/authentication
- Building API authorization
- Service-to-service authentication
- Mobile app authentication

## Flow Selection

```
# Authorization Code + PKCE (recommended for most)
- Web apps, mobile apps, SPAs

# Client Credentials
- Service-to-service only (no user context)

# Device Code
- For devices without browsers (TVs, CLIs)
```

### PKCE (Proof Key for Code Exchange)

```
# 1. Generate code_verifier
code_verifier = random_string(43-128 chars)

# 2. Create code_challenge
code_challenge = BASE64URL(SHA256(code_verifier))

# 3. Exchange code for tokens
POST /token
{
  grant_type: "authorization_code",
  code: "...",
  redirect_uri: "...",
  client_id: "...",
  code_verifier: "..."
}
```

### State Parameter

```
# 1. Generate random state
state = generate_random_string()

# 2. Store in session before redirect

# 3. Verify returned state matches
if (returned_state != stored_state) {
  // CSRF attack - reject
}
```

### Redirect URI Security

```
# Register exact URIs only
- https://app.example.com/callback
- http://localhost:3000/callback (dev only)

# Never use wildcards
- https://*.example.com/callback (DANGEROUS)
```

### Token Security

```
# Access token: short-lived (minutes to hour)
# Refresh token: longer-lived, use only at token endpoint
# ID token (OIDC): JWT with user claims
```

## Original Reference

- Authorization Code + PKCE: use for all clients—web apps, mobile, SPAs
- Client Credentials: service-to-service only—no user context
- Implicit flow: deprecated—don't use; was for SPAs before PKCE existed
- Device Code: for devices without browsers (TVs, CLIs)—user authorizes on separate device

## PKCE (Proof Key for Code Exchange)

- Required for public clients (SPAs, mobile), recommended for all
- Generate `code_verifier`: 43-128 char random string, stored client-side
- Send `code_challenge`: SHA256 hash of verifier, sent with auth request
- Token exchange includes `code_verifier`—server verifies against stored challenge
- Prevents authorization code interception—attacker can't use stolen code without verifier

## State Parameter

- Always include `state` in authorization request—prevents CSRF attacks
- Generate random, unguessable value; store in session before redirect
- Verify returned `state` matches stored value before processing callback
- Can also encode return URL or other context (encrypted or signed)

## Redirect URI Security

- Register exact redirect URIs—no wildcards, no open redirects
- Validate redirect_uri on both authorize and token endpoints
- Use HTTPS always—except localhost for development
- Path matching is exact—`/callback` ≠ `/callback/`

## Tokens

- Access token: short-lived (minutes to hour), used for API access
- Refresh token: longer-lived, used only at token endpoint for new access tokens
- ID token (OIDC): JWT with user identity claims—don't use for API authorization
- Don't send refresh tokens to resource servers—only to authorization server

## Scopes

- Request minimum scopes needed—users trust granular requests more
- Scope format varies: `openid profile email` (OIDC), `repo:read` (GitHub-style)
- Server may grant fewer scopes than requested—check token response
- `openid` scope required for OIDC—triggers ID token issuance

## OpenID Connect

- OIDC = OAuth 2.0 + identity layer—adds ID token and UserInfo endpoint
- ID token is JWT with `sub`, `iss`, `aud`, `exp` + profile claims
- Verify ID token signature before trusting claims
- `nonce` parameter prevents replay attacks—include in auth request, verify in ID token

## Security Checklist

- HTTPS everywhere—tokens in URLs must be protected in transit
- Validate `iss` and `aud` in tokens—prevents token confusion across services
- Bind authorization code to client—code usable only by requesting client
- Short authorization code lifetime (10 min max)—single use
- Implement token revocation for logout/security events

## Common Mistakes

- Using access token as identity proof—use ID token for authentication
- Storing tokens in localStorage—vulnerable to XSS; prefer httpOnly cookies or memory
- Not validating redirect_uri—allows open redirect attacks
- Accepting tokens from URL fragment in backend—fragment never reaches server
- Long-lived access tokens—use short access + refresh pattern

## Token Endpoints

- `/authorize`: user-facing, returns code via redirect
- `/token`: backend-to-backend, exchanges code for tokens; requires client auth for confidential clients
- `/userinfo` (OIDC): returns user profile claims; requires access token
- `/revoke`: invalidates tokens; accepts access or refresh token

## Client Types

- Confidential: can store secrets (backend apps)—uses client_secret
- Public: cannot store secrets (SPAs, mobile)—uses PKCE only
- Never embed client_secret in mobile apps or SPAs—it will be extracted

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

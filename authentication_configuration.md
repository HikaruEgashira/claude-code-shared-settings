# Authentication Configuration

Claude Code offers several authentication methods and configuration options to securely connect to Anthropic's API services.

## Authentication Methods

Claude Code supports two primary authentication methods:

1. **Claude.ai subscription** (`claudeai`): Uses your Claude.ai account subscription
2. **API key** (`console`): Uses API keys from Anthropic Console for direct API access

The authentication method can be controlled with:

```json
{
  "forceLoginMethod": "claudeai" // or "console"
}
```

## API Key Management

When using the API key method, Claude Code needs an Anthropic API key:

### Static API Key

Set the `ANTHROPIC_API_KEY` environment variable:

```bash
export ANTHROPIC_API_KEY="sk-ant-api03-..."
claude
```

Or configure it in settings.json:

```json
{
  "env": {
    "ANTHROPIC_API_KEY": "sk-ant-api03-..."
  }
}
```

### Dynamic API Key Generation

For enhanced security, use the `apiKeyHelper` setting to generate keys dynamically:

```json
{
  "apiKeyHelper": "/path/to/script.sh"
}
```

The script should output a valid API key or auth token. This is useful for:
- Short-lived tokens that expire
- Tokens retrieved from secure vaults
- Organizational authentication systems

Specify how often to refresh tokens with:

```json
{
  "env": {
    "CLAUDE_CODE_API_KEY_HELPER_TTL_MS": "3600000"  // 1 hour
  }
}
```

## Cloud Platform Authentication

### Amazon Bedrock

For Claude via Amazon Bedrock:

```json
{
  "env": {
    "CLAUDE_CODE_USE_BEDROCK": "1",
    "AWS_REGION": "us-west-2"
  }
}
```

AWS credentials are obtained from standard AWS credential sources (environment variables, AWS config files, etc.).

### Google Vertex AI

For Claude via Google Vertex AI:

```json
{
  "env": {
    "CLAUDE_CODE_USE_VERTEX": "1",
    "GOOGLE_CLOUD_PROJECT": "your-project-id"
  }
}
```

Google credentials are obtained from standard Google credential sources (environment variables, gcloud authentication, etc.).

## Custom Headers

Add custom headers for specialized authentication systems:

```json
{
  "env": {
    "ANTHROPIC_CUSTOM_HEADERS": "X-Custom-Auth: value"
  }
}
```

## Corporate Proxies

Configure proxy settings for corporate environments:

```json
{
  "env": {
    "HTTP_PROXY": "http://proxy.example.com:8080",
    "HTTPS_PROXY": "https://proxy.example.com:8443"
  }
}
```

## Security Best Practices

1. **Never commit API keys** to version control
2. Use environment variables or `.claude/settings.local.json` for personal auth
3. Use `apiKeyHelper` for secure, dynamic key generation
4. Rotate API keys regularly
5. Use the most restrictive permissions necessary
6. Consider enterprise managed policies for organizational control
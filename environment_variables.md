# Environment Variables

Environment variables provide a way to configure Claude Code's behavior at runtime. They can be set in your shell or in the `env` section of settings files.

## Core Environment Variables

### Authentication

- `ANTHROPIC_API_KEY`: API key for the Claude SDK
- `ANTHROPIC_AUTH_TOKEN`: Custom value for the Authorization headers (prefixed with `Bearer`)
- `ANTHROPIC_CUSTOM_HEADERS`: Custom headers to add to requests (in `Name: Value` format)

### Model Selection

- `ANTHROPIC_MODEL`: Name of custom model to use
- `ANTHROPIC_SMALL_FAST_MODEL`: Name of Haiku-class model for background tasks

### Bash Tool Configuration

- `BASH_DEFAULT_TIMEOUT_MS`: Default timeout for long-running bash commands
- `BASH_MAX_TIMEOUT_MS`: Maximum timeout the model can set for bash commands
- `BASH_MAX_OUTPUT_LENGTH`: Maximum characters in bash outputs before truncation
- `CLAUDE_BASH_MAINTAIN_PROJECT_WORKING_DIR`: Return to original working directory after each Bash command

### Authentication Helpers

- `CLAUDE_CODE_API_KEY_HELPER_TTL_MS`: Interval for refreshing credentials when using `apiKeyHelper`

### Token and Output Limits

- `CLAUDE_CODE_MAX_OUTPUT_TOKENS`: Maximum number of output tokens for most requests
- `MAX_THINKING_TOKENS`: Force a specific thinking budget for the model
- `MAX_MCP_OUTPUT_TOKENS`: Maximum tokens allowed in MCP tool responses (default: 25000)

### Cloud Platform Integration

- `CLAUDE_CODE_USE_BEDROCK`: Enable Amazon Bedrock integration
- `CLAUDE_CODE_USE_VERTEX`: Enable Google Vertex AI integration
- `CLAUDE_CODE_SKIP_BEDROCK_AUTH`: Skip AWS authentication for Bedrock
- `CLAUDE_CODE_SKIP_VERTEX_AUTH`: Skip Google authentication for Vertex

### Feature Controls

- `CLAUDE_CODE_DISABLE_NONESSENTIAL_TRAFFIC`: Disable all non-essential network traffic
- `DISABLE_AUTOUPDATER`: Disable automatic updates (set to 1)
- `DISABLE_BUG_COMMAND`: Disable the `/bug` command (set to 1)
- `DISABLE_COST_WARNINGS`: Disable cost warning messages (set to 1)
- `DISABLE_ERROR_REPORTING`: Opt out of Sentry error reporting (set to 1)
- `DISABLE_NON_ESSENTIAL_MODEL_CALLS`: Disable model calls for non-critical paths (set to 1)
- `DISABLE_TELEMETRY`: Opt out of Statsig telemetry (set to 1)

### Network Configuration

- `HTTP_PROXY`: Specify HTTP proxy server for network connections
- `HTTPS_PROXY`: Specify HTTPS proxy server for network connections

### MCP (Model Context Protocol)

- `MCP_TIMEOUT`: Timeout in milliseconds for MCP server startup
- `MCP_TOOL_TIMEOUT`: Timeout in milliseconds for MCP tool execution

## Setting Environment Variables

You can set environment variables in multiple ways:

1. In your shell before running Claude Code:
   ```bash
   export ANTHROPIC_MODEL="claude-3-opus-20240229"
   claude
   ```

2. In the `env` section of your settings.json file:
   ```json
   {
     "env": {
       "ANTHROPIC_MODEL": "claude-3-opus-20240229",
       "DISABLE_TELEMETRY": "1"
     }
   }
   ```

3. For a single session when launching Claude Code:
   ```bash
   ANTHROPIC_MODEL="claude-3-opus-20240229" claude
   ```

Environment variables set in settings files will apply consistently across sessions, while those set in your shell apply only to that particular environment.
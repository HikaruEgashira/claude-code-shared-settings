# Performance Settings

Claude Code offers various settings to optimize performance, control resource usage, and manage timeouts.

## Timeout Settings

Control how long Claude Code waits for various operations:

```json
{
  "env": {
    "BASH_DEFAULT_TIMEOUT_MS": "30000",
    "BASH_MAX_TIMEOUT_MS": "120000",
    "MCP_TIMEOUT": "60000",
    "MCP_TOOL_TIMEOUT": "30000",
    "CLAUDE_CODE_API_KEY_HELPER_TTL_MS": "3600000"
  }
}
```

- `BASH_DEFAULT_TIMEOUT_MS`: Default timeout for Bash commands (30 seconds)
- `BASH_MAX_TIMEOUT_MS`: Maximum timeout Claude can set for Bash commands (2 minutes)
- `MCP_TIMEOUT`: Timeout for MCP server startup (1 minute)
- `MCP_TOOL_TIMEOUT`: Timeout for MCP tool execution (30 seconds)
- `CLAUDE_CODE_API_KEY_HELPER_TTL_MS`: How often to refresh credentials (1 hour)

## Token Limits

Control token usage to balance cost and performance:

```json
{
  "env": {
    "CLAUDE_CODE_MAX_OUTPUT_TOKENS": "4000",
    "MAX_THINKING_TOKENS": "3000",
    "MAX_MCP_OUTPUT_TOKENS": "25000"
  }
}
```

- `CLAUDE_CODE_MAX_OUTPUT_TOKENS`: Limits model response length
- `MAX_THINKING_TOKENS`: Controls how much "thinking" the model does
- `MAX_MCP_OUTPUT_TOKENS`: Limits tool response token count

## Output Truncation

Control how Claude Code handles large outputs:

```json
{
  "env": {
    "BASH_MAX_OUTPUT_LENGTH": "10000"
  }
}
```

`BASH_MAX_OUTPUT_LENGTH` sets the character limit for Bash command outputs before they are truncated in the middle.

## Memory Management

### Conversation Retention

Control how long Claude Code retains chat transcripts:

```json
{
  "cleanupPeriodDays": 14
}
```

This sets the retention period to 14 days (default is 30).

### Working Directory Management

Control whether Claude Code maintains the working directory between commands:

```json
{
  "env": {
    "CLAUDE_BASH_MAINTAIN_PROJECT_WORKING_DIR": "1"
  }
}
```

When enabled, Claude Code returns to the original project directory after each Bash command.

## Optimizing for Large Codebases

For large codebases, consider these settings:

```json
{
  "env": {
    "MAX_MCP_OUTPUT_TOKENS": "50000",
    "BASH_MAX_OUTPUT_LENGTH": "20000",
    "MCP_TOOL_TIMEOUT": "60000"
  }
}
```

These settings allow Claude Code to process more information at once, which is helpful for large projects.

## Network Performance

For environments with network constraints:

```json
{
  "env": {
    "DISABLE_AUTOUPDATER": "1",
    "DISABLE_NON_ESSENTIAL_MODEL_CALLS": "1",
    "DISABLE_TELEMETRY": "1",
    "DISABLE_ERROR_REPORTING": "1"
  }
}
```

Or use the all-in-one setting:

```json
{
  "env": {
    "CLAUDE_CODE_DISABLE_NONESSENTIAL_TRAFFIC": "1"
  }
}
```

## Monitoring Performance

Claude Code doesn't have built-in performance monitoring, but you can:

1. Use the `verbose` setting to see detailed operation information
2. Monitor API usage in your Anthropic Console
3. Use system monitoring tools to track resource usage

## Best Practices

1. Increase timeouts for operations that consistently time out
2. Adjust token limits based on the complexity of your tasks
3. Disable non-essential features in bandwidth-constrained environments
4. Use appropriate models for different tasks (Opus for complex work, Haiku for simple tasks)
5. Consider using Claude Code in read-only mode for initial exploration of large codebases
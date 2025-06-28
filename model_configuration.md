# Model Configuration

Claude Code uses different Claude models for various tasks. You can configure which models are used and how they interact with your code.

## Model Selection

By default, Claude Code selects models based on your subscription tier:

- **Pro plan**: Uses Claude Sonnet 4 
- **Max 5x plan**: Access to both Claude Sonnet 4 and Claude Opus 4
- **Max 20x plan**: Extended access to Claude Opus 4

You can override the default model selection with environment variables:

```json
{
  "env": {
    "ANTHROPIC_MODEL": "claude-3-opus-20240229"
  }
}
```

## Model Tiers and Use Cases

Claude Code uses different model tiers for different tasks:

- **Primary model** (Opus or Sonnet): Used for complex reasoning, code generation, and answering queries
- **Background model** (Haiku): Used for lightweight tasks like file indexing and metadata processing

Configure the background model with:

```json
{
  "env": {
    "ANTHROPIC_SMALL_FAST_MODEL": "claude-3-haiku-20240307"
  }
}
```

## Token Limits

Control token usage with these settings:

```json
{
  "env": {
    "CLAUDE_CODE_MAX_OUTPUT_TOKENS": "4000",
    "MAX_THINKING_TOKENS": "3000",
    "MAX_MCP_OUTPUT_TOKENS": "25000"
  }
}
```

- `CLAUDE_CODE_MAX_OUTPUT_TOKENS`: Maximum output tokens for most requests
- `MAX_THINKING_TOKENS`: Forces a specific thinking budget for the model
- `MAX_MCP_OUTPUT_TOKENS`: Maximum tokens allowed in MCP tool responses

## Cloud Platform Models

When using Claude through cloud platforms, specify the model path:

### Amazon Bedrock

```json
{
  "env": {
    "CLAUDE_CODE_USE_BEDROCK": "1",
    "ANTHROPIC_MODEL": "anthropic.claude-3-opus-20240229"
  }
}
```

### Google Vertex AI

```json
{
  "env": {
    "CLAUDE_CODE_USE_VERTEX": "1",
    "ANTHROPIC_MODEL": "publishers/anthropic/models/claude-3-opus-20240229"
  }
}
```

## Model Cost Management

Different models have different pricing structures. The environment variable `DISABLE_COST_WARNINGS` can control whether Claude Code displays cost warnings:

```json
{
  "env": {
    "DISABLE_COST_WARNINGS": "0"  // Enable cost warnings (default)
  }
}
```

## Custom Endpoint Configuration

For specialized deployments, you can configure custom endpoints:

```json
{
  "env": {
    "ANTHROPIC_API_URL": "https://custom-endpoint.example.com/v1"
  }
}
```

## Performance Considerations

- **Claude Opus 4**: Highest reasoning capability, best for complex codebases and deep understanding
- **Claude Sonnet 4**: Good balance of capability and speed, suitable for most coding tasks
- **Claude Haiku 3.5**: Fastest, used for background tasks and simple operations

## Best Practices

1. Use the appropriate model tier for your task complexity
2. Monitor token usage to control costs
3. Set reasonable token limits based on your use case
4. Consider network latency when using cloud platform models
5. For large codebases, increase `MAX_MCP_OUTPUT_TOKENS` to allow for more context
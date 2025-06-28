# Tool Configuration

Claude Code provides a variety of tools to help understand and modify your codebase. Each tool can be configured to control its behavior and permissions.

## Available Tools

Claude Code includes the following tools:

| Tool | Description | Permission Required |
|------|-------------|---------------------|
| Agent | Runs a sub-agent to handle complex, multi-step tasks | No |
| Bash | Executes shell commands in your environment | Yes |
| Edit | Makes targeted edits to specific files | Yes |
| Glob | Finds files based on pattern matching | No |
| Grep | Searches for patterns in file contents | No |
| LS | Lists files and directories | No |
| MultiEdit | Performs multiple edits on a single file atomically | Yes |
| NotebookEdit | Modifies Jupyter notebook cells | Yes |
| NotebookRead | Reads and displays Jupyter notebook contents | No |
| Read | Reads the contents of files | No |
| TodoRead | Reads the current session's task list | No |
| TodoWrite | Creates and manages structured task lists | No |
| WebFetch | Fetches content from a specified URL | Yes |
| WebSearch | Performs web searches with domain filtering | Yes |
| Write | Creates or overwrites files | Yes |

## Bash Tool Configuration

The Bash tool executes shell commands and can be configured with:

```json
{
  "env": {
    "BASH_DEFAULT_TIMEOUT_MS": "30000",
    "BASH_MAX_TIMEOUT_MS": "120000",
    "BASH_MAX_OUTPUT_LENGTH": "10000",
    "CLAUDE_BASH_MAINTAIN_PROJECT_WORKING_DIR": "1"
  }
}
```

- `BASH_DEFAULT_TIMEOUT_MS`: Default timeout for commands (30 seconds)
- `BASH_MAX_TIMEOUT_MS`: Maximum timeout Claude can set (2 minutes)
- `BASH_MAX_OUTPUT_LENGTH`: Maximum output length before truncation
- `CLAUDE_BASH_MAINTAIN_PROJECT_WORKING_DIR`: Return to original directory after each command

## Web Tool Configuration

The WebFetch and WebSearch tools interact with the internet:

```json
{
  "permissions": {
    "allow": [
      "WebFetch(https://docs.anthropic.com/*)",
      "WebSearch(domain:stackoverflow.com)"
    ],
    "deny": [
      "WebFetch(https://internal-docs.company.com/*)"
    ]
  }
}
```

## File Manipulation Tool Configuration

File tools (Read, Write, Edit, MultiEdit) can be configured with:

```json
{
  "permissions": {
    "additionalDirectories": [
      "../shared-libs/",
      "~/common-utils/"
    ]
  }
}
```

The `additionalDirectories` setting allows Claude Code to access files outside the current project directory.

## Tool Permission Rules

Permission rules follow this pattern:

```
ToolName(parameter:specification)
```

Examples:
- `Bash(git:*)`: All git commands
- `Bash(npm run *)`: Any npm run command
- `WebFetch(https://github.com/*)`: Fetch from GitHub
- `Read(~/.gitconfig)`: Read a specific file

## Tool Usage and Memory

Tools like Agent, TodoRead, and TodoWrite help Claude Code maintain context and manage complex tasks:

```json
{
  "env": {
    "MAX_MCP_OUTPUT_TOKENS": "50000"
  }
}
```

Increasing `MAX_MCP_OUTPUT_TOKENS` allows tools to return more detailed information, especially for complex codebases.

## Tool Configuration Best Practices

1. Start with minimal permissions and add as needed
2. Use pattern matching to scope permissions appropriately
3. Configure timeouts based on your environment's performance
4. Use `additionalDirectories` carefully to limit filesystem access
5. Disable tools you don't need with explicit deny rules
6. Document tool configurations for team consistency
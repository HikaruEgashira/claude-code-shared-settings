# Settings Files

Settings files are the primary mechanism for configuring Claude Code. They follow a hierarchical structure with different levels of precedence.

## Overview

Claude Code uses JSON-based settings files to control its behavior. These files can be placed at different levels to apply settings globally, per-project, or enterprise-wide.

## Hierarchy and Precedence

Settings are applied in order of precedence (highest to lowest):

1. Enterprise policies (managed settings)
2. Command line arguments
3. Local project settings
4. Shared project settings
5. User settings

## File Locations

- **User settings**: `~/.claude/settings.json` - Apply to all projects
- **Project settings**:
  - `.claude/settings.json` - Shared with team (checked into source control)
  - `.claude/settings.local.json` - Personal settings (not checked into source control)
- **Enterprise managed policy settings**:
  - macOS: `/Library/Application Support/ClaudeCode/managed-settings.json`
  - Linux/Windows: `/etc/claude-code/managed-settings.json`

## File Structure

Settings files use a JSON format with specific keys for different setting categories:

```json
{
  "permissions": {
    "allow": [
      "Bash(npm run lint)",
      "Bash(npm run test:*)",
      "Read(~/.zshrc)"
    ],
    "deny": [
      "Bash(curl:*)"
    ]
  },
  "env": {
    "CLAUDE_CODE_ENABLE_TELEMETRY": "1",
    "OTEL_METRICS_EXPORTER": "otlp"
  }
}
```

## Common Settings

- `apiKeyHelper`: Custom script to generate authentication values
- `cleanupPeriodDays`: How long to retain chat transcripts (default: 30 days)
- `env`: Environment variables applied to every session
- `includeCoAuthoredBy`: Whether to include Claude byline in git commits
- `permissions`: Access control settings

## Configuration Management

You can manage settings files directly by editing them, or use the `claude config` commands:

- List settings: `claude config list`
- Get a setting: `claude config get <key>`
- Change a setting: `claude config set <key> <value>`
- Add to a list setting: `claude config add <key> <value>`
- Remove from a list setting: `claude config remove <key> <value>`

Add the `-g` or `--global` flag to manage global settings.
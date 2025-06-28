# Command Line Configuration

Claude Code offers command-line options and an interactive configuration interface for managing settings.

## Command Line Arguments

When launching Claude Code, you can use command-line arguments to configure its behavior:

```bash
claude --help
claude --version
claude --no-auto-update
claude --verbose
```

## Configuration Commands

The `claude config` command provides a way to manage configuration settings from the terminal:

```bash
# List all configuration settings
claude config list

# See a specific setting
claude config get theme

# Change a setting
claude config set theme dark

# Add to a list setting
claude config add permissions.allow "Bash(npm run test)"

# Remove from a list setting
claude config remove permissions.deny "WebFetch"
```

By default, these commands modify project settings. To manage global settings instead, add the `--global` (or `-g`) flag:

```bash
claude config set --global theme light
```

## Interactive Configuration

When using Claude Code in interactive mode, you can use slash commands to configure settings:

- `/config`: View and modify configuration settings
- `/permissions`: Switch between permission modes
- `/allowed-tools`: List and manage tool permissions
- `/add-permission <rule>`: Add a new permission rule
- `/remove-permission <rule>`: Remove a permission rule

## Configuration Scope

Claude Code configurations are applied at different scopes:

- **Project scope**: Settings apply to the current project
- **Global scope**: Settings apply to all projects
- **Session scope**: Settings apply only to the current session

## Configuration File Management

Command line operations modify the appropriate settings files:

- Project commands modify `.claude/settings.json` or `.claude/settings.local.json`
- Global commands modify `~/.claude/settings.json`

## Configuration Best Practices

1. Use project-specific settings for team-shared configurations
2. Use global settings for personal preferences
3. Use command-line arguments for one-off sessions
4. Document critical configurations in version control
5. Review permissions regularly for security

## Examples

```bash
# Configure a secure project environment
claude config set permissions.deny "Bash(curl:*)"
claude config set permissions.deny "Bash(wget:*)"
claude config set permissions.defaultMode "readOnly"

# Configure for high performance
claude config set -g env.CLAUDE_CODE_MAX_OUTPUT_TOKENS "4000"
claude config set -g env.MAX_THINKING_TOKENS "3000"

# Configure for a specific model
claude config set env.ANTHROPIC_MODEL "claude-opus-4-20250514"
```

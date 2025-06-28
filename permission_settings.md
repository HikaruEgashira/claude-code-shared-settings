# Permission Settings

Permission settings control what actions Claude Code can perform in your environment, balancing functionality with security.

## Permission Modes

Claude Code supports different permission modes that control its capabilities:

- `allowEdits`: Allows Claude Code to modify files and execute commands (default)
- `readOnly`: Restricts Claude Code to read-only operations
- `bypassPermissions`: Allows Claude Code to bypass regular permission checks (requires explicit activation)

## Permission Configuration

Permissions are configured in the `permissions` section of settings files:

```json
{
  "permissions": {
    "allow": [
      "Bash(npm run lint)",
      "Bash(npm run test:*)",
      "Read(~/.zshrc)"
    ],
    "deny": [
      "Bash(curl:*)",
      "WebFetch"
    ],
    "additionalDirectories": [
      "../docs/"
    ],
    "defaultMode": "allowEdits",
    "disableBypassPermissionsMode": "disable"
  }
}
```

## Permission Settings Options

- `allow`: Array of permission rules to allow tool use
- `deny`: Array of permission rules to deny tool use
- `additionalDirectories`: Additional working directories Claude has access to
- `defaultMode`: Default permission mode when opening Claude Code
- `disableBypassPermissionsMode`: Set to "disable" to prevent bypass mode

## Permission Rules

Permission rules control access to specific tools and operations:

### Tool Permissions

Rules can be specified for the following tools:

- `Bash`: Execute shell commands
- `Edit`: Make targeted edits to files
- `MultiEdit`: Perform multiple edits atomically
- `NotebookEdit`: Modify Jupyter notebook cells
- `WebFetch`: Fetch content from URLs
- `WebSearch`: Perform web searches
- `Write`: Create or overwrite files

### Pattern Matching

Permission rules support pattern matching:

- Exact match: `Bash(git status)`
- Wildcard match: `Bash(git *)`
- Namespace: `Bash(git:*)` matches all git commands

### Working Directories

By default, Claude Code only has access to the current working directory. Additional directories can be specified in `additionalDirectories`.

## Managing Permissions

Permissions can be managed through:

1. Settings files (as shown above)
2. Interactive commands:
   - `/allowed-tools`: List allowed tools
   - `/permissions`: Switch between permission modes
   - `/add-permission <rule>`: Add a new permission rule
   - `/remove-permission <rule>`: Remove a permission rule

## Security Considerations

- Deny rules take precedence over allow rules
- Enterprise managed policies can enforce organization-wide permissions
- Permission changes require explicit user confirmation
- Access to sensitive commands should be carefully controlled
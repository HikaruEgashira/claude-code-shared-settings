# Enterprise Managed Policies

Enterprise managed policies provide a way for organizations to enforce consistent Claude Code settings across all users.

## Overview

Enterprise managed policies are settings files deployed by system administrators that take precedence over user and project settings. They allow organizations to enforce security policies, authentication methods, and other configuration requirements.

## Policy File Locations

Enterprise managed policy files are located at:

- macOS: `/Library/Application Support/ClaudeCode/managed-settings.json`
- Linux and Windows (WSL): `/etc/claude-code/managed-settings.json`

## Policy Structure

Enterprise policy files use the same JSON structure as regular settings files:

```json
{
  "permissions": {
    "allow": [
      "Bash(git:*)",
      "Bash(npm:*)"
    ],
    "deny": [
      "Bash(curl:*)",
      "Bash(wget:*)",
      "WebFetch"
    ],
    "disableBypassPermissionsMode": "disable"
  },
  "forceLoginMethod": "console",
  "env": {
    "CLAUDE_CODE_USE_BEDROCK": "1",
    "DISABLE_TELEMETRY": "1"
  }
}
```

## Common Enterprise Policies

### Security Policies

- `permissions.deny`: Block potentially dangerous commands
- `permissions.disableBypassPermissionsMode`: Prevent users from bypassing permissions
- `additionalDirectories`: Restrict access to specific directories

### Authentication Policies

- `forceLoginMethod`: Enforce a specific login method (`claudeai` or `console`)
- `apiKeyHelper`: Specify a custom script for authentication

### Compliance Policies

- `env.DISABLE_TELEMETRY`: Disable telemetry collection
- `env.DISABLE_ERROR_REPORTING`: Disable error reporting
- `cleanupPeriodDays`: Control data retention period

### Integration Policies

- `env.CLAUDE_CODE_USE_BEDROCK`: Force Amazon Bedrock integration
- `env.CLAUDE_CODE_USE_VERTEX`: Force Google Vertex AI integration

## Policy Enforcement

Enterprise policies have the highest precedence in the settings hierarchy:

1. Enterprise policies (highest priority)
2. Command line arguments
3. Local project settings
4. Shared project settings
5. User settings (lowest priority)

Users cannot override settings defined in enterprise policies.

## Deployment Strategies

### Manual Deployment

Manually create and update the policy file on each user's machine.

### Automated Deployment

Use systems management tools to deploy and update policies:

- **macOS**: Use MDM solutions like Jamf Pro
- **Windows**: Use Group Policy or SCCM
- **Linux**: Use configuration management tools like Ansible or Puppet

### Containerized Environments

For development containers, mount policy files from the host or include them in the container image.

## Policy Testing and Validation

Before widespread deployment, test policies:

1. Create a policy file with desired settings
2. Apply to a test group of users
3. Verify policy enforcement with `claude config list`
4. Confirm users cannot override managed settings

## Best Practices

1. Document policies clearly for users
2. Start with minimal restrictions and add as needed
3. Consider development workflow impacts
4. Provide guidance for requesting policy exceptions
5. Review and update policies regularly
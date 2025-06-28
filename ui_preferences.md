# UI Preferences

Claude Code's user interface can be customized through various settings to match your preferences and workflow.

## Theme Settings

Change the appearance of Claude Code with the theme setting:

```bash
claude config set -g theme dark
```

Available themes:
- `dark`: Default dark theme
- `light`: Light theme
- `dark-daltonized`: Dark theme with colorblind-friendly colors
- `light-daltonized`: Light theme with colorblind-friendly colors

## Notification Settings

Control how Claude Code notifies you with the `preferredNotifChannel` setting:

```bash
claude config set -g preferredNotifChannel iterm2_with_bell
```

Available notification channels:
- `iterm2`: Visual notifications in iTerm2 (default)
- `iterm2_with_bell`: Visual notifications with sound in iTerm2
- `terminal_bell`: Terminal bell sound only
- `notifications_disabled`: Disable all notifications

## Verbosity Settings

Control the amount of information displayed with the `verbose` setting:

```bash
claude config set -g verbose true
```

When enabled, Claude Code will:
- Show full bash command outputs
- Display more detailed information about operations
- Include debug information in error messages

## Interactive Mode Customization

When using Claude Code in interactive mode, you can customize:

### Prompt Display

The prompt display in interactive mode can be customized with environment variables:

```json
{
  "env": {
    "DISABLE_NON_ESSENTIAL_MODEL_CALLS": "1"
  }
}
```

This disables flavor text and other non-essential model interactions.

### Command History

Command history is stored by default and can be navigated using arrow keys. This behavior follows standard terminal conventions.

## Auto-update Settings

Control automatic updates with the `autoUpdates` setting:

```bash
claude config set -g autoUpdates false
```

You can also disable auto-updates with an environment variable:

```json
{
  "env": {
    "DISABLE_AUTOUPDATER": "1"
  }
}
```

## Session Persistence

Control how long Claude Code retains session data with the `cleanupPeriodDays` setting:

```json
{
  "cleanupPeriodDays": 14
}
```

This sets the retention period for chat transcripts to 14 days (default is 30).

## Git Integration UI

Customize how Claude Code integrates with git:

```json
{
  "includeCoAuthoredBy": false
}
```

When `includeCoAuthoredBy` is `false`, Claude Code will not add the "Co-authored-by: Claude" line to git commits and pull requests.

## Best Practices

1. Set themes according to your lighting conditions and preferences
2. Consider using `verbose` mode when debugging issues
3. Use daltonized themes if you have color vision deficiencies
4. Disable notifications in shared environments if they might disturb others
5. Adjust cleanup periods based on privacy requirements and disk space
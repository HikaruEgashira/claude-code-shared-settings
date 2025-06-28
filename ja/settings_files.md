# 設定ファイル

設定ファイルは、Claude Codeを設定するための主要な仕組みです。異なる優先順位レベルでの階層構造に従います。

## 概要

Claude CodeはJSON形式の設定ファイルを使用してその動作を制御します。これらのファイルは、グローバル、プロジェクトごと、または企業全体に設定を適用するために、異なるレベルに配置できます。

## 階層と優先順位

設定は優先順位の順序で適用されます（高い順）：

1. エンタープライズポリシー（管理設定）
2. コマンドライン引数
3. ローカルプロジェクト設定
4. 共有プロジェクト設定
5. ユーザー設定

## ファイルの場所

- **ユーザー設定**: `~/.claude/settings.json` - すべてのプロジェクトに適用
- **プロジェクト設定**:
  - `.claude/settings.json` - チームと共有（ソース管理にチェックイン）
  - `.claude/settings.local.json` - 個人設定（ソース管理にチェックインしない）
- **エンタープライズ管理ポリシー設定**:
  - macOS: `/Library/Application Support/ClaudeCode/managed-settings.json`
  - Linux/Windows: `/etc/claude-code/managed-settings.json`

## ファイル構造

設定ファイルは、異なる設定カテゴリに対して特定のキーを持つJSON形式を使用します：

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

## 一般的な設定

- `apiKeyHelper`: 認証値を生成するカスタムスクリプト
- `cleanupPeriodDays`: チャット記録を保持する期間（デフォルト：30日）
- `env`: すべてのセッションに適用される環境変数
- `includeCoAuthoredBy`: gitコミットにClaudeのバイラインを含めるかどうか
- `permissions`: アクセス制御設定

## 設定管理

設定ファイルを直接編集して管理するか、`claude config`コマンドを使用できます：

- 設定一覧表示: `claude config list`
- 設定取得: `claude config get <key>`
- 設定変更: `claude config set <key> <value>`
- リスト設定に追加: `claude config add <key> <value>`
- リスト設定から削除: `claude config remove <key> <value>`

グローバル設定を管理するには`-g`または`--global`フラグを追加します。
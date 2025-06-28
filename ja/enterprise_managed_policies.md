# エンタープライズ管理ポリシー

エンタープライズ管理ポリシーは、組織がすべてのユーザーに対して一貫したClaude Code設定を強制する方法を提供します。

## 概要

エンタープライズ管理ポリシーは、ユーザーおよびプロジェクト設定より優先される、システム管理者によってデプロイされる設定ファイルです。組織がセキュリティポリシー、認証方法、その他の設定要件を強制することを可能にします。

## ポリシーファイルの場所

エンタープライズ管理ポリシーファイルの場所：

- macOS: `/Library/Application Support/ClaudeCode/managed-settings.json`
- LinuxおよびWindows（WSL）: `/etc/claude-code/managed-settings.json`

## ポリシー構造

エンタープライズポリシーファイルは、通常の設定ファイルと同じJSON構造を使用します：

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

## 一般的なエンタープライズポリシー

### セキュリティポリシー

- `permissions.deny`: 潜在的に危険なコマンドをブロック
- `permissions.disableBypassPermissionsMode`: ユーザーが権限をバイパスすることを防ぐ
- `additionalDirectories`: 特定のディレクトリへのアクセスを制限

### 認証ポリシー

- `forceLoginMethod`: 特定のログイン方法を強制（`claudeai`または`console`）
- `apiKeyHelper`: 認証用のカスタムスクリプトを指定

### コンプライアンスポリシー

- `env.DISABLE_TELEMETRY`: テレメトリ収集を無効化
- `env.DISABLE_ERROR_REPORTING`: エラーレポートを無効化
- `cleanupPeriodDays`: データ保持期間を制御

### 統合ポリシー

- `env.CLAUDE_CODE_USE_BEDROCK`: Amazon Bedrock統合を強制
- `env.CLAUDE_CODE_USE_VERTEX`: Google Vertex AI統合を強制

## ポリシー強制

エンタープライズポリシーは設定階層で最高の優先順位を持ちます：

1. エンタープライズポリシー（最高優先度）
2. コマンドライン引数
3. ローカルプロジェクト設定
4. 共有プロジェクト設定
5. ユーザー設定（最低優先度）

ユーザーはエンタープライズポリシーで定義された設定を上書きできません。

## デプロイメント戦略

### 手動デプロイメント

各ユーザーのマシンでポリシーファイルを手動で作成・更新。

### 自動デプロイメント

システム管理ツールを使用してポリシーをデプロイ・更新：

- **macOS**: Jamf ProなどのMDMソリューションを使用
- **Windows**: グループポリシーまたはSCCMを使用
- **Linux**: AnsibleやPuppetなどの構成管理ツールを使用

### コンテナ化環境

開発コンテナでは、ホストからポリシーファイルをマウントするか、コンテナイメージに含める。

## ポリシーテストと検証

広範囲なデプロイメント前にポリシーをテスト：

1. 希望する設定でポリシーファイルを作成
2. テストユーザーグループに適用
3. `claude config list`でポリシー強制を確認
4. ユーザーが管理設定を上書きできないことを確認

## ベストプラクティス

1. ユーザーに対してポリシーを明確に文書化
2. 最小限の制限から始めて必要に応じて追加
3. 開発ワークフローへの影響を考慮
4. ポリシー例外を要求するためのガイダンスを提供
5. ポリシーを定期的に確認・更新
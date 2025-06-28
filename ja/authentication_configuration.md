# 認証設定

Claude Codeは、Anthropic APIサービスに安全に接続するための複数の認証方法と設定オプションを提供します。

## 認証方法

Claude Codeは2つの主要な認証方法をサポートします：

1. **Claude.aiサブスクリプション**（`claudeai`）: Claude.aiアカウントサブスクリプションを使用
2. **APIキー**（`console`）: 直接API アクセス用のAnthropic ConsoleのAPIキーを使用

認証方法は以下で制御できます：

```json
{
  "forceLoginMethod": "claudeai" // または "console"
}
```

## APIキー管理

APIキー方法を使用する場合、Claude CodeにはAnthropic APIキーが必要です：

### 静的APIキー

`ANTHROPIC_API_KEY`環境変数を設定：

```bash
export ANTHROPIC_API_KEY="sk-ant-api03-..."
claude
```

または、settings.jsonで設定：

```json
{
  "env": {
    "ANTHROPIC_API_KEY": "sk-ant-api03-..."
  }
}
```

### 動的APIキー生成

セキュリティを強化するため、`apiKeyHelper`設定を使用してキーを動的に生成：

```json
{
  "apiKeyHelper": "/path/to/script.sh"
}
```

スクリプトは有効なAPIキーまたは認証トークンを出力する必要があります。これは以下に有用です：
- 期限切れになる短期間トークン
- セキュアボルトから取得されるトークン
- 組織認証システム

トークンの更新頻度を指定：

```json
{
  "env": {
    "CLAUDE_CODE_API_KEY_HELPER_TTL_MS": "3600000"  // 1時間
  }
}
```

## クラウドプラットフォーム認証

### Amazon Bedrock

Amazon Bedrock経由でClaudeを使用する場合：

```json
{
  "env": {
    "CLAUDE_CODE_USE_BEDROCK": "1",
    "AWS_REGION": "us-west-2"
  }
}
```

AWS認証情報は標準のAWS認証情報ソース（環境変数、AWS設定ファイルなど）から取得されます。

### Google Vertex AI

Google Vertex AI経由でClaudeを使用する場合：

```json
{
  "env": {
    "CLAUDE_CODE_USE_VERTEX": "1",
    "GOOGLE_CLOUD_PROJECT": "your-project-id"
  }
}
```

Google認証情報は標準のGoogle認証情報ソース（環境変数、gcloud認証など）から取得されます。

## カスタムヘッダー

特殊な認証システム用のカスタムヘッダーを追加：

```json
{
  "env": {
    "ANTHROPIC_CUSTOM_HEADERS": "X-Custom-Auth: value"
  }
}
```

## 企業プロキシ

企業環境用のプロキシ設定を構成：

```json
{
  "env": {
    "HTTP_PROXY": "http://proxy.example.com:8080",
    "HTTPS_PROXY": "https://proxy.example.com:8443"
  }
}
```

## セキュリティベストプラクティス

1. **APIキーをバージョン管理にコミットしない**
2. 個人認証には環境変数または`.claude/settings.local.json`を使用
3. セキュアで動的なキー生成には`apiKeyHelper`を使用
4. APIキーを定期的にローテート
5. 必要最小限の権限を使用
6. 組織制御にはエンタープライズ管理ポリシーを検討
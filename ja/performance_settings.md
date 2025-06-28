# パフォーマンス設定

Claude Codeは、パフォーマンスを最適化し、リソース使用量を制御し、タイムアウトを管理するための様々な設定を提供します。

## タイムアウト設定

Claude Codeが様々な操作を待つ時間を制御：

```json
{
  "env": {
    "BASH_DEFAULT_TIMEOUT_MS": "30000",
    "BASH_MAX_TIMEOUT_MS": "120000",
    "MCP_TIMEOUT": "60000",
    "MCP_TOOL_TIMEOUT": "30000",
    "CLAUDE_CODE_API_KEY_HELPER_TTL_MS": "3600000"
  }
}
```

- `BASH_DEFAULT_TIMEOUT_MS`: Bashコマンドのデフォルトタイムアウト（30秒）
- `BASH_MAX_TIMEOUT_MS`: Claudeがbashコマンドに設定できる最大タイムアウト（2分）
- `MCP_TIMEOUT`: MCPサーバー起動のタイムアウト（1分）
- `MCP_TOOL_TIMEOUT`: MCPツール実行のタイムアウト（30秒）
- `CLAUDE_CODE_API_KEY_HELPER_TTL_MS`: 認証情報を更新する頻度（1時間）

## トークン制限

コストとパフォーマンスのバランスを取るためトークン使用量を制御：

```json
{
  "env": {
    "CLAUDE_CODE_MAX_OUTPUT_TOKENS": "4000",
    "MAX_THINKING_TOKENS": "3000",
    "MAX_MCP_OUTPUT_TOKENS": "25000"
  }
}
```

- `CLAUDE_CODE_MAX_OUTPUT_TOKENS`: モデルレスポンス長を制限
- `MAX_THINKING_TOKENS`: モデルの「思考」量を制御
- `MAX_MCP_OUTPUT_TOKENS`: ツールレスポンストークン数を制限

## 出力切り捨て

Claude Codeが大きな出力を処理する方法を制御：

```json
{
  "env": {
    "BASH_MAX_OUTPUT_LENGTH": "10000"
  }
}
```

`BASH_MAX_OUTPUT_LENGTH`は、Bashコマンド出力が中央で切り捨てられる前の文字制限を設定します。

## メモリ管理

### 会話保持

Claude Codeがチャット記録を保持する期間を制御：

```json
{
  "cleanupPeriodDays": 14
}
```

これにより保持期間が14日に設定されます（デフォルトは30日）。

### 作業ディレクトリ管理

Claude Codeがコマンド間で作業ディレクトリを維持するかどうかを制御：

```json
{
  "env": {
    "CLAUDE_BASH_MAINTAIN_PROJECT_WORKING_DIR": "1"
  }
}
```

有効にすると、Claude Codeは各Bashコマンド後に元のプロジェクトディレクトリに戻ります。

## 大きなコードベースの最適化

大きなコードベースでは、これらの設定を検討：

```json
{
  "env": {
    "MAX_MCP_OUTPUT_TOKENS": "50000",
    "BASH_MAX_OUTPUT_LENGTH": "20000",
    "MCP_TOOL_TIMEOUT": "60000"
  }
}
```

これらの設定により、Claude Codeは一度により多くの情報を処理できるようになり、大きなプロジェクトに有用です。

## ネットワークパフォーマンス

ネットワーク制約のある環境では：

```json
{
  "env": {
    "DISABLE_AUTOUPDATER": "1",
    "DISABLE_NON_ESSENTIAL_MODEL_CALLS": "1",
    "DISABLE_TELEMETRY": "1",
    "DISABLE_ERROR_REPORTING": "1"
  }
}
```

または、オールインワン設定を使用：

```json
{
  "env": {
    "CLAUDE_CODE_DISABLE_NONESSENTIAL_TRAFFIC": "1"
  }
}
```

## パフォーマンス監視

Claude Codeには組み込みのパフォーマンス監視機能はありませんが、以下が可能です：

1. `verbose`設定を使用して詳細な操作情報を確認
2. Anthropic ConsoleでAPI使用量を監視
3. システム監視ツールを使用してリソース使用量を追跡

## ベストプラクティス

1. 一貫してタイムアウトする操作についてはタイムアウトを増やす
2. タスクの複雑さに基づいてトークン制限を調整
3. 帯域幅制約のある環境では非必須機能を無効化
4. 異なるタスクに適切なモデルを使用（複雑な作業にはOpus、簡単なタスクにはHaiku）
5. 大きなコードベースの初期探索では読み取り専用モードでのClaude Code使用を検討
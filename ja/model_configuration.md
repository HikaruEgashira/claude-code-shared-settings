# モデル設定

Claude Codeは様々なタスクに対して異なるClaudeモデルを使用します。どのモデルを使用し、どのようにコードと相互作用するかを設定できます。

## モデル選択

デフォルトでは、Claude Codeはサブスクリプション層に基づいてモデルを選択します：

- **Proプラン**: Claude Sonnet 4を使用
- **Max 5xプラン**: Claude Sonnet 4とClaude Opus 4の両方にアクセス
- **Max 20xプラン**: Claude Opus 4への拡張アクセス

環境変数でデフォルトのモデル選択を上書きできます：

```json
{
  "env": {
    "ANTHROPIC_MODEL": "claude-3-opus-20240229"
  }
}
```

## モデル階層と使用例

Claude Codeは異なるタスクに対して異なるモデル階層を使用します：

- **プライマリモデル**（OpusまたはSonnet）: 複雑な推論、コード生成、クエリへの回答に使用
- **バックグラウンドモデル**（Haiku）: ファイルインデックス化やメタデータ処理などの軽量タスクに使用

バックグラウンドモデルを設定：

```json
{
  "env": {
    "ANTHROPIC_SMALL_FAST_MODEL": "claude-3-haiku-20240307"
  }
}
```

## トークン制限

これらの設定でトークン使用量を制御：

```json
{
  "env": {
    "CLAUDE_CODE_MAX_OUTPUT_TOKENS": "4000",
    "MAX_THINKING_TOKENS": "3000",
    "MAX_MCP_OUTPUT_TOKENS": "25000"
  }
}
```

- `CLAUDE_CODE_MAX_OUTPUT_TOKENS`: ほとんどのリクエストの最大出力トークン数
- `MAX_THINKING_TOKENS`: モデルの特定の思考バジェットを強制
- `MAX_MCP_OUTPUT_TOKENS`: MCPツールレスポンスで許可される最大トークン数

## クラウドプラットフォームモデル

クラウドプラットフォーム経由でClaudeを使用する場合、モデルパスを指定：

### Amazon Bedrock

```json
{
  "env": {
    "CLAUDE_CODE_USE_BEDROCK": "1",
    "ANTHROPIC_MODEL": "anthropic.claude-3-opus-20240229"
  }
}
```

### Google Vertex AI

```json
{
  "env": {
    "CLAUDE_CODE_USE_VERTEX": "1",
    "ANTHROPIC_MODEL": "publishers/anthropic/models/claude-3-opus-20240229"
  }
}
```

## モデルコスト管理

異なるモデルには異なる価格構造があります。環境変数`DISABLE_COST_WARNINGS`でClaude Codeがコスト警告を表示するかどうかを制御できます：

```json
{
  "env": {
    "DISABLE_COST_WARNINGS": "0"  // コスト警告を有効化（デフォルト）
  }
}
```

## カスタムエンドポイント設定

特殊なデプロイメント用にカスタムエンドポイントを設定：

```json
{
  "env": {
    "ANTHROPIC_API_URL": "https://custom-endpoint.example.com/v1"
  }
}
```

## パフォーマンス考慮事項

- **Claude Opus 4**: 最高の推論能力、複雑なコードベースと深い理解に最適
- **Claude Sonnet 4**: 能力と速度の良いバランス、ほとんどのコーディングタスクに適している
- **Claude Haiku 3.5**: 最速、バックグラウンドタスクと簡単な操作に使用

## ベストプラクティス

1. タスクの複雑さに応じて適切なモデル階層を使用
2. コストを制御するためトークン使用量を監視
3. 使用例に基づいて合理的なトークン制限を設定
4. クラウドプラットフォームモデル使用時はネットワーク遅延を考慮
5. 大きなコードベースでは、より多くのコンテキストを許可するため`MAX_MCP_OUTPUT_TOKENS`を増やす
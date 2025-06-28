# 環境変数

環境変数は、実行時にClaude Codeの動作を設定する方法を提供します。シェルまたは設定ファイルの`env`セクションで設定できます。

## 主要な環境変数

### 認証

- `ANTHROPIC_API_KEY`: Claude SDK用のAPIキー
- `ANTHROPIC_AUTH_TOKEN`: Authorizationヘッダー用のカスタム値（`Bearer`プレフィックス付き）
- `ANTHROPIC_CUSTOM_HEADERS`: リクエストに追加するカスタムヘッダー（`Name: Value`形式）

### モデル選択

- `ANTHROPIC_MODEL`: 使用するカスタムモデルの名前
- `ANTHROPIC_SMALL_FAST_MODEL`: バックグラウンドタスク用のHaikuクラスモデルの名前

### Bashツール設定

- `BASH_DEFAULT_TIMEOUT_MS`: 長時間実行bashコマンドのデフォルトタイムアウト
- `BASH_MAX_TIMEOUT_MS`: モデルがbashコマンドに設定できる最大タイムアウト
- `BASH_MAX_OUTPUT_LENGTH`: 切り捨て前のbash出力の最大文字数
- `CLAUDE_BASH_MAINTAIN_PROJECT_WORKING_DIR`: 各Bashコマンド後に元の作業ディレクトリに戻る

### 認証ヘルパー

- `CLAUDE_CODE_API_KEY_HELPER_TTL_MS`: `apiKeyHelper`使用時の認証情報更新間隔

### トークンと出力制限

- `CLAUDE_CODE_MAX_OUTPUT_TOKENS`: ほとんどのリクエストの最大出力トークン数
- `MAX_THINKING_TOKENS`: モデルの特定の思考バジェットを強制
- `MAX_MCP_OUTPUT_TOKENS`: MCPツールレスポンスで許可される最大トークン数（デフォルト：25000）

### クラウドプラットフォーム統合

- `CLAUDE_CODE_USE_BEDROCK`: Amazon Bedrock統合を有効化
- `CLAUDE_CODE_USE_VERTEX`: Google Vertex AI統合を有効化
- `CLAUDE_CODE_SKIP_BEDROCK_AUTH`: Bedrock用のAWS認証をスキップ
- `CLAUDE_CODE_SKIP_VERTEX_AUTH`: Vertex用のGoogle認証をスキップ

### 機能制御

- `CLAUDE_CODE_DISABLE_NONESSENTIAL_TRAFFIC`: すべての非必須ネットワークトラフィックを無効化
- `DISABLE_AUTOUPDATER`: 自動更新を無効化（1に設定）
- `DISABLE_BUG_COMMAND`: `/bug`コマンドを無効化（1に設定）
- `DISABLE_COST_WARNINGS`: コスト警告メッセージを無効化（1に設定）
- `DISABLE_ERROR_REPORTING`: Sentryエラーレポートをオプトアウト（1に設定）
- `DISABLE_NON_ESSENTIAL_MODEL_CALLS`: 非重要パスのモデル呼び出しを無効化（1に設定）
- `DISABLE_TELEMETRY`: Statsigテレメトリをオプトアウト（1に設定）

### ネットワーク設定

- `HTTP_PROXY`: ネットワーク接続用のHTTPプロキシサーバーを指定
- `HTTPS_PROXY`: ネットワーク接続用のHTTPSプロキシサーバーを指定

### MCP（モデルコンテキストプロトコル）

- `MCP_TIMEOUT`: MCPサーバー起動のタイムアウト（ミリ秒）
- `MCP_TOOL_TIMEOUT`: MCPツール実行のタイムアウト（ミリ秒）

## 環境変数の設定

複数の方法で環境変数を設定できます：

1. Claude Code実行前にシェルで：
   ```bash
   export ANTHROPIC_MODEL="claude-opus-4-20250514"
   claude
   ```

2. settings.jsonファイルの`env`セクションで：
   ```json
   {
     "env": {
       "ANTHROPIC_MODEL": "claude-opus-4-20250514",
       "DISABLE_TELEMETRY": "1"
     }
   }
   ```

3. Claude Code起動時の単一セッション用：
   ```bash
   ANTHROPIC_MODEL="claude-opus-4-20250514" claude
   ```

設定ファイルで設定された環境変数はセッション間で一貫して適用され、シェルで設定されたものはその特定の環境にのみ適用されます。

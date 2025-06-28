# ツール設定

Claude Codeは、コードベースを理解し修正するための様々なツールを提供します。各ツールは、その動作と権限を制御するように設定できます。

## 利用可能なツール

Claude Codeには以下のツールが含まれています：

| ツール | 説明 | 権限が必要 |
|------|-------------|------------|
| Agent | 複雑で多段階のタスクを処理するサブエージェントを実行 | いいえ |
| Bash | 環境でシェルコマンドを実行 | はい |
| Edit | 特定のファイルに対象を絞った編集を実行 | はい |
| Glob | パターンマッチングに基づいてファイルを検索 | いいえ |
| Grep | ファイル内容でパターンを検索 | いいえ |
| LS | ファイルとディレクトリを一覧表示 | いいえ |
| MultiEdit | 単一ファイルで複数の編集をアトミックに実行 | はい |
| NotebookEdit | Jupyterノートブックセルを変更 | はい |
| NotebookRead | Jupyterノートブックの内容を読み取り表示 | いいえ |
| Read | ファイルの内容を読み取り | いいえ |
| TodoRead | 現在のセッションのタスクリストを読み取り | いいえ |
| TodoWrite | 構造化されたタスクリストを作成・管理 | いいえ |
| WebFetch | 指定されたURLからコンテンツを取得 | はい |
| WebSearch | ドメインフィルタリングを使用してウェブ検索を実行 | はい |
| Write | ファイルを作成または上書き | はい |

## Bashツール設定

Bashツールはシェルコマンドを実行し、以下で設定できます：

```json
{
  "env": {
    "BASH_DEFAULT_TIMEOUT_MS": "30000",
    "BASH_MAX_TIMEOUT_MS": "120000",
    "BASH_MAX_OUTPUT_LENGTH": "10000",
    "CLAUDE_BASH_MAINTAIN_PROJECT_WORKING_DIR": "1"
  }
}
```

- `BASH_DEFAULT_TIMEOUT_MS`: コマンドのデフォルトタイムアウト（30秒）
- `BASH_MAX_TIMEOUT_MS`: Claudeが設定できる最大タイムアウト（2分）
- `BASH_MAX_OUTPUT_LENGTH`: 切り捨て前の最大出力長
- `CLAUDE_BASH_MAINTAIN_PROJECT_WORKING_DIR`: 各コマンド後に元のディレクトリに戻る

## ウェブツール設定

WebFetchとWebSearchツールはインターネットと相互作用します：

```json
{
  "permissions": {
    "allow": [
      "WebFetch(https://docs.anthropic.com/*)",
      "WebSearch(domain:stackoverflow.com)"
    ],
    "deny": [
      "WebFetch(https://internal-docs.company.com/*)"
    ]
  }
}
```

## ファイル操作ツール設定

ファイルツール（Read、Write、Edit、MultiEdit）は以下で設定できます：

```json
{
  "permissions": {
    "additionalDirectories": [
      "../shared-libs/",
      "~/common-utils/"
    ]
  }
}
```

`additionalDirectories`設定により、Claude Codeは現在のプロジェクトディレクトリ外のファイルにアクセスできます。

## ツール権限ルール

権限ルールは以下のパターンに従います：

```
ToolName(parameter:specification)
```

例：
- `Bash(git:*)`: すべてのgitコマンド
- `Bash(npm run *)`: 任意のnpm runコマンド
- `WebFetch(https://github.com/*)`: GitHubから取得
- `Read(~/.gitconfig)`: 特定のファイルを読み取り

## ツール使用とメモリ

Agent、TodoRead、TodoWriteなどのツールは、Claude Codeがコンテキストを維持し複雑なタスクを管理するのを支援します：

```json
{
  "env": {
    "MAX_MCP_OUTPUT_TOKENS": "50000"
  }
}
```

`MAX_MCP_OUTPUT_TOKENS`を増やすと、ツールがより詳細な情報を返すことができ、特に複雑なコードベースに有用です。

## ツール設定のベストプラクティス

1. 最小限の権限から始めて必要に応じて追加
2. パターンマッチングを使用して権限を適切にスコープ
3. 環境のパフォーマンスに基づいてタイムアウトを設定
4. ファイルシステムアクセスを制限するため`additionalDirectories`を慎重に使用
5. 不要なツールを明示的な拒否ルールで無効化
6. チームの一貫性のためツール設定を文書化
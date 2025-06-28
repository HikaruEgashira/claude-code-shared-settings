# 権限設定

権限設定は、Claude Codeが環境で実行できるアクションを制御し、機能性とセキュリティのバランスを取ります。

## 権限モード

Claude Codeは、その機能を制御する異なる権限モードをサポートします：

- `allowEdits`: Claude Codeにファイルの変更とコマンドの実行を許可（デフォルト）
- `readOnly`: Claude Codeを読み取り専用操作に制限
- `bypassPermissions`: Claude Codeが通常の権限チェックをバイパスすることを許可（明示的な有効化が必要）

## 権限設定

権限は設定ファイルの`permissions`セクションで設定されます：

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

## 権限設定オプション

- `allow`: ツール使用を許可する権限ルールの配列
- `deny`: ツール使用を拒否する権限ルールの配列
- `additionalDirectories`: Claudeがアクセスできる追加の作業ディレクトリ
- `defaultMode`: Claude Code起動時のデフォルト権限モード
- `disableBypassPermissionsMode`: バイパスモードを防ぐために「disable」に設定

## 権限ルール

権限ルールは、特定のツールと操作へのアクセスを制御します：

### ツール権限

以下のツールに対してルールを指定できます：

- `Bash`: シェルコマンドの実行
- `Edit`: ファイルに対する対象を絞った編集
- `MultiEdit`: 複数の編集をアトミックに実行
- `NotebookEdit`: Jupyterノートブックセルの変更
- `WebFetch`: URLからコンテンツを取得
- `WebSearch`: ウェブ検索の実行
- `Write`: ファイルの作成または上書き

### パターンマッチング

権限ルールはパターンマッチングをサポートします：

- 完全一致: `Bash(git status)`
- ワイルドカード一致: `Bash(git *)`
- ネームスペース: `Bash(git:*)`はすべてのgitコマンドにマッチ

### 作業ディレクトリ

デフォルトでは、Claude Codeは現在の作業ディレクトリにのみアクセスできます。追加のディレクトリは`additionalDirectories`で指定できます。

## 権限の管理

権限は以下を通じて管理できます：

1. 設定ファイル（上記のとおり）
2. 対話的コマンド：
   - `/allowed-tools`: 許可されたツールを一覧表示
   - `/permissions`: 権限モード間の切り替え
   - `/add-permission <rule>`: 新しい権限ルールを追加
   - `/remove-permission <rule>`: 権限ルールを削除

## セキュリティ考慮事項

- 拒否ルールは許可ルールより優先される
- エンタープライズ管理ポリシーは組織全体の権限を強制できる
- 権限変更には明示的なユーザー確認が必要
- 機密コマンドへのアクセスは慎重に制御すべき
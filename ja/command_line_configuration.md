# コマンドライン設定

Claude Codeは、設定管理のためのコマンドラインオプションと対話型設定インターフェースを提供します。

## コマンドライン引数

Claude Codeを起動する際、コマンドライン引数を使用してその動作を設定できます：

```bash
claude --help
claude --version
claude --no-auto-update
claude --verbose
```

## 設定コマンド

`claude config`コマンドは、ターミナルから設定を管理する方法を提供します：

```bash
# すべての設定を一覧表示
claude config list

# 特定の設定を確認
claude config get theme

# 設定を変更
claude config set theme dark

# リスト設定に追加
claude config add permissions.allow "Bash(npm run test)"

# リスト設定から削除
claude config remove permissions.deny "WebFetch"
```

デフォルトでは、これらのコマンドはプロジェクト設定を変更します。代わりにグローバル設定を管理するには、`--global`（または`-g`）フラグを追加します：

```bash
claude config set --global theme light
```

## 対話型設定

Claude Codeを対話モードで使用する際、スラッシュコマンドを使用して設定を行えます：

- `/config`: 設定の表示と変更
- `/permissions`: 権限モード間の切り替え
- `/allowed-tools`: ツール権限の一覧表示と管理
- `/add-permission <rule>`: 新しい権限ルールを追加
- `/remove-permission <rule>`: 権限ルールを削除

## 設定スコープ

Claude Codeの設定は異なるスコープで適用されます：

- **プロジェクトスコープ**: 現在のプロジェクトに設定を適用
- **グローバルスコープ**: すべてのプロジェクトに設定を適用
- **セッションスコープ**: 現在のセッションのみに設定を適用

## 設定ファイル管理

コマンドライン操作は適切な設定ファイルを変更します：

- プロジェクトコマンドは`.claude/settings.json`または`.claude/settings.local.json`を変更
- グローバルコマンドは`~/.claude/settings.json`を変更

## 設定のベストプラクティス

1. チーム共有設定にはプロジェクト固有の設定を使用
2. 個人の好みにはグローバル設定を使用
3. 単発セッションにはコマンドライン引数を使用
4. 重要な設定はバージョン管理で文書化
5. セキュリティのために権限を定期的に確認

## 例

```bash
# セキュアなプロジェクト環境を設定
claude config set permissions.deny "Bash(curl:*)"
claude config set permissions.deny "Bash(wget:*)"
claude config set permissions.defaultMode "readOnly"

# 高性能用に設定
claude config set -g env.CLAUDE_CODE_MAX_OUTPUT_TOKENS "4000"
claude config set -g env.MAX_THINKING_TOKENS "3000"

# 特定のモデル用に設定
claude config set env.ANTHROPIC_MODEL "claude-opus-4-20250514"
```

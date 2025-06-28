# UI設定

Claude Codeのユーザーインターフェースは、あなたの好みとワークフローに合わせて様々な設定でカスタマイズできます。

## テーマ設定

テーマ設定でClaude Codeの外観を変更：

```bash
claude config set -g theme dark
```

利用可能なテーマ：
- `dark`: デフォルトのダークテーマ
- `light`: ライトテーマ
- `dark-daltonized`: 色覚異常にやさしいダークテーマ
- `light-daltonized`: 色覚異常にやさしいライトテーマ

## 通知設定

`preferredNotifChannel`設定でClaude Codeの通知方法を制御：

```bash
claude config set -g preferredNotifChannel iterm2_with_bell
```

利用可能な通知チャンネル：
- `iterm2`: iTerm2での視覚的通知（デフォルト）
- `iterm2_with_bell`: iTerm2での音付き視覚的通知
- `terminal_bell`: ターミナルのベル音のみ
- `notifications_disabled`: すべての通知を無効化

## 詳細表示設定

`verbose`設定で表示される情報量を制御：

```bash
claude config set -g verbose true
```

有効にすると、Claude Codeは：
- 完全なbashコマンド出力を表示
- 操作に関するより詳細な情報を表示
- エラーメッセージにデバッグ情報を含める

## 対話モードのカスタマイズ

Claude Codeを対話モードで使用する際、以下をカスタマイズできます：

### プロンプト表示

対話モードでのプロンプト表示は環境変数でカスタマイズできます：

```json
{
  "env": {
    "DISABLE_NON_ESSENTIAL_MODEL_CALLS": "1"
  }
}
```

これにより、フレーバーテキストやその他の非必須モデル相互作用が無効になります。

### コマンド履歴

コマンド履歴はデフォルトで保存され、矢印キーで操作できます。この動作は標準的なターミナル規則に従います。

## 自動更新設定

`autoUpdates`設定で自動更新を制御：

```bash
claude config set -g autoUpdates false
```

環境変数で自動更新を無効にすることもできます：

```json
{
  "env": {
    "DISABLE_AUTOUPDATER": "1"
  }
}
```

## セッション持続性

`cleanupPeriodDays`設定でClaude Codeがセッションデータを保持する期間を制御：

```json
{
  "cleanupPeriodDays": 14
}
```

これによりチャット記録の保持期間が14日に設定されます（デフォルトは30日）。

## Git統合UI

Claude CodeのGit統合をカスタマイズ：

```json
{
  "includeCoAuthoredBy": false
}
```

`includeCoAuthoredBy`が`false`の場合、Claude Codeはgitコミットとプルリクエストに「Co-authored-by: Claude」行を追加しません。

## ベストプラクティス

1. 照明条件と好みに応じてテーマを設定
2. 問題をデバッグする際は`verbose`モードの使用を検討
3. 色覚異常がある場合はdaltonizedテーマを使用
4. 共有環境で他者の迷惑になる可能性がある場合は通知を無効化
5. プライバシー要件とディスク容量に基づいてクリーンアップ期間を調整
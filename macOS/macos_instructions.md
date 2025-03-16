# macOS設定自動化スクリプト

このリポジトリには、macOSの設定を自動化するスクリプト`macos_setup.sh`が含まれています。

## 使い方

1. スクリプトを実行可能にします：
   ```bash
   chmod +x macos_setup.sh
   ```

2. スクリプトを実行します：
   ```bash
   ./macos_setup.sh
   ```

## 設定内容

スクリプトは以下の設定を自動的に行います：

### システム設定
- すべてのファイル名拡張子を表示
- スクロールバーを常に表示
- ナチュラルスクロールをオフ
- Spotlite検索のショートカットをオフ

### パッケージマネージャー
- Homebrewのインストール
- Apple SiliconとIntel向けのパス設定の自動適用

### アプリケーションインストール
Brewfileから以下のアプリケーションがインストールされます：

#### コマンドラインツール
- coreutils, fzf, jq, tree, wget など基本的なツール
- git, lazygit, gh, ghq, tig など Git関連ツール
- neovim, tmux などのテキストエディタ/ターミナル環境
- node, deno, yarn などのJavaScript開発環境
- terraform-ls, tfenv などのInfrastructure as Code関連ツール
- kubernetes-cli, k9s, helm, colima, docker などのコンテナ関連ツール

#### GUIアプリケーション
- Alt-Tab (Windowsライクなタブ切り替え)
- Ghostty (モダンターミナルエミュレータ)
- Visual Studio Code
- Notion
- Hack Nerd Font

#### VS Code拡張機能
- GitHub Copilot & Copilot Chat
- GitLens
- Terraform
- Python関連拡張機能
- 日本語言語パック

### ドットファイル設定
- .configディレクトリ内のサブディレクトリをシンボリックリンク
- .zshディレクトリの設定
- ホームディレクトリ直下のドットファイルをシンボリックリンク
- 既存のファイル/ディレクトリが存在する場合は自動的にバックアップ

### ターミナル設定
- starshipプロンプトの設定
- coreutils (GNU版コマンド) のパス設定
- fzfの設定を自動適用

## 手動で設定が必要な項目

以下の項目はスクリプトでは設定できないため、手動での設定が必要です：

### システム設定
- マウスの軌跡速度調整
- キーボード設定をANSI(US)からJISに変更
- 変換推測表示をオフ
- 入力ソース選択のショートカットをCtrl + Spaceに設定
- 無線ネットワークの設定

### アプリケーション設定
- Alt-TabのCommand+TabをOption+Tabに設定
- Ghosttyのフォント設定（Hackフォントのインストールと設定）
- VS Codeの設定同期
- Notionのログインと同期設定

### 修飾キー設定
- ControlをCommandに変更
- OptionをCommandに変更（アプリ切り替えなど用）

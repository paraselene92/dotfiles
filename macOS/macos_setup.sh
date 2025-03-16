# macOS設定スクリプト
# 実行方法: bash macos_setup.sh

# エラー発生時に停止
set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
DOTFILES_ROOT="$(dirname "$SCRIPT_DIR")"

echo "=== macOS設定スクリプト開始 ==="

# ------------------------------------------------
# システム設定（defaults writeで設定可能なもの）
# ------------------------------------------------
echo "システム設定を適用中..."

# すべてのファイル名拡張子を表示
defaults write NSGlobalDomain AppleShowAllExtensions -bool true

# スクロールバーを常に表示
defaults write NSGlobalDomain AppleShowScrollBars -string "Always"

# ナチュラルスクロールをオフ
defaults write NSGlobalDomain com.apple.swipescrolldirection -bool false

# Spotlite検索のショートカットをオフ
defaults write com.apple.symbolichotkeys AppleSymbolicHotKeys -dict-add 64 "{ enabled = 0; value = { parameters = (65535, 49, 1048576); type = standard; }; }"

# ------------------------------------------------
# Homebrew インストール
# ------------------------------------------------
if ! command -v brew &> /dev/null; then
    echo "Homebrewをインストール中..."
    NONINTERACTIVE=1 /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    
    # Homebrewのパス設定
    if [[ $(uname -m) == 'arm64' ]]; then
        # Apple Silicon
        echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> ~/.zprofile
        eval "$(/opt/homebrew/bin/brew shellenv)"
    else
        # Intel
        echo 'eval "$(/usr/local/bin/brew shellenv)"' >> ~/.zprofile
        eval "$(/usr/local/bin/brew shellenv)"
    fi
else
    echo "Homebrewは既にインストールされています"
fi

# ------------------------------------------------
# アプリケーションインストール (Brewfileを使用)
# ------------------------------------------------
echo "Brewfileからアプリケーションをインストール中..."

# Brewfileの場所を指定して実行
brew bundle --file="$SCRIPT_DIR/Brewfile"

# ------------------------------------------------
# ドットファイルのシンボリックリンク設定
# ------------------------------------------------
echo "ドットファイルのシンボリックリンクを設定中..."

# .configディレクトリがなければ作成
mkdir -p ~/.config

# .configディレクトリ内のサブディレクトリを一つずつシンボリックリンク
if [ -d "$DOTFILES_ROOT/.config" ]; then
    for dir in "$DOTFILES_ROOT/.config"/*; do
        if [ -d "$dir" ]; then
            dirname=$(basename "$dir")
            # 既存のディレクトリがある場合はバックアップ
            if [ -d "$HOME/.config/$dirname" ] && [ ! -L "$HOME/.config/$dirname" ]; then
                echo "既存の $HOME/.config/$dirname をバックアップします"
                mv "$HOME/.config/$dirname" "$HOME/.config/$dirname.bak"
            fi
            # シンボリックリンクがなければ作成
            if [ ! -L "$HOME/.config/$dirname" ]; then
                echo "シンボリックリンク: $HOME/.config/$dirname -> $dir"
                ln -sf "$dir" "$HOME/.config/$dirname"
            fi
        fi
    done
fi

# .zshディレクトリの設定
if [ -d "$SCRIPT_DIR/.zsh" ]; then
    # .zshディレクトリがなければ作成
    mkdir -p ~/.zsh
    
    # .zshディレクトリ内のファイルとディレクトリをシンボリックリンク
    for item in "$SCRIPT_DIR/.zsh"/*; do
        if [ -e "$item" ]; then
            itemname=$(basename "$item")
            # 既存のファイル/ディレクトリがある場合はバックアップ
            if [ -e "$HOME/.zsh/$itemname" ] && [ ! -L "$HOME/.zsh/$itemname" ]; then
                echo "既存の $HOME/.zsh/$itemname をバックアップします"
                mv "$HOME/.zsh/$itemname" "$HOME/.zsh/$itemname.bak"
            fi
            # シンボリックリンクがなければ作成
            if [ ! -L "$HOME/.zsh/$itemname" ]; then
                echo "シンボリックリンク: $HOME/.zsh/$itemname -> $item"
                ln -sf "$item" "$HOME/.zsh/$itemname"
            fi
        fi
    done
fi

# ホームディレクトリに直接あるドットファイルのリンク
# 例: .gitconfig, .zshrc など
for file in "$DOTFILES_ROOT"/.[a-zA-Z]*; do
    # .gitや.config等の特定のディレクトリは除外
    if [ -f "$file" ] && [[ ! "$file" =~ \.git(ignore|modules)?$ ]]; then
        filename=$(basename "$file")
        # 既存のファイルがある場合はバックアップ
        if [ -f "$HOME/$filename" ] && [ ! -L "$HOME/$filename" ]; then
            echo "既存の $HOME/$filename をバックアップします"
            mv "$HOME/$filename" "$HOME/$filename.bak"
        fi
        # シンボリックリンクがなければ作成
        if [ ! -L "$HOME/$filename" ]; then
            echo "シンボリックリンク: $HOME/$filename -> $file"
            ln -sf "$file" "$HOME/$filename"
        fi
    fi
done

# ------------------------------------------------
# ターミナル設定
# ------------------------------------------------
echo "ターミナル環境を設定中..."

# fzfの設定
if command -v fzf &> /dev/null; then
    $(brew --prefix)/opt/fzf/install --all --no-bash --no-fish
fi

# ------------------------------------------------
# 設定の適用
# ------------------------------------------------
echo "設定を反映するために一部のアプリケーションを再起動します..."
killall Finder &>/dev/null || true
killall Dock &>/dev/null || true
killall SystemUIServer &>/dev/null || true

echo "=== macOS設定スクリプトが完了しました ==="
echo "注意: 一部の設定は次回ログイン時またはシステム再起動後に反映されます"


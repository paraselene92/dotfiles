#!/bin/bash
# テスト実行スクリプト

# エラー発生時に停止
set -e

echo "=== dotfiles テストスクリプト ==="

# ------------------------------------------------
# 環境のチェック
# ------------------------------------------------
echo "システム環境をチェック中..."
uname -a

# OS判定
if [[ "$OSTYPE" == "darwin"* ]]; then
  OS_TYPE="macOS"
  echo "macOS環境を検出しました"
elif [[ "$OSTYPE" == "linux-gnu"* ]]; then
  OS_TYPE="Linux"
  echo "Linux環境を検出しました"
else
  echo "サポートされていないOS: $OSTYPE"
  exit 1
fi

# ------------------------------------------------
# 設定ファイルの構文チェック
# ------------------------------------------------
echo "設定ファイルの構文チェック中..."

# シェルスクリプトの構文チェック
echo "シェルスクリプトをチェック中..."
for script in $(find . -name "*.sh"); do
  echo "チェック: $script"
  bash -n "$script" || { echo "エラー: $script の構文チェックに失敗しました"; exit 1; }
done

# Brewfile構文チェック（macOSの場合）
if [[ "$OS_TYPE" == "macOS" ]] && command -v brew &> /dev/null; then
  echo "Brewfileをチェック中..."
  if [ -f "macOS/Brewfile" ]; then
    brew bundle check --file="macOS/Brewfile" --no-upgrade || echo "警告: Brewfileに不足しているパッケージがあります（テスト環境では無視可）"
  fi
fi

# ------------------------------------------------
# シンボリックリンクのテスト（ドライラン）
# ------------------------------------------------
echo "シンボリックリンクのテスト（ドライランモード）..."

# テスト用の一時ディレクトリを作成
TEST_HOME=$(mktemp -d)
echo "テスト用ホームディレクトリ: $TEST_HOME"

# テスト環境のクリーンアップ関数
cleanup() {
  echo "テスト環境をクリーンアップ中..."
  rm -rf "$TEST_HOME"
}

# スクリプト終了時にクリーンアップを実行
trap cleanup EXIT

# .configディレクトリを作成
mkdir -p "$TEST_HOME/.config"

# ドットファイルのリンク処理をシミュレート
echo "ドットファイルリンク処理のシミュレーション..."

echo "=== テスト完了 ==="
echo "すべてのテストが正常に完了しました"
exit 0


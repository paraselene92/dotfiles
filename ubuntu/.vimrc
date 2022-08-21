"=============================================
"DeinScripts:
if &compatible
  set nocompatible
endif
" Vim を Vi 互換にするかどうか
" vimrc か gvimrc があると自動的に nocompatible になる。

" Required
set runtimepath+=~/.cache/dein/repos/github.com/Shougo/dein.vim

" Required
if dein#load_state('~/.cache/dein') 
  call dein#begin('~/.cache/dein')
  " Let dein manage dein
  " Required
  call dein#add('~/.cache/dein/repos/github.com/Shougo/dein.vim')
  " Managed by Toml's File
  let g:config_dir = expand('~/.cache/dein/userconfig')
  let s:toml = g:config_dir . '/plugins.toml'
  let s:lazy_toml = g:config_dir . '/plugins_lazy.toml'
  call dein#load_toml(s:toml, {'lazy':0})
  call dein#load_toml(s:lazy_toml, {'lazy':1})
  " You can specify revision/branch/tag.
  call dein#add('Shougo/deol.nvim', { 'rev': '01203d4c9' })
  " Required
  call dein#end()
  call dein#save_state()
endif
" If you want to install not installed plugins on startup.
if dein#check_install()
  call dein#install()
endif

"=============================================
"NERDTree:
let NERDTreeShowHidden=1
let g:NERDTreeShowBookmarks=1
autocmd Vimenter * if !argc() | NERDTree | endif
nnoremap <silent><C-e> :NERDTreeToggle<CR>
nnoremap <C-n> gt
" NERDTree用。Ctrl+n でタブ入れ替え。

"=============================================
"Previm:
let g:previm_open_cmd = 'open -a FirefoxDeveloperEdition'

augroup PrevimSettings
  autocmd!
  autocmd BufNewFile,BufRead *.{md,mdwn,mkd,mkdn,mark*} set filetype=markdown
  au BufRead,BufNewFile,BufReadPre *.ts set filetype=typescript
augroup END

"=============================================
"Keymap:
nnoremap <S-a> ^
nnoremap <S-l> $
"nnoremap 1 2 :1 を打つと2 のキーを打ったことになる
"このとき2 はvim標準の動作をする。（map の入れ子にはならない）。
"似たコマンドでmap があるが、これは入れ子が使える。
nnoremap j gj
" gj:現在の表示行分カーソルを下げる。[Count]gjで行数を指定できる。
" j:折り返しを考慮せずカーソルを下げる。[Count]はgjと同じ。
nnoremap k gk
" 考え方はj,gjと同じ。kはカーソルを上げる。
inoremap ( ()<LEFT>
inoremap " ""<LEFT>
inoremap ' ''<LEFT>
inoremap < <><LEFT>
inoremap ` ``<LEFT>
inoremap { {}<LEFT>

"=============================================
filetype plugin indent off
syntax enable

"=============================================
"Display:
"ColorScheme:
colorscheme iceberg 
set number
" 左に行数を表示させる
set t_Co=256
" vim の配色数を256色にする。:echo &t_Co と入れると現在の色数が分かる→デフォルトで 8
" $TERM を xterm-256color にしないと効力を発揮しないらしいよ
set fileformats=unix,dos
" fileformat の設定。改行コードとかその辺。＜CR＞
" Mac だと mac,unix,dos とするらしい。
set virtualedit=block
" 文字が無い場所までカーソルを移動できる
" block はビジュアルモードのときのみ。
set list
set listchars=tab:>-
" listchars に設定した不可視文字を可視化する
set ambiwidth=double
" 文字記号★ などを入力したときカーソル位置を正しくする
" 全角文字なのに1byteの文字スペースとなる場合があるらしい
set laststatus=2
"ステータスバーを表示させる。（最下部の白いところ）

"=============================================
"Editing:
"set smarttab
"set shiftwidth=2
" 行頭に shiftwidth の数だけインデントする。行頭以外は tabstop の数だけ空白を打つ。
" デフォルト shiftwidth=8
set expandtab
" tab キーを適切な数の空白に変更して打つ。
" tab として使用したい場合は、Ctrl+VでTab
set backspace=indent,eol,start
"バックスペースキーで削除できるものを指定。

"=============================================
"Search:
set ignorecase
" on にすると検索文字列の小文字大文字の区別がなくなる。
set smartcase
" ignorecase と両立。検索文字列で小文字大文字両方が含まれていた場合、それぞれを区別して検索。
set incsearch
" 検索時にエンターを押す前から検索するかどうか
set hlsearch
" 検索文字列のハイライトのonoff
set wrapscan
" 検索時に末尾までいったら文頭へループする
if has ('path_extra')
        set tags+=./tags,tags
endif
" タグジャンプというもの。Ctrl+]で関数の宣言元へジャンプしてくれる。すごい。
" set 文でカレントディレクトリからの位置関係で探す先の設定をしてくれる。
" ./tags だとカレントディレクトリと同じ階層にいるtags検索
" +のインクリメントは再帰的な意味かな…

"=============================================
let python_highlight_all = 1
let g:ansible_options = {'ignore_blank_lines': 0}
filetype plugin indent on


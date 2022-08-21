
"================================
"DeinScripts:"
if &compatible
  set nocompatible
endif

set runtimepath+=~/.cache/dein/repos/github.com/Shougo/dein.vim

if dein#load_state('~/.cache/dein')
  call dein#begin('~/.cache/dein')
  call dein#add('~/.cache/dein/repos/github.com/Shougo/dein.vim')
  let g:config_dir = expand('~/.cache/dein/userconfig')
  let s:toml = g:config_dir . '/plugins.toml'
  let s:lazy_toml = g:config_dir . '/plugins_lazy.toml'
  call dein#load_toml(s:toml, {'lazy':0})
  call dein#load_toml(s:lazy_toml, {'lazy':1})
  call dein#add('Shougo/deol.nvim', { 'rev': '01203d4c9' })
  call dein#end() 
  call dein#save_state() 
endif

if dein#check_install()
  call dein#install()
endif

"================================
"NERDTree:
let NERDTreeShowHidden=1
let g:NERDTreeShowvBookmarks=1
autocmd Vimenter * if !argc() | NERDTree | endif
nnoremap <silent><C-e> :NERDTreeToggle<CR>
nnoremap <C-n> gt

"================================
"Previm:
let g:previm_open_cmd = '/opt/vivaldi/vivaldi'

augroup PrevimSettings
  autocmd!
  autocmd BufNewFile,BufRead *.{md,mdwn,mkd,mkdn,mark*} set filetype=markdown
  autocmd BufNewFile,BufRead *.tf set filetype=terraform
  aut BufRead,BufNewFile,BufReadPre *.ts set filetype=typescript
augroup END


if (executable('pyls'))
  augroup LspPython
      autocmd!
      autocmd User lsp_setup call lsp#register_server({
          \ 'name': 'pyls',
          \ 'cmd': { server_info -> ['pyls'] },
          \ 'white_list': ['python'],
          \})
      augroup END
endif

"================================
"Keymaps:
nnoremap <S-a> ^
nnoremap <S-l> $
nnoremap j gj
nnoremap k gk
inoremap ( ()<LEFT>
inoremap " ""<LEFT>
inoremap ' ''<LEFT>
inoremap < <><LEFT>
inoremap ` ``<LEFT>
inoremap { {}<LEFT>

nnoremap <silent> <C-p><C-p> :PrevimOpen<CR>
nnoremap <silent> <C-d><C-d> :LspDocumentDiagnostics<CR>
nnoremap <silent> <C-d><C-f> :LspDocumentFormat<CR>
nnoremap <silent> <C-d> :LspDefinition<CR>
nnoremap <silent> <C-h> :LspHover<CR>
nnoremap <silent> <C-n> :LspNextError<CR>
nnoremap <silent> <C-p> :LspPreviousError<CR>
nnoremap <silent> <C-s> :LspStatus<CR>

command! LspDebug let lsp_log_verbose=1 | let lsp_log_file = expand('~/lsp.log')

"================================
"ColorScheme:
colorscheme iceberg

"================================
"Display:
filetype plugin indent off
syntax enable

set number
set t_Co=256
set fileformats=unix,dos
set virtualedit=block
set list
set listchars=tab:>-
set ambiwidth=double
set laststatus=2

"================================
"Editing:
set expandtab
set backspace=indent,eol,start

"================================
"Search:
set ignorecase
set smartcase
set incsearch
set hlsearch
set wrapscan

autocmd InsertLeave * call system("fcitx-remote -o")
autocmd InsertEnter * call system("fcitx-remote -c")
""#let g:input_toggle = 1
""#function! Fcitx2en()
""#    let s:input_status = system("fcitx-remote")
""#    if s:input_status == 2
""#        let g:input_toggle = 1
""#        let l:a = system("fcitx-remote -c")
""#    endif
""#endfunction
""#
""#function! Fcitx2zh()
""#    let s:input_status = system("fcitx-remote")
""#    if s:input_status != 2 && g:input_toggle == 1
""#        let l:a = system("fcitx-remote -o")
""#        let g:input_toggle = 0
""#    endif
""#endfunction
""#
""#set ttimeoutlen=150
""#autocmd InsertLeave * call Fcitx2en()
""#autocmd InsertEnter * call Fcitx2zh()


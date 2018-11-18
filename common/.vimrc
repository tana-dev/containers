colorscheme desert
syntax on
set wildmenu wildmode=list:full
set clipboard=unnamed,autoselect
set noswapfile
set nobackup

"" 文字コード
set encoding=utf-8
set fileencoding=utf-8 " 保存時の文字コード
set fileencodings=ucs-boms,utf-8,euc-jp,cp932 " 読み込み時の文字コードの自動判別. 左側が優先される
set fileformats=unix,dos,mac " 改行コードの自動判別. 左側が優先される
set ambiwidth=double " □や○文字が崩れる問題を解決

set laststatus=2

"" バックスペースで削除
set backspace=indent,eol,start

"" tab設定
""set expandtab
set tabstop=4
set shiftwidth=4

"" オートインデント
set autoindent
set smartindent

"" 選択した部分を検索
vnoremap * "zy:let @/ = @z<CR>n

"" php構文チェック
autocmd FileType php set makeprg=php\ -l\ %
autocmd BufWritePost *.php silent make | if len(getqflist()) != 1 | copen | else | cclose | endif

"" 検索に関すること
set ignorecase
set smartcase
set incsearch
set hlsearch
nmap <Esc><Esc> :nohlsearch<CR><Esc>

"" number
set number
function Setnumber()
  if &number
    setlocal nonumber
  else
    setlocal number
  endif
endfunction
nnoremap <silent> <C-m> :call Setnumber()<CR>

"" netrwは常にtree view
let g:netrw_liststyle = 3

"" タブ移動
nnoremap <C-g> gt

"" タブ移動
nnoremap <C-t> gT

"" 文末の空白をハイライト
augroup HighlightTrailingSpaces
  autocmd!
  autocmd VimEnter,WinEnter,ColorScheme * highlight TrailingSpaces term=underline guibg=Red ctermbg=Red
  autocmd VimEnter,WinEnter * match TrailingSpaces /\s\+$/
augroup END

"" vimgrep
nnoremap [q :cprevious<CR>   " 前へ
nnoremap ]q :cnext<CR>       " 次へ
nnoremap [Q :<C-u>cfirst<CR> " 最初へ
nnoremap ]Q :<C-u>clast<CR>  " 最後へ

"" php構文チェック
autocmd FileType php set makeprg=php\ -l\ %
autocmd BufWritePost *.php silent make | if len(getqflist()) != 1 | copen | else | cclose | endif

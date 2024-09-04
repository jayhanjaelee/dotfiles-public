"-----------------------------------------------------------------------"
" vim-plugin
"------------------------------------------------------------------------"

call plug#begin('~/.vim/plugged')
   Plug 'itchyny/lightline.vim'
   Plug 'christoomey/vim-tmux-navigator' 
   Plug 'tpope/vim-surround'
   Plug 'sainnhe/everforest'
   Plug 'joshdick/onedark.vim'
call plug#end()

"-----------------------------------------------------------------------"
" Theme
"------------------------------------------------------------------------"

if has("syntax")
 syntax on
endif

if has('termguicolors')
  let &t_Co = 256
  set termguicolors
  colorscheme onedark
  set background=dark
endif

set relativenumber
set laststatus=2 " turn on bottom bar

"Use 24-bit (true-color) mode in Vim/Neovim when outside tmux.
"If you're using tmux version 2.2 or later, you can remove the outermost $TMUX check and use tmux's 24-bit color support
"(see < http://sunaku.github.io/tmux-24bit-color.html#usage > for more information.)
if (empty($TMUX))
  if (has("nvim"))
    "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif
  "For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
  "Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
  " < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
  if (has("termguicolors"))
    set termguicolors
  endif
endif

"-----------------------------------------------------------------------"
"vim configuration
"-----------------------------------------------------------------------"
"

let &t_SI = "\<ESC>[6 q"
let &t_EI = "\<ESC>[2 q"

autocmd InsertEnter * set cursorline
autocmd InsertLeave * set nocursorline

autocmd FileType * setlocal formatoptions-=cro

set scrolloff=8

" 가독성이 좋아짐 bacgkround dark
set bg=dark

" 오리지날 VI와 호환하지 않음 (vim 전용기능 사용)
set nocompatible "Vim Using
set encoding=utf-8
set fencs=utf-8,euc-kr
set termencoding=utf-8 " terminal encoding

" 백스페이스 사용
set bs=indent,eol,start

" 줄번호 표시
set nu

" 자동 줄바꿈 안함
"set nowrap
set linebreak
set showbreak=+++\

" 스마트 셋팅
set smartcase

" 이동 동작시 줄의 시작으로 자동 이동
set sol

" 비쥬얼 모드 동작 설정
set sel=exclusive

" 괄호짝 찾기에서 <> 도 찾도록 추가
set mps+=<:>

" 검색어 강조
set hls

" 검색시 파일 끝에서 되돌리기 안함
set nows

" 스마트한 대소문자 구별 기능 사용
set scs

"대소문자 구분 없애기
set ignorecase

" 항상 status 라인을 표시
set ls=2

" 파일 형식에 따른 신택스 하이라이팅 켜기
sy enable

"괄호 매치
set showmatch

"마우스 자동
set mouse=a

"클립보드 복사
" set clipboard=unnamed "use OS clipboard
set clipboard+=unnamed  " use the clipboards of vim and win
" set paste
set nopaste

" 키워드 입력시 점진적 검색
set incsearch
set spell

set nobackup " 백업 파일을 안만듬
set nowrapscan " 검색할 때 문서의 끝에서 처음으로 안돌아감
filetype indent on " 파일 종류에 따른 구문강조
autocmd FileType * setlocal comments-=:// " 자동 주석 끄기
set backspace=eol,start,indent "  줄의 끝, 시작, 들여쓰기에서 백스페이스시 이전줄로

" 현재 라인 highlighting
set cursorline

"-----------------------------------------------------------------------"
" Indentation
"-----------------------------------------------------------------------"

" set tab size
set expandtab " use space instead of tab
set softtabstop=2 "same sts
set tabstop=2 "same ts
set shiftwidth=2 "same sw
set textwidth=80
set autoindent
set smartindent
set cindent
set smarttab

" python
autocmd FileType python set softtabstop=4
autocmd FileType python set tabstop=4
autocmd FileType python set shiftwidth=4

" makefile
autocmd FileType make setlocal noexpandtab "Makefile은 tab 문법이기 때문에 스페이스 대체 안함.

" markdown
autocmd FileType markdown set softtabstop=2
autocmd FileType markdown set tabstop=2
autocmd FileType markdown set shiftwidth=2
autocmd FileType markdown set textwidth=80

" rust
syntax enable
filetype plugin indent on

"-----------------------------------------------------------------------"
" lightline
"------------------------------------------------------------------------"

let g:lightline = {
      \ 'colorscheme': 'onedark',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'readonly', 'filename', 'modified' ] ]
      \ },
      \ }

"-----------------------------------------------------------------------"
" Keybindings
"------------------------------------------------------------------------"

let g:mapleader = " "

nmap <Leader>o o<Esc>0"_D
nmap <Leader>O O<Esc>0"_D
nmap <Leader>/ :noh<Return>

"-----------------------------------------------------------------------"
" windows
"------------------------------------------------------------------------"

" Split window
nmap ss :split<Return><C-w>w
nmap sv :vsplit<Return><C-w>w

" Move window
map sh <C-w>h
map sj <C-w>j
map sk <C-w>k
map sl <C-w>l

"-----------------------------------------------------------------------"
" tab
"------------------------------------------------------------------------"

nmap te :tabedit<Return>
nmap tw :tabclose<Return>
nmap ta :tabonly<Return>

" Switch tab
nmap <S-Tab> :tabprev<Return>
nmap <Tab> :tabnext<Return>

"-----------------------------------------------------------------------"
" buffer
"------------------------------------------------------------------------"
nmap <Leader>w :%bd\|e#<Return>
map <leader>n :bnext<cr>
map <leader>p :bprevious<cr>
map <leader>d :bdelete<cr>
map <leader>l :buffers<cr>

nnoremap <Leader>v <c-v>

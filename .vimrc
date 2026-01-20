"-----------------------------------------------------------------------"
" vim-plugin
"------------------------------------------------------------------------"

call plug#begin('~/.vim/plugged')
   Plug 'bluz71/vim-moonfly-colors', { 'as': 'moonfly' }
   Plug 'itchyny/lightline.vim'
   Plug 'christoomey/vim-tmux-navigator'
   Plug 'jceb/vim-orgmode'
   Plug 'tpope/vim-surround'
call plug#end()

"-----------------------------------------------------------------------"
" Theme
"------------------------------------------------------------------------"

if has("syntax")
 syntax on
endif

if has('termguicolors')
  set termguicolors
endif

set laststatus=2 " turn on bottom bar
if !has('gui_running')
  set t_Co=256
endif
set noshowmode

" colorscheme onedark
colorscheme moonfly

" Vimscript initialization file
let g:moonflyItalics = v:false

"-----------------------------------------------------------------------"
"vim configuration
"-----------------------------------------------------------------------"
"

if has("gui_running")
  if has("gui_gtk2")
    set guifont=MesloLGM\ Nerd\ Font\ Mono:h10.5
  elseif has("gui_macvim")
    set guifont=MesloLGM\ Nerd\ Font\ Mono:h10.5
  elseif has("gui_win32")
    set guifont=MesloLGM\ Nerd\ Font\ Mono:h10.5
  endif
endif

" 오리지날 VI와 호환하지 않음 (vim 전용기능 사용)
set nocompatible "Vim Using

let &t_SI = "\<ESC>[6 q"
let &t_EI = "\<ESC>[2 q"

autocmd InsertEnter * set cursorline
autocmd InsertLeave * set nocursorline

autocmd FileType * setlocal formatoptions-=cro

set scrolloff=8

" Allow recursive search
set path+=**

" Ignore heavy folders to keep search fast
set wildignore+=**/node_modules/**,**/dist/**,**/.git/**,**/build/**

" 각 항목에 대응하는 문자 설정
set listchars=tab:\ ,eol:󰌑,trail:󱁐,extends:>,precedes:<

" 가독성이 좋아짐 bacgkround dark
set bg=dark

" Encoding
set encoding=utf-8
set fencs=utf-8,euc-kr
set termencoding=utf-8 " terminal encoding

" 백스페이스 사용
set bs=indent,eol,start

" 줄번호 표시
set nu
set rnu

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

" 마우스 자동
set mouse=a

" 클립보드 복사
set clipboard=unnamed "use OS clipboard

" 키워드 입력시 점진적 검색
set incsearch
set nospell

set nobackup " 백업 파일을 안만듬
set nowrapscan " 검색할 때 문서의 끝에서 처음으로 안돌아감
filetype indent on " 파일 종류에 따른 구문강조
autocmd FileType * setlocal comments-=:// " 자동 주석 끄기
set backspace=eol,start,indent "  줄의 끝, 시작, 들여쓰기에서 백스페이스시 이전줄로

" 현재 라인 highlighting
set cursorline

" Delete trailing whitespace before writing a file.
autocmd BufWritePre * %s/\s\+$//e

" Netrw
let g:netrw_banner=0
let g:netrw_browse_split=0
let g:netrw_altv=1
let g:netrw_liststyle=3
let g:netrw_list_hide= '.*\.swp$,.DS_Store,*/tmp/*,*.so,*.swp,*.zip,*.git,^\.\.\=/\=$'
" 정렬 기준을 시간순(Time)으로 설정
let g:netrw_sort_by = 'time'
" 내림차순 정렬 (최신 파일이 위로)
let g:netrw_sort_direction = 'reverse'
" 디렉토리를 목록 맨 위에 배치 (선택 사항)
let g:netrw_sort_sequence = '[\/]$,*'

"-----------------------------------------------------------------------"
" Indentation
"-----------------------------------------------------------------------"

" set tab size
set expandtab " use space instead of tab
set softtabstop=2 "same sts
set tabstop=2 "same ts
set shiftwidth=2 "same sw
set textwidth=140
set autoindent
set smartindent
set cindent
set smarttab

" ctags
set omnifunc=ccomplete#Complete
" config 현재 폴더에서 tags 파일 검색, 없으면 상위폴더에서 찾음.
set tags=./tags,tags
set tags+=~/libc.tags " c stdlib

" 1. 완성 직후 팝업/미리보기 창을 자동으로 닫음
autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif

" c
autocmd FileType c set softtabstop=4
autocmd FileType c set tabstop=4
autocmd FileType c set shiftwidth=4

let t_path = expand('~/.vim/templates/')
augroup C_Templates
    autocmd!

    " [공통 처리] .c와 .h 파일 모두에 적용되는 치환 규칙
    autocmd BufNewFile *.c,*.h silent! execute "0r " . t_path . (expand("%:e") == "c" ? "c.skeleton" : "h.skeleton")
    autocmd BufNewFile *.c,*.h silent! %s/FILENAME/\=expand("%:t")/ge
    autocmd BufNewFile *.c,*.h silent! %s/CURRENT_DATE/\=strftime("%Y-%m-%d %H:%M")/ge

    " [.c 전용] 헤더 포함 및 커서를 맨 아래로 이동
    autocmd BufNewFile *.c silent! %s/HEADER_FILE/\=expand("%:t:r") . ".h"/ge
    autocmd BufNewFile *.c normal! G

    " [.h 전용] 헤더 가드 생성 및 커서를 본문 위치(10행)로 이동
    autocmd BufNewFile *.h silent! %s/HEADER_GUARD/\=toupper(substitute(expand("%:t"), "[.-]", "_", "g"))/ge
    autocmd BufNewFile *.h normal! 10G

    " 모든 처리가 끝난 후 메시지 프롬프트 제거
    autocmd BufNewFile *.c,*.h redraw
augroup END

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

" php
autocmd FileType php setlocal iskeyword+=$ "$기호 까지 한 단어로 취급하도록 설정.

"-----------------------------------------------------------------------"
" lightline
"------------------------------------------------------------------------"

let g:lightline = {
      \ 'colorscheme': 'moonfly',
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

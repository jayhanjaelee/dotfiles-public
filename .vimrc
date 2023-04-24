"-----------------------------------------------------------------------"
" Theme
"------------------------------------------------------------------------"

if has("syntax")
 syntax on
endif

if has('nvim') || has('termguicolors')
  set termguicolors
endif

colorscheme onedark

let g:lightline = {
      \ 'colorscheme': 'onedark',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'gitbranch#name'
      \ }
      \ }

set laststatus=2 " turn on bottom bar
if !has('gui_running')
  set t_Co=256
endif
set noshowmode

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
" vim-plugin 환경설정
"------------------------------------------------------------------------"

call plug#begin('~/.vim/plugged')
  Plug 'itchyny/lightline.vim'
  Plug 'itchyny/vim-gitbranch'
  Plug 'sheerun/vim-polyglot'
  Plug 'jidn/vim-dbml'
  Plug 'https://github.com/adelarsq/vim-matchit'
  Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
  Plug 'junegunn/fzf.vim'
  Plug 'ctrlpvim/ctrlp.vim'
  Plug 'Xuyuanp/nerdtree-git-plugin'
  Plug 'iwataka/ctrlproj.vim'
  Plug 'preservim/vim-markdown'
  Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}
  Plug 'rust-lang/rust.vim'
  Plug 'prettier/vim-prettier', { 'do': 'yarn install --frozen-lockfile --production' }
call plug#end()

"-----------------------------------------------------------------------"
"vim configuration
"-----------------------------------------------------------------------"
"
autocmd FileType * setlocal formatoptions-=cro

let g:prettier#autoformat = 0

" 가독성이 좋아짐 bacgkround dark
set bg=dark

" 오리지날 VI와 호환하지 않음 (vim 전용기능 사용)
set nocompatible "Vim Using

" 파일 타입 설정
set encoding=utf-8
set fencs=utf-8,euc-kr
set termencoding=utf-8 " 터미널 인코딩

" 명령어 기록 갯수
set hi=1000

" 백스페이스 사용
set bs=indent,eol,start

" 오른쪽 하단 커서 위치 항상 보이기
set ru "same ruler

" 줄번호 표시
set nu

" 줄 번호 표시 너비 설정
" set nuw=5

" 탭 >> 공백 변환 사용안함
"set noet

" 자동 줄바꿈 안함
"set nowrap
set linebreak
set showbreak=+++\

" 스마트 셋팅
set smartcase

" magic 기능 사용
set magic

" 이동 동작시 줄의 시작으로 자동 이동
set sol

" 비쥬얼 모드 동작 설정
set sel=exclusive

" 괄호짝 찾기에서 <> 도 찾도록 추가
set mps+=<:>

" 검색어 강조
" set hls

" 검색시 파일 끝에서 되돌리기 안함
set nows

" 스마트한 대소문자 구별 기능 사용
set scs

"대소문자 구분 없애기
set ignorecase

" 항상 status 라인을 표시
set ls=2

"파일 형식에 따른 신택스 하이라이팅 켜기
sy enable

"괄호 매치
set showmatch

"마우스 자동
set mouse=a

"클립보드 복사
"set clipboard=unnamed "use OS clipboard
"set clipboard=unnamedplus "use OS clipboard

" 키워드 입력시 점진적 검색
set incsearch
set spell

set nobackup " 백업 파일을 안만듬
set nowrapscan " 검색할 때 문서의 끝에서 처음으로 안돌아감
" filetype indent on "  파일 종류에 따른 구문강조
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
autocmd FileType python set expandtab
autocmd FileType python set softtabstop=4
autocmd FileType python set tabstop=4
autocmd FileType python set shiftwidth=4
autocmd FileType python set textwidth=80
autocmd FileType python set autoindent
autocmd FileType python set smartindent
autocmd FileType python set cindent

" makefile
autocmd FileType make setlocal noexpandtab "Makefile은 tab 문법이기 때문에 스페이스 대체 안함.

" markdown
autocmd FileType markdown set softtabstop=2
autocmd FileType markdown set tabstop=2
autocmd FileType markdown set shiftwidth=2
autocmd FileType markdown set textwidth=80
autocmd FileType markdown set autoindent
autocmd FileType markdown set smartindent
autocmd FileType markdown set cindent
" 

" rust
syntax enable
filetype plugin indent on

" prettier
packloadall
autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.vue,*.yaml,*.html PrettierAsync

"-----------------------------------------------------------------------"
" Ctrlp, CtrlProj
"------------------------------------------------------------------------"

let g:ctrlp_working_path_mode = 'ra'

set wildignore+=*/tmp/*,*.so,*.swp,*.zip " MacOSX/Linux

let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn)$|node_modules',
  \ 'file': '\v\.(exe|so|dll)$',
  \ 'link': 'some_bad_symbolic_links',
  \ }

let g:ctrlproj_paths = [
      \ '/Users/jay/Desktop/42-backend-westagram-3', 
      \ '/Users/jay/Desktop/playground',
      \ '/Users/jay/Desktop/side-project',
      \ ]

"-----------------------------------------------------------------------"
" markdown-mode
"------------------------------------------------------------------------"

let g:vim_markdown_folding_disabled = 1

"-----------------------------------------------------------------------"
" Keybindings
"------------------------------------------------------------------------"

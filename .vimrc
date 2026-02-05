"-----------------------------------------------------------------------"
" vim-plugin
"------------------------------------------------------------------------"

call plug#begin('~/.vim/plugged')
   Plug 'bluz71/vim-moonfly-colors', { 'as': 'moonfly' }
   Plug 'itchyny/lightline.vim'
   Plug 'christoomey/vim-tmux-navigator'
   Plug 'jceb/vim-orgmode'
   Plug 'tpope/vim-surround'
   Plug 'neoclide/coc.nvim', {'branch': 'release'}
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
set suffixesadd=.c,.h

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

set autoread

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

" code folding
set foldmethod=syntax " 문법 기반으로 code folding 활성화.
set foldlevelstart=99 " 처음 파일 열었을때 코드 폴드 하지않도록 설정.

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
" coc
"------------------------------------------------------------------------"
" https://raw.githubusercontent.com/neoclide/coc.nvim/master/doc/coc-example-config.vim

" May need for Vim (not Neovim) since coc.nvim calculates byte offset by count
" Some servers have issues with backup files, see #649
set nowritebackup

" Having longer updatetime (default is 4000 ms = 4s) leads to noticeable
" delays and poor user experience
set updatetime=300

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate
" NOTE: There's always complete item selected by default, you may want to enable
" no select by `"suggest.noselect": true` in your configuration file
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

" Make <CR> to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list
nmap <silent><nowait> [g <Plug>(coc-diagnostic-prev)
nmap <silent><nowait> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation
nmap <silent><nowait> gd <Plug>(coc-definition)
nmap <silent><nowait> gy <Plug>(coc-type-definition)
nmap <silent><nowait> gi <Plug>(coc-implementation)
nmap <silent><nowait> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call ShowDocumentation()<CR>

function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s)
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
augroup end

" Applying code actions to the selected code block
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying code actions at the cursor position
nmap <leader>ac  <Plug>(coc-codeaction-cursor)
" Remap keys for apply code actions affect whole buffer
nmap <leader>as  <Plug>(coc-codeaction-source)
" Apply the most preferred quickfix action to fix diagnostic on the current line
nmap <leader>qf  <Plug>(coc-fix-current)

" Remap keys for applying refactor code actions
nmap <silent> <leader>re <Plug>(coc-codeaction-refactor)
xmap <silent> <leader>r  <Plug>(coc-codeaction-refactor-selected)
nmap <silent> <leader>r  <Plug>(coc-codeaction-refactor-selected)

" Run the Code Lens action on the current line
nmap <leader>cl  <Plug>(coc-codelens-action)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Remap <C-f> and <C-b> to scroll float windows/popups
if has('nvim-0.4.0') || has('patch-8.2.0750')
  nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
  inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
  vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif

" Use CTRL-S for selections ranges
" Requires 'textDocument/selectionRange' support of language server
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer
command! -nargs=0 Format :call CocActionAsync('format')

" Add `:Fold` command to fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer
command! -nargs=0 OR   :call     CocActionAsync('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings for CoCList
" Show all diagnostics
nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions
nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
" Show commands
nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols
nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item
nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item
nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list
nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>

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

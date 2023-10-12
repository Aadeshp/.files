set rtp+=~/.vim/bundle/Vundle.vim
call plug#begin('~/.vim/plugged')

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
" {
    nnoremap <c-p> :Files<cr>
    nnoremap <silent> <leader>o :Tags<cr>
    nnoremap <silent> <leader>O :BTags<cr>
    nnoremap <silent> <leader>; :BLines<cr>
    nnoremap <silent> <leader>r :Rg <c-r><c-w><return>
    nnoremap <c-g> :Rg<cr>

    cnoreabbrev rg Rg
    cnoreabbrev commits Commits
    cnoreabbrev bcommits BCommits

    let g:fzf_colors =
    \ { 'fg':      ['fg', 'CursorLine'],
      \ 'bg':      ['bg', 'Normal'],
      \ 'hl':      ['fg', 'Statement'],
      \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
      \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
      \ 'hl+':     ['fg', 'Structure'],
      \ 'info':    ['fg', 'PreProc'],
      \ 'border':  ['fg', 'Ignore'],
      \ 'prompt':  ['fg', 'Statement'],
      \ 'pointer': ['fg', 'Exception'],
      \ 'marker':  ['fg', 'Keyword'],
      \ 'spinner': ['fg', 'Label'],
      \ 'header':  ['fg', 'Comment'] }

	let g:fzf_layout = { 'down': '30%' }

    command! -bang -nargs=* Rg
      \ call fzf#vim#grep(
      \   'rg --column --line-number --no-heading --smart-case --color always --colors path:fg:green --colors line:fg:yellow --colors match:fg:blue '.shellescape(<q-args>), 1,
      \   <bang>0 ? fzf#vim#with_preview('up:60%')
      \           : fzf#vim#with_preview('right:50%:hidden', '?'),
      \   <bang>0)
" }

Plug 'scrooloose/nerdtree'
" {
    map <C-n> :NERDTreeToggle<CR>
    nnoremap ` <c-w><c-w>

    set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.pyc,*.db,*.sqlite

    let g:NERDTreeChDirMode = 2
    let g:NERDTreeIgnore = ['\.rbc$', '\.pyc$', '\.db$', '\.sqlite$', '__pycache__']
    let g:NERDTreeSortOrder = ['^__\.py$', '\/$', '*', '\.swp$', '\.bak$', '\~$']
    let g:NERDTreeShowBookmarks = 1
    let g:nerdtree_tabs_focus_on_files = 1
    let g:NERDTreeMapOpenInTabSilent = '<RightMouse>'
    let g:NERDTreeWinSize = 50
" }

"Plug 'vim-syntastic/syntastic'
" {
    set statusline+=%#warningmsg#
    set statusline+=%{SyntasticStatuslineFlag()}
    set statusline+=%*

    let g:syntastic_always_populate_loc_list = 1
    let g:syntastic_auto_loc_list = 1
    let g:syntastic_check_on_open = 0
    let g:syntastic_check_on_wq = 0
    let g:syntastic_loc_list_height = 3
" }

Plug 'majutsushi/tagbar'
" {
    let g:tagbar_ctags_bin = '/usr/local/Cellar/ctags/5.8_1/bin/ctags'
" }

Plug 'hashivim/vim-terraform'

Plug 'jacoborus/tender.vim'

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
" {
	let g:airline_powerline_fonts=1
	let g:airline_theme='nord'
" }

Plug 'tpope/vim-fugitive'

Plug 'matze/vim-move'
" { 
    let g:move_key_modifier = 'C'
" }

Plug 'ludovicchabant/vim-gutentags'
" {
	let g:gutentags_trace = 1
" }

"Plug 'Valloric/YouCompleteMe'
"{
    let g:ycm_global_ycm_extra_conf = '~/.ycm_extra_conf.py'
    let g:ycm_show_diagnostics_ui = 0
    let g:ycm_confirm_extra_conf = 1
    let g:ycm_semantic_triggers =  {
          \   'c' : ['->', '.'],
          \   'objc' : ['->', '.'],
          \   'ocaml' : ['.', '#'],
          \   'cpp,objcpp' : ['->', '.', '::'],
          \   'perl' : ['->'],
          \   'php' : ['->', '::'],
          \   'cs,java,javascript,d,python,perl6,scala,vb,elixir,go,typescript' : ['.'],
          \   'vim' : ['re![_a-zA-Z]+[_\w]*\.'],
          \   'ruby' : ['.', '::'],
          \   'lua' : ['.', ':'],
          \   'erlang' : [':'],
          \ }
" }

Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
" {
    let g:go_version_warning = 0

    let g:go_list_type = "quickfix"
    let g:go_fmt_command = "goimports"
    let g:go_fmt_fail_silently = 1
    "let g:go_fmt_autosave = 0
    let g:go_highlight_types = 1
    let g:go_highlight_fields = 1
    let g:go_highlight_functions = 1
    let g:go_highlight_function_calls = 1
    let g:go_highlight_methods = 1
    let g:go_highlight_operators = 1
    let g:go_highlight_build_constraints = 1
    let g:go_highlight_structs = 1
    let g:go_highlight_generate_tags = 1
    let g:go_highlight_space_tab_error = 0
    let g:go_highlight_array_whitespace_error = 0
    let g:go_highlight_trailing_whitespace_error = 0
    let g:go_highlight_extra_types = 1


    autocmd FileType go nmap <leader>c :GoCallers<CR><CR>
    autocmd FileType go nmap <leader>i :GoImplements<CR><CR>
    autocmd FileType go nmap <leader>d :GoDescribe<CR><CR>
" }

Plug 'easymotion/vim-easymotion'
" {
    " Gif config
    map  ? <Plug>(easymotion-sn)
    omap ? <Plug>(easymotion-tn)

    let g:EasyMotion_smartcase = 1

    hi link EasyMotionTarget Structure
    hi link EasyMotionShade  Comment
    hi link EasyMotionTarget2First Statement
    hi link EasyMotionTarget2Second Statement
    hi link EasyMotionIncSearch Statement
" }

Plug 'tpope/vim-eunuch'
" {
    cnoreabbrev rename Rename
    cnoreabbrev chmod Chmod
    cnoreabbrev sudowrite SudoWrite
" }

Plug 'bfrg/vim-cpp-modern'
" {
    let g:cpp_simple_highlight = 1
    let g:cpp_member_highlight = 1
    let g:cpp_attributes_highlight = 1
" }

call plug#end()

syntax enable
set autoindent
set si
"set expandtab
set tabstop=4
set shiftwidth=4
set softtabstop=-1
"set background=dark
set number
set smartindent
set incsearch
set splitright
set splitbelow
set backspace=indent,eol,start
set clipboard=unnamed
filetype indent plugin on

"set hlsearch
set shiftwidth=4
set tabstop=4
set softtabstop=4

colorscheme nord

autocmd FileType gitcommit set textwidth=80
autocmd FileType c set colorcolumn=80
autocmd FileType python set colorcolumn=80
autocmd FileType typescript set colorcolumn=80
autocmd FileType javascript set colorcolumn=80

autocmd BufNewFile,BufRead *.tsx,*.jsx set colorcolumn=80

autocmd BufEnter *.{js,jsx,ts,tsx} :syntax sync fromstart
autocmd BufLeave *.{js,jsx,ts,tsx} :syntax sync clear

autocmd BufEnter,BufNew *.star set shiftwidth=4 tabstop=4 softtabstop=4 expandtab
autocmd BufEnter,BufNew *.tf set shiftwidth=4 tabstop=4 softtabstop=4 expandtab
autocmd BufEnter,BufNew *.proto set shiftwidth=4 tabstop=4 softtabstop=4 expandtab
autocmd BufEnter,BufNew *.{yaml,yml} set shiftwidth=2 tabstop=2 softtabstop=2 expandtab
autocmd BufEnter,BufNew *.{js,jsx,ts,tsx} set shiftwidth=2 tabstop=2 softtabstop=2 expandtab
autocmd BufEnter,BufNew *.tf set shiftwidth=2 tabstop=2 softtabstop=2 expandtab
autocmd BufEnter,BufNew *.py set shiftwidth=4 tabstop=4 softtabstop=4 expandtab
"autocmd FileType * set colorcolumn=120

autocmd FileType cpp set shiftwidth=4 tabstop=4 softtabstop=4 expandtab
autocmd FileType hpp set shiftwidth=4 tabstop=4 softtabstop=4 expandtab
autocmd FileType c set shiftwidth=4 tabstop=4 softtabstop=4 expandtab
autocmd FileType h set shiftwidth=4 tabstop=4 softtabstop=4 expandtab
autocmd FileType idl set shiftwidth=4 tabstop=4 softtabstop=4 expandtab
autocmd FileType python set shiftwidth=4 tabstop=4 softtabstop=4 expandtab
autocmd FileType javascript set shiftwidth=4 tabstop=4 softtabstop=4 expandtab
autocmd FileType tsx set shiftwidth=4 tabstop=4 softtabstop=4 expandtab
autocmd FileType jsx set shiftwidth=4 tabstop=4 softtabstop=4 expandtab
autocmd FileType go set shiftwidth=4 tabstop=4 softtabstop=4 expandtab

" Shortcuts
map ; :
"nnoremap <C-\> <S-%>
imap ` <Esc>
vmap ` <Esc>

" cscope

" Checks if vim was compiled with the
" --enable-cscope flag, if not then
" it'll recompile it
if has("cscope")

    """"""""""""" Standard cscope/vim boilerplate

    " use both cscope and ctag for 'ctrl-]', ':ta', and 'vim -t'
    set cscopetag

    " check cscope for definition of a symbol before checking ctags: set to 1
    " if you want the reverse search order.
    set csto=0

    " add any cscope database in current directory
    if filereadable("cscope.out")
    set nocscopeverbose
        cs add cscope.out
    set cscopeverbose
    " else add the database pointed to by environment variable 
    elseif $CSCOPE_DB != ""
        cs add $CSCOPE_DB
    endif

    """"""""""""" My cscope/vim key mappings
    "
    " The following maps all invoke one of the following cscope search types:
    "
    "   's'   symbol: find all references to the token under cursor
    "   'g'   global: find global definition(s) of the token under cursor
    "   'c'   calls:  find all calls to the function name under cursor
    "   't'   text:   find all instances of the text under cursor
    "   'e'   egrep:  egrep search for the word under cursor
    "   'f'   file:   open the filename under cursor
    "   'i'   includes: find files that include the filename under cursor
    "   'd'   called: find functions that function under cursor calls
    "
    map <Leader>s :cs find s <C-R>=expand("<cword>")<CR><CR>      
    map <Leader>g :cs find g <C-R>=expand("<cword>")<CR><CR>      
    map <Leader>c :cs find c <C-R>=expand("<cword>")<CR><CR>      

    map :csg :cs find g
    map :css :cs find s
    map :csc :cs find c
    map <C-\> :vsp <CR>:exec("tag ".expand("<cword>"))<CR>
endif

" From vim.wikia.com
"
" In the [below] mapping, I use 'find' to collect the C/C++ source code files
" and (re)create the cscope database; then 'kill -1' to kill all cscope
" database connections and finally, the newly created 'cscope.out' database is
" added by 'cs add cscope.out'.
"
" There are two limitations in this key mapping:
"
" the current directory should be the root path of the project
" I don't know how to get the current cscope data connection number, so that I
" use 'kill -1' to kill 'all' cscope database connections, since actually I
" always only create one connections in one Vim instance. It is not practical
" if you are using multiple data connections in one Vim instance.
func ResetCScopeDB()
    :!find . -iname '*.c' -o -iname '*.cpp' -o -iname '*.h' -o -iname '*.hpp' | grep -v 'build/\|node_modules\|\.git/' > .cscope.files &&
        \cscope -q -k -b -i .cscope.files -f .cscope.out && 
    \echo Built cscope database from $(cat .cscope.files | wc -l) files
    :cs kill -1
    :cs add .cscope.out
endfunc
map HH :call ResetCScopeDB()<Return>

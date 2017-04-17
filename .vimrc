set nocompatible
syntax on
set expandtab
set tabstop=8 "the size that <TAB>'s appear.
set shiftwidth=4
set softtabstop=4
set splitright
set ignorecase
set smartcase
set number

"Make sure backspace works
set backspace=indent,eol,start

"let @w='vGgq``vgggq' "For rewrapping lines
set ff=unix

filetype plugin indent on
autocmd FileType r setlocal keywordprg=Rhelp "Changes SHIFT-K to get R man pages
autocmd Filetype html,xml,xsl source ~/.vim/scripts/closetag.vim 
autocmd Filetype html,xml,xsl,java setlocal tabstop=2
autocmd Filetype html,xml,xsl,java setlocal shiftwidth=2
autocmd Filetype html,xml,xsl,java setlocal softtabstop=2

autocmd Filetype text setlocal textwidth=80
autocmd FileType text setlocal keywordprg=sdcv "Changes SHIFT-K to pull up dictionary
autocmd Filetype tex setlocal indentexpr=

autocmd Filetype tsv setlocal noexpandtab
autocmd Filetype tsv setlocal softtabstop=20

" Jumps to the last place I was editting when I reopen a file
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

"2 spaces if you want it
function! TwoSpace()
    setlocal tabstop=2
    setlocal shiftwidth=2
    setlocal softtabstop=2
endfunction
command TwoSpace call TwoSpace()

"Pathogen
execute pathogen#infect()

"Configure skeletons (with tskeleton)
autocmd BufNewFile *.py TSkeletonSetup plain.py
autocmd BufNewFile *.c TSkeletonSetup plain.c
autocmd BufNewFile *.R TSkeletonSetup plain.R
autocmd BufNewFile *.java TSkeletonSetup plain.java
autocmd BufNewFile *.tex TSkeletonSetup plain.tex

let maplocalleader = ","

"Manage folds
set foldmethod=syntax
set foldlevel=10
set foldnestmax=10

"Look recursively up for tags folder
set tags=./tags;/

"Use ALT-] to open tag in a new vertical split
map ] :vsp <CR>:exec("tag ".expand("<cword>"))<CR>

"Look farther back for syntax
autocmd BufEnter * :syntax sync fromstart

"*.md is Markdown
au BufNewFile,BufRead *.md set filetype=markdown
autocmd Filetype markdown setlocal textwidth=80

let g:vimrplugin_term="mate-terminal"
let vimrplugin_assign=0

autocmd FileType crontab setlocal nowritebackup

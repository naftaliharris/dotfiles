set nocompatible
syntax on
set expandtab
set tabstop=4
set shiftwidth=4
set softtabstop=4

"let @w='vGgq``vgggq' "For rewrapping lines
set ff=unix

"Add thesaurus support:
set thesaurus+=/home/naftali/docs/Books/thesaurus/mthesaur.txt

filetype plugin indent on
autocmd FileType r setlocal keywordprg=Rhelp "Changes SHIFT-K to get R man pages
autocmd Filetype html,xml,xsl source ~/.vim/scripts/closetag.vim 
autocmd Filetype html,xml,xsl setlocal tabstop=2
autocmd Filetype html,xml,xsl setlocal shiftwidth=2
autocmd Filetype html,xml,xsl setlocal softtabstop=2

let vimrplugin_screenplugin = 0

"Configure skeletons (with tskeleton)
autocmd BufNewFile *.py TSkeletonSetup plain.py
autocmd BufNewFile *.c TSkeletonSetup plain.c
autocmd BufNewFile *.R TSkeletonSetup plain.R
autocmd BufNewFile *.java TSkeletonSetup plain.java

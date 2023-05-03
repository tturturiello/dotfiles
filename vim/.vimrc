"let $VIMDIR = "~/.vim"
"if has('win32') | let $VIMDIR = "~/vimfiles"| endif

if has('win32') | let $VIMDIR = "~/vimfiles"
else | let $VIMDIR = "~/.vim" | endif

source $VIMDIR/conf/plugins.vim
source $VIMDIR/conf/editor.vim
source $VIMDIR/conf/bindings.vim

" ===================================
" Author: Timothy Turturiello
" ===================================
"                  .                    
"    ############..... ##############   
"    ############......##############   
"      ########..........##########     
"      ########........##########       
"      ########.......##########        
"      ########.....##########..        
"      ########....##########.....      
"    ..########..##########.........    
"  ....########.#########.............  
"    ..##############JJJ............    
"      ##############.............      
"      ############.JJJ.JJJJJJJJJJ      
"      ##########...JJ...JJ..JJ  JJ     
"      ########....JJ...JJ..JJ  JJ      
"      ######......JJJ..JJJ JJJ JJJ     
"      ####    .........                
"                .....                  
"                  .         
"                  
" ============= LEGEND ==============
" =*  	document section
" -*	sub section
" >>  	command/plugin command
" DEP	plugin dependencies
" WREF 	web reference
" ===================================


if has('win32') | let $VIMDIR = "~/vimfiles"
else | let $VIMDIR = "~/.vim" | endif

let $PLUG_REPO = "$VIMDIR/plugged/"
let $PLUG_CONF = "$VIMDIR/conf/plugins/"

let g:VIMFILESDIR=$VIMDIR
let g:author="Timothy Turturiello"
let g:DoxygenToolkit_authorName=g:author


" ========= PLUGIN MANAGER ========== 
call plug#begin($PLUG_REPO)
" ------ Programming support --------
" DEP: nodejs >= 12.12
Plug 'neoclide/coc.nvim', {'branch': 'release', 'do': ':CocInstall coc-json coc-tsserver coc-marketplace'}
Plug 'tpope/vim-commentary'
Plug 'jiangmiao/auto-pairs'
Plug 'vim-test/vim-test'

" ------------ Editing --------------
Plug 'vim-scripts/csv.vim'
Plug 'preservim/nerdtree'

" ------- Version Control Support --------
Plug 'tpope/vim-fugitive' " Git
Plug 'drbeco/vimtemplates'
Plug 'tpope/vim-dispatch'
"Plug 'thinca/vim-quickrun' nice try but no

" -------------- GUI ----------------
Plug 'itchyny/lightline.vim'  
Plug 'cocopon/iceberg.vim'
" -----------------------------------
call plug#end()
" ===================================

" ============ CONFIG ==============
source $PLUG_CONF/lightline.vim
source $PLUG_CONF/coc-nvim.vim
source $PLUG_CONF/vim-fugitive.vim
source $PLUG_CONF/nerdtree.vim
" ----------- Vanilla --------------
" source $PLUG_CONF/netrw.vim
source $PLUG_CONF/vimdrasil.vim
source $PLUG_CONF/vim-sensible.vim
source $PLUG_CONF/build-run.vim
source $PLUG_CONF/templates.vim
source $PLUG_CONF/vim-test.vim
" ============================== 

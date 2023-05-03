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

filetype on
filetype indent on
filetype plugin indent on
syntax on
syntax enable
colorscheme iceberg


map <Space> <Leader>


"nnoremap <Leader>f :/<c-r>=expand("<cword>")<cr>\c<cr>                                                                                                                1 nnoremap <Leader>r :!
nnoremap <Leader>S :%s@<c-r>=expand("<cword>")<cr>@
nnoremap <Leader>s :s@<c-r>=expand("<cword>")<cr>@
nnoremap <Leader>e :
nnoremap <Leader>r :! 
nnoremap XX :wqa<CR>
nnoremap XQ :qa!<CR>
let g:elite_mode=1 " no arrows

set cmdheight=1 " Give more or less space for displaying messages.
set updatetime=300
set background=dark
set shortmess+=c " Don't pass messages to ins-completion-menu

set autoindent
set smartindent
set cindent
set shiftwidth=4

set smarttab
set rnu
set nu
set encoding=utf-8
set hidden " Required for operations modifying multiple buffers like rename
set noswapfile
set nobackup " Some servers have issues with backup files
set nowritebackup
set nowrap " go over the window
set cursorline " underline cursor line

" font
set guifont=*
set guifont=?
set guifont=Lucida_Console:h10

nmap Q gq
" nmap <nowait> :w <leader>w
" nmap <nowait> :so% <leader>so
" nmap q: <Nop>

" Disable arrow movement, resize splits instead.
if get(g:, 'elite_mode')
    nnoremap <Up>    :resize -2<CR>
    nnoremap <Down>  :resize +2<CR>
    nnoremap <Left>  :vertical resize -2<CR>
    nnoremap <Right> :vertical resize +2<CR>
endif

if has("nvim-0.5.0") || has("patch-8.1.1564")
    " Merge signcolumn and number column into one
    set signcolumn=number
else
    set signcolumn=yes
endif


function! ResCur()
    if line("'\"") <= line("$")
	normal! g`"
	return 1
    endif
endfunction


augroup resCur
    autocmd!
    autocmd BufWinEnter * call ResCur()
augroup END

" Author: VonHeikemen
" Open Netrw on the directory of the current file
"nnoremap <leader>dd :Lexplore %:p:h<CR>
nnoremap <C-m> :Lexplore %:p:h<CR>

" Toggle the Netrw window
"nnoremap <Leader>da :Lexplore<CR>
nnoremap <C-n> :Lexplore<CR>

if &columns < 90
  " If the screen is small, occupy half
  let g:netrw_winsize = 50
else
  " else take 30%
  let g:netrw_winsize = 14
endif

" Sync current directory and browsing directory
" This solves the problem with the 'move' command
let g:netrw_keepdir = 0

" Hide banner
let g:netrw_banner = 0

" Hide dotfiles
let g:netrw_list_hide = '\(^\|\s\s\)\zs\.\S\+'

" A better copy command
let g:netrw_localcopydircmd = 'cp -r'

let g:netrw_localrmdir='rm -r'

" Don't change the view if you open a directory
let g:netrw_liststyle = 3


" Delete a non-empty directory
function! NetrwRemoveRecursive()
  if &filetype ==# 'netrw'
    " Prepare the delete command.
    " Make it so that is triggered by just pressing Enter
    cnoremap <buffer> <CR> rm -r<CR>

    " Unmark all files (don't want to delete anything by accident)
    normal mu

    " Mark the file/directory under the cursor
    normal mf

    " Show the prompt to enter the command
    " In here you either press Enter to confirm
    " or press ctrl + c to abort.
    " Don't do anything else!
    try
      normal mx
    catch
      echo "Canceled"
    endtry

    " Undo the Enter keymap
    cunmap <buffer> <CR>
  endif
endfunction

" Better keymaps for Netrw
function! NetrwMapping()
  " Close Netrw window
  nmap <buffer> <leader>dd :Lexplore<CR>

  " Go to file and close Netrw window
  nmap <buffer> L <CR>:Lexplore<CR>

  " Go down a directory / open file
  nmap <buffer> l <CR>

  " Go back in history
  nmap <buffer> H u

  " Go up a directory
  nmap <buffer> h -^

  " Toggle dotfiles
  nmap <buffer> . gh

  " Toggle the mark on a file
  "nmap <buffer> <TAB> mf
  
  " Unmark all files in the buffer
  "nmap <buffer> <S-TAB> mF
  
  " Open a file keeping the focus on Netrw (switching up)
  nmap <buffer> <TAB> <CR><C-w><C-p>j

  " Open a file keeping the focus on Netrw (switching down)
  nmap <buffer> <S-TAB> <CR><C-w><C-p>k

  " Unmark all files
  nmap <buffer> <Leader><TAB> mu

  " 'Bookmark' a directory
  nmap <buffer> bb mb

  " Delete the most recent directory bookmark
  nmap <buffer> bd mB

  " Got to a directory on the most recent bookmark
  nmap <buffer> bl gb

  " Create a file
  "nmap <buffer> fn %:w<CR>:buffer #<CR>
  nmap <buffer> fn %:w<CR>:q<CR>:Lexplore<CR>

  " Rename a file
  nmap <buffer> fr R

  " Copy marked files
  nmap <buffer> fc mc
  
  " Copy marked files in the directory under cursor
  nmap <buffer> fC mtmc

  " Move marked files
  nmap <buffer> fx mm

  " Move marked files in the directory under cursor
  nmap <buffer> fX mtmm

  " Execute a command on marked files
  nmap <buffer> f; mx

  " Show the list of marked files
  nmap <buffer> fl :echo join(netrw#Expose("netrwmarkfilelist"), "\n")<CR>

  " Show the current target directory
  nmap <buffer> fq :echo 'Target:' . netrw#Expose("netrwmftgt")<CR>

  " Set the directory under the cursor as the current target
  nmap <buffer> fd mtfq

  " Delete a file
  nmap <buffer> <backspace> :call NetrwRemoveRecursive()<CR>

  " Close the preview window
  nmap <buffer> P <C-w>z
endfunction

augroup netrw_events
    autocmd!
    autocmd filetype netrw call NetrwMapping()
    autocmd filetype netrw set cursorline!
    autocmd WinEnter * if winnr('$') == 1 && getbufvar(winbufnr(winnr()), "&filetype") == "netrw" || &buftype == 'quickfix' |q|endif
augroup END

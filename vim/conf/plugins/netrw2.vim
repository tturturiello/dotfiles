let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_browse_split = 4
let g:netrw_altv = 1
let g:netrw_winsize = 17
let g:netrw_keepdir = 0 " sync current and browsing dir
let g:netrw_localcopydircmd = 'cp -r'
hi! link netrwMarkFile Search " Highlight marked files in the same way search matches are

let g:NetrwIsOpen=0


nmap <silent> <leader>dd :silent Lexplore<CR> " open Netrw in the directory of the current file
nmap <silent> <leader>da :silent Lexplore %:p:h<CR> " open Netrw in the current working directory (it causes <CR> open Netrw)


" Remove files recursively
function! NetrwRemoveRecursive()
  if &filetype ==# 'netrw'
    cnoremap <buffer> <CR> rm -r<CR>
    normal mu
    normal mf
    try
      normal mx
    catch
      echo "Canceled"
    endtry
    cunmap <buffer> <CR>
  endif
endfunction


" Key mappings here
function! NetrwMapping()
" >> H: go back in history (disabled)
" FIXME: toggle netrw won't work anymore
"  nmap <buffer> H u 
" >> h: go up a directory.
  nmap <buffer> h -^ 
" >> L: open a file and close Netrw
  nmap <buffer> L <CR>:Lexplore<CR> 
" >> l: open a directory or a file
  nmap <buffer> l <CR> 
" >> TAB: open a directory and change the focus or open a file and stay with the focus going down
  nmap <buffer> <TAB> <CR><C-w><C-p>j
" >> TAB: open a directory and change the focus or open a file and stay with the focus going up
  nmap <buffer> <S-TAB> <CR><C-w><C-p>k
" >> .: toggle the dotfiles
  nmap <buffer> . gh 
" >> P: close the preview window
  nmap <buffer> P <C-w>z 
" >> <C-n>|<C-m> close Netrw if opens without any bug
  "nmap <buffer> <C-m> :Lexplore<CR>
" ------------- Marks ---------------
" >> Tab: toggles the mark on a file or director(disabled)
  " nmap <buffer> <TAB> mf
" >> Shift Tab: unmark all the files in the current buffer (disabled)
  " nmap <buffer> <S-TAB> mF
" >> Leader Tab: Will remove all the marks on all files (disabled)
  " nmap <buffer> <Leader><TAB> mu
" >> show a list of marked files
  nmap <buffer> fl :echo join(netrw#Expose("netrwmarkfilelist"), "\n")<CR>
" >> show the target directory, just in case we want to avoid the banner
  nmap <buffer> fq :echo 'Target:' . netrw#Expose("netrwmftgt")<CR>
" --------- File managing -----------
" >> fn: create a file
  nmap <buffer> fn %:w<CR>:buffer #<CR>
" >> fr: rename a file
  nmap <buffer> fr R
" >> fc: copy the marked file
  nmap <buffer> fc mc
" >> fC: after you mark your files you can put the cursor on a directory and this will assign the target directory and copy in one step
  nmap <buffer> fC mtmc
" >> fm: move the marked file
  nmap <buffer> fm mm
" >> fM: after you mark your files you can put the cursor on a file and this will assign the target file and copy in one step
  nmap <buffer> fM mtmm
" >> f!: running external command on the marked file
  nmap <buffer> f! mx
" >> fD: remove files recursively
  nmap <buffer> fD :call NetrwRemoveRecursive()<CR>
" ----------- Bookmarks -------------
" >> bb: to create a bookmark
  nmap <buffer> bb mb
" >> bd: to remove the most recent bookmark
  nmap <buffer> bd mB
" >> bj: to jump to the most recent bookmark
  nmap <buffer> bj gb
endfunction


augroup netrw_mapping
  autocmd!
  autocmd filetype netrw call NetrwMapping()
augroup END


" Close vim if final buffer is netrw or the quickfix
augroup last_close
  autocmd!
  autocmd WinEnter * if winnr('$') == 1 && getbufvar(winbufnr(winnr()), "&filetype") == "netrw" || &buftype == 'quickfix' |q|endif
augroup END


" Open netrw starting vim
"augroup ProjectDrawer
"  autocmd!
"  autocmd VimEnter * :Lexplore<CR>
"augroup END

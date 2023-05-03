function! JavaClass()
    return
	\ "class % {"
        \  "/**\n"
        \. "}"
endfunction


"let g:file_template_default = {}
"let g:file_template_default['java'] = 'skeleton'
"au BufNewFile *.java :LoadTemplate skeleton
"au BufNewFile main.go :LoadTemplate main-skeleton

"WREF: https://stackoverflow.com/questions/3785320/how-to-use-a-template-in-vim
au BufNewFile *.java r ~/.vim/templates/skeleton.java
au BufNewFile main.go r ~/.vim/templates/main-skeleton.go



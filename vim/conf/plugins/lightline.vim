" WREF  https://github.com/itchyny/lightline.vim/blob/master/README.md 
let g:airline_theme='one'
let g:one_allow_italics = 1
let lightline = {
      \ 'colorscheme': 'one',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'FugitiveHead'
      \ },
      \ }

"WREF: https://www.reddit.com/r/vim/comments/9ydreq/vanilla_solutions_to_git_blame/

"TODO:
" git reset --hard <id-commit> (move branch to a specific commit)
" git branch -D <branch-name> (delete a branch)
" git reset <name-ot-file> (unstage committed files, if no name is provided, every last committed files will be reset)


nmap <leader>gg :call Graph()<CR> 


function! Graph()
    ter ++curwin git log --graph --reflog --abbrev-commit --decorate --format=
	    \format:"\%C(blue)\%h\%C(reset) - 
	    \\%C(green)[\%ar]\%C(reset)\%C(red)\%d\%C(reset)
	    \: \%C(white)\%s\%C(reset) -\%C(blue) 
	    \\%an\%C(reset)" --all
    call GitMappingGraph()
endfunction


function! GitCheckout(branch)
    bp
    execute 'ter ++curwin git checkout ' a:branch
    call GitMappingGeneric()
endfunction


function! GitMerge(branch)
    bp
    execute 'ter ++curwin git merge ' a:branch
    call GitMappingGeneric()
endfunction


function! CommitInfo(commit)
    if bufnr("git_commitinfo") < 0
	set splitright
	execute 'vert term git show --notes ' a:commit 
    	file git_commitinfo
	call GitMappingGeneric()
    endif
endfunction


function! GitMappingGraph()
    call GitMappingGeneric()
    nmap <buffer> <TAB> /\w\+\s\-\s\[<CR>
    nmap <buffer> <s-TAB> ?\w\+\s\-\s\[<CR>
    nmap <buffer> <leader>] /):<CR>nb
    nmap <buffer> <leader>[ ?):<CR>b
endfunction


function! GitMappingGeneric()
    nmap <buffer>q :bp<CR>
    nmap <buffer>r :bp<CR>:call Graph()<CR>
    nmap <buffer>mt :call GitMergeTool()<CR>
    nn <buffer> <CR> q
    nmap <buffer> <leader>a. :!git add .
    nmap <buffer> <leader>cc :!git commit <CR><leader>gr
    nmap <buffer> <leader>ci :call CommitInfo(expand('<cword>'))<CR>
    nmap <buffer> <leader>st :!git status<CR>

    nmap <buffer> <leader>gc :call GitCheckout(expand('<cword>'))<CR>
    nmap <buffer> <leader>gm :call GitMerge(expand('<cword>'))<CR>

    nmap <buffer> <leader>gg q<CR>:call Graph()<CR>
endfunction


function! GitMergeTool()
    bp 
    ter ++curwin git mergetool -t vimdiff
    file git_mergetool
    call GitMappingMergeTool()
endfunction


function! Commit()
    bp
    execute 'ter ++curwin git commit'
    call GitMappingGeneric()
endfunction


function! GitMappingMergeTool() 
    nmap <buffer> q :call Commit()<CR>
    tmap <C-k> :diffg BA<CR>
    tmap <C-h> :diffg LO<CR>
    tmap <C-l> :diffg RE<CR>
    tmap ZZ :wqa<CR>
    tmap ZQ :bpa<CR>
endfunction

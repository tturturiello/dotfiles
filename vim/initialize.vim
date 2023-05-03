function UnixInit() 
  :!curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim &&
			  \ cp .vimrc ~/.vimrc &&
  			  \ cp -r ./conf ~/.vim
endfunction



if has('win32')
  " Powershell required
  :!iwr -useb https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim |`
    ni $HOME/vimfiles/autoload/plug.vim -Force
  :PlugInstall
else
  :call UnixInit()
  source $HOME/.vimrc
  :PlugInstall 
endif 


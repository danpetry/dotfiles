mkdir -p ~/.local/share/fonts
wget https://github.com/powerline/powerline/raw/develop/font/PowerlineSymbols.otf -O ~/.local/share/fonts/PowerlineSymbols.otf
fc-cache -v -f
mkdir -p ~/.config/fontconfig/conf.d/
wget https://github.com/powerline/powerline/raw/develop/font/10-powerline-symbols.conf -O ~/.config/fontconfig/conf.d/10-powerline-symbols.conf

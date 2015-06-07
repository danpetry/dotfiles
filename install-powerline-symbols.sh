mkdir -p ~/.fonts
wget https://github.com/powerline/powerline/raw/develop/font/PowerlineSymbols.otf -O ~/.fonts/PowerlineSymbols.otf
fc-cache -vf ~/.fonts/
wget https://github.com/powerline/powerline/raw/develop/font/10-powerline-symbols.conf -O /tmp/10-powerline-symbols.conf
mkdir -p ~/.config/fontconfig/conf.d/
mv /tmp/10-powerline-symbols.conf ~/.config/fontconfig/conf.d/

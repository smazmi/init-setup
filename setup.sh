#!/bin/bash

# Define directories and files
ZDOTDIR="$HOME/.config/zsh"
XDG_DATA_HOME="${XDG_DATA_HOME:-$HOME/.local/share}"
XDG_CACHE_HOME="${XDG_CACHE_HOME:-$HOME/.cache}"
XDG_CONFIG_HOME="${XDG_CONFIG_HOME:-$HOME/.config}"
XDG_STATE_HOME="${XDG_STATE_HOME:-$HOME/.local/state}"

# 1. Export ZDOTDIR
echo 'export ZDOTDIR="$HOME/.config/zsh"' | sudo tee -a /etc/zsh/zprofile

# 2-16. Create directories and files
mkdir -p "$XDG_DATA_HOME/gnupg/"
mkdir -p "$XDG_CACHE_HOME/nv/"
mkdir -p "$XDG_DATA_HOME/nvm/"
mkdir -p "$HOME/.local/share/cargo/"
mkdir -p "$HOME/.local/share/rustup/"
mkdir -p "$XDG_CONFIG_HOME/parallel/"
mkdir -p "$XDG_CONFIG_HOME/npm/"
mkdir -p "$XDG_DATA_HOME/gradle/"
mkdir -p "$XDG_DATA_HOME/go/"
mkdir -p "$XDG_DATA_HOME/android/"
mkdir -p "$XDG_CACHE_HOME/npm/"
mkdir -p "$XDG_CONFIG_HOME/npm/config/"
mkdir -p "$XDG_STATE_HOME/npm/logs/"
touch "$XDG_DATA_HOME/node_repl_history"
mkdir -p "$HOME/python"

# 8. Create npmrc file
cat <<EOL >"$XDG_CONFIG_HOME/npm/npmrc"
cache=${XDG_CACHE_HOME}/npm
init-module=${XDG_CONFIG_HOME}/npm/config/npm-init.js
logs-dir=${XDG_STATE_HOME}/npm/logs
EOL

# 12. Create wgetrc file
touch "$XDG_CONFIG_HOME/wgetrc"

# 14. Create npm-init.js file
touch "$XDG_CONFIG_HOME/npm/config/npm-init.js"

# 17. Create pythonrc file
cat <<EOL >"$HOME/python/pythonrc"
def is_vanilla() -> bool:                                                                  
    import sys                                                                             
    return not hasattr(__builtins__, '__IPYTHON__') and 'bpython' not in sys.argv[0]       
                                                                                               
def setup_history():                                                                       
    import os                                                                              
    import atexit                                                                          
    import readline                                                                        
    from pathlib import Path                                                               
                                                                                               
    if state_home := os.environ.get('XDG_STATE_HOME'):                                     
        state_home = Path(state_home)                                                      
    else:                                                                                  
        state_home = Path.home() / '.local' / 'state'                                      
                                                                                               
    history: Path = state_home / 'python_history'                                          
                                                                                               
    readline.read_history_file(str(history))                                               
    atexit.register(readline.write_history_file, str(history))                             
                                                                                               
if is_vanilla():                                                                           
    setup_history()  
EOL

# 18. Create zlua file
touch "$XDG_DATA_HOME/zlua"

# # Install zsh plugins
# ZSH_CUSTOM="$ZDOTDIR/custom/plugins"
# mkdir -p "$ZSH_CUSTOM"
# git clone https://github.com/hlissner/zsh-autopair.git "$ZSH_CUSTOM/zsh-autopair"
# git clone https://github.com/Aloxaf/fzf-tab.git "$ZSH_CUSTOM/fzf-tab"
# git clone https://github.com/pierpo/fzf-docker.git "$ZSH_CUSTOM/fzf-docker"

# List of applications to install
apps=(
	bat
	bc
	discord
	dnsmasq
	docker
	docker-compose
	eog
	fd
	gedit
	gimp
	git
	github-cli
	glow
	gnome-calculator
	go
	google-chrome
	gradle
	htop
	inxi
	iptables-nft
	lazygit
	libreoffice-still
	llogin
	man-db
	man-pages
	namcap
	neovim
	net-tools
	nmap
	noto-fonts-emoji
	obs-studio
	obsidian
	okular
	openbsd-netcat
	p7zip
	partitionmanager
	plymouth
	plymouth-theme-lone-git
	python-pip
	python-pynvim
	ripgrep
	scrcpy
	spotify
	stow
	stremio
	telegram-desktop
	tgpt-bin
	tmux
	unarchiver
	unzip
	ventoy-bin
	visual-studio-code-bin
	whatsapp-for-linux
	wireguard-tools
	xdg-ninja
	zoxide
)

# Install applications using yay
for app in "${apps[@]}"; do
	yay -S --noconfirm "$app"
done

echo "System setup complete!"

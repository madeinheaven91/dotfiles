# Set the directory we want to store zinit and plugins
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"

# Download Zinit, if it's not there yet
if [ ! -d "$ZINIT_HOME" ]; then
   mkdir -p "$(dirname $ZINIT_HOME)"
   git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi

# Source/Load zinit
source "${ZINIT_HOME}/zinit.zsh"

# Add in zsh plugins
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions
zinit light Aloxaf/fzf-tab

# Add in snippets
zinit snippet OMZP::git
zinit snippet OMZP::sudo
zinit snippet OMZP::command-not-found

# Load completions
autoload -Uz compinit && compinit

zinit cdreplay -q

# Keybindings
bindkey -e
bindkey '^p' history-search-backward
bindkey '^n' history-search-forward
bindkey '^[w' kill-region

# History
HISTSIZE=5000
HISTFILE=~/.zsh_history
SAVEHIST=$HISTSIZE
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups

# Completion styling
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu no
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'
zstyle ':fzf-tab:complete:__zoxide_z:*' fzf-preview 'ls --color $realpath'

# ENV
export PATH="$HOME/.tmuxifier/bin:$PATH"
export EDITOR="nvim"

# QOL
alias ls='eza --group-directories-first --color=always'
alias vim='nvim'
alias fvim='nvim $(fzf)'
alias c='clear'
alias cat='bat'
alias ping='gping'
alias ps='procs'
alias df='duf'
alias du='dust'
alias find='fd'
alias rmtrash='rm -rf ~/.local/share/Trash/*'
alias clip="xclip -selection clipboard"

# Pacman
alias p='sudo pacman -S'                        # install       
alias pu='sudo pacman -Syu'                     # update        
alias pr='sudo pacman -Rs'                      # remove        
alias prc='sudo pacman -Rns'                    # remove completely     
alias ps='pacman -Ss'                      			# search        
alias pi='pacman -Si'                     			# info          
alias pl='pacman -Q'                       			# list packaged
alias plo='pacman -Qdt'                    			# list orphans  
alias pc='sudo pacman -Scc'                     # clean cache   
alias plf='pacman -Ql'                     			# list files    
alias pro='sudo pacman -Rns $(pacman -Qtdq)'    # remove orphans

# Yay
alias y='yay -S'                        # install       
alias yu='yay -Syu'                     # update        
alias yr='yay -Rs'                      # remove        
alias yrc='yay -Rns'                    # remove completely     
alias ys='pacman -Ss'                      			# search        
alias yi='pacman -Si'                     			# info          
alias yl='pacman -Q'                       			# list packaged
alias ylo='pacman -Qdt'                    			# list orphans  
alias yc='yay -Scc'                     # clean cache   
alias ylf='pacman -Ql'                     			# list files    
alias yro='yay -Rns $(pacman -Qtdq)'    # remove orphans

# Docker
alias dr='docker run'                           # run
alias de='docker exec -it'                      # exec
alias dl='docker ps -a'                         # list containers
alias di="docker inspect"                       # inspect alias dim='docker images'                       # list images
alias dirm="docker image rm"                    # remove image
alias ds='docker start'                         # start
alias dsp='docker stop'                         # stop
alias dsa='docker stop $(docker ps -a -q)'      # stop all
alias drm='docker rm'                           # remove container
alias dcud='docker image rm $(docker image ls -f 'dangling=true' -q)' # clean up dangling

# Docker compose
alias dcu='docker compose up'                   # up
alias dcd='docker compose down'                 # down

# Shell integrations
eval "$(fzf --zsh)"
eval "$(zoxide init --cmd cd zsh)"
eval "$(tmuxifier init -)"

# Fun stuff
alias fetch='macchina'
alias matrix='neo-matrix -D --speed=10'
alias bonsai='cbonsai -m yggdrasil -S -w 15.00'

## Haskell
[ -f "/home/madeinheaven91/.ghcup/env" ] && . "/home/madeinheaven91/.ghcup/env" # ghcup-env
export PATH="$HOME/.local/bin:$PATH"
## Rust
export PATH="$HOME/.cargo/bin:$PATH"
export PATH="$HOME/go/bin:$PATH"

# Da Vinci Resolve
alias resolve="LD_PRELOAD='/usr/lib/libgio-2.0.so /usr/lib/libgmodule-2.0.so /usr/lib/libglib-2.0.so' /opt/resolve/bin/resolve"

eval "$(starship init zsh)"

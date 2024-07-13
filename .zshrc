# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="gnzh"

plugins=(git archlinux lighthouse zsh-autosuggestions zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh

eval  "$(zoxide init --cmd cd zsh)"
eval $(thefuck --alias)
source <(fzf --zsh)

alias zshconfig="nvim ~/.zshrc"
alias ohmyzsh="nvim ~/.oh-my-zsh"

extract () {
   if [ -f $1 ] ; then
       case $1 in
		# *.bz2)		bunzip2 $1 && cd $(basename "$1" /bz2) ;;
		# *.gz)		gunzip $1 && cd $(basename "$1" .gz) ;;
		*.rar)		7z x $1 -o./$("$1") ;;
		*.tar)		tar -xvf $1 ;;
		# *.tar.bz2)	tar xvjf $1 && cd $(basename "$1" .tar.bz2) ;;
		*.tar.gz)	tar -xvzf $1 ;;
		# *.tar.xz)	tar Jxvf $1 && cd $(basename "$1" .tar.xz) ;;
		# *.tbz2)		tar xvjf $1 && cd $(basename "$1" .tbz2) ;;
		# *.tgz)		tar xvzf $1 && cd $(basename "$1" .tgz) ;;
		*.zip)		7z x $1 -o./$("$1") ;;
		*.Z)		7z x $1 -o./$("$1") ;;
		*.7z)		7z x $1 -o./$("$1") ;;
		*)		echo "don't know how to extract '$1'..." ;;
       esac
   else
       echo "Error: '$1' is not a valid file!"
	   exit 0
   fi
 }
alias cat='bat'
alias ls='ls -lh --color=always --group-directories-first'
alias lsa='ls -lha --color=always --group-directories-first'
alias randwal="sh ~/Scripts/exec-once-swww.sh ~/Images/Wallpapers/"
alias swal='sh ~/Scripts/swww-select.sh'

# Pacman
alias p='sudo pacman -S'                        # install       
alias pu='sudo pacman -Syu'                     # update        
alias pr='sudo pacman -Rs'                      # remove        
alias ps='pacman -Ss'                      # search        
alias pi='pacman -Si'                      # info          
alias pl='pacman -Q'                       # list packaged
alias plo='pacman -Qdt'                    # list orphans  
alias pc='sudo pacman -Scc'                     # clean cache   
alias plf='pacman -Ql'                     # list files    
alias pro='sudo pacman -Rns $(pacman -Qtdq)'    # remove orphans

# Paru
alias pa='paru -S'                              # install       
alias par='paru -Rs'                            # remove        
alias pai='paru -Si'                            # info          
alias pau='paru -Sua'                           # update        
alias pas='paru -Ss'                            # search        
alias pac='paru -Scc'                           # clean cache   

# Docker
alias dr='docker run'                           # run
alias de='docker exec -it'                      # exec
alias dl='docker ps -a'                         # list containers
alias di='docker images'                        # list images
alias ds='docker start'                         # start
alias dsp='docker stop'                         # stop
alias dsa='docker stop $(docker ps -a -q)'      # stop all

macchina

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export ZSH="/home/danny/.oh-my-zsh"
export EDITOR=nvim
ZSH_THEME="powerlevel10k/powerlevel10k"

plugins=(
  git
  cargo
  pip
  docker
  heroku
  rsync
  zsh-autosuggestions
  zsh-syntax-highlighting
  zsh-nvm
)

export FZF_DEFAULT_COMMAND='fd --type f --hidden --follow --exclude .git'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_DEFAULT_OPTS="--height 70% --info=inline --border --preview 'bat --style=numbers --color=always --line-range :500 {}'"
export PATH=$HOME/.local/bin:$PATH
export PATH=$HOME/go/bin:$PATH

export PATH=/opt/anaconda/bin:$PATH
export PATH=/home/danny/.gem/ruby/2.7.0/bin:$PATH
source ~/.zplug/init.zsh
source $ZSH/oh-my-zsh.sh
source $HOME/.cargo/env
source /opt/cuda/bin
# HOROVOD_CUDA_HOME=/opt/cuda 
# HOROVOD_NCCL_INCLUDE=/usr/include 
# HOROVOD_NCCL_LIB=/usr/lib 
# HOROVOD_GPU_ALLREDUCE=NCCL 
# HOROVOD_WITH_PYTORCH=1 


alias startx='ssh-agent startx'
alias pac='sudo pacman --color auto'
alias v='nvim'
alias vi='nvim'
alias vim='nvim'
alias gap='git add -p'
alias gcm='git commit -m'
alias gs='git status'
alias gcv='git commit -v'
alias glog='git log --graph --oneline --decorate --all'
alias tm='tmux new -s `basename $PWD | tr " " "_"`'
alias tma='tmux attach-session -t'
alias ls='ls --color=auto'
alias ll='ls -lA'
alias chmox='chmod +x'
alias docker-murder='docker rm --force $(docker ps -qa)'
alias mirrors='sudo reflector -l 10 --sort rate --save /etc/pacman.d/mirrorlist'
alias zshconfig='v ~/.zshrc'
alias cl="clear"

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/opt/anaconda/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/opt/anaconda/etc/profile.d/conda.sh" ]; then
        . "/opt/anaconda/etc/profile.d/conda.sh"
    else
        export PATH="/opt/anaconda/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<
export SSL_CERT_FILE=/etc/ca-certificates/extracted/tls-ca-bundle.pem
export TERMINFO=/usr/share/terminfo
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

if [ -n "${ZSH_DEBUGRC+1}" ]; then
    zmodload zsh/zprof
fi

if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

eval "$(starship init zsh)"

# history settings
setopt appendhistory histignoredups
setopt histignorespace extended_history
setopt INC_APPEND_HISTORY share_history
SAVEHIST=8096
HISTSIZE=8096

# Customize to your needs...
bindkey "^A" beginning-of-line
bindkey "^E" end-of-line
bindkey "^R" history-incremental-search-backward
bindkey "^P" history-search-backward
bindkey "^Y" accept-and-hold
bindkey "^N" insert-last-word
bindkey -s "^T" "^[Isudo ^[A" # "t" for "toughguy"

bindkey "$terminfo[kcuu1]" history-substring-search-up
bindkey "$terminfo[kcud1]" history-substring-search-down

# your dotfiles folder
export MY_DOTFILES_PATH="$HOME/dotfiles"

# use vim as the visual editor
export VISUAL=nvim
export EDITOR=$VISUAL

# aliases
[[ -f ~/.aliases ]] && source ~/.aliases

# env vars
[[ -f ~/.env ]] && source ~/.env

# functions
for function in $HOME/functions/*; do
  source $function
done

bindkey -s "^F" "tmux-sessionizer\n"
bindkey -s "^T" "dotfiles\n"

# GOLANG
export GOPATH=~/go

# Enable Ctrl-x-e to edit command line
autoload -U edit-command-line
zle -N edit-command-line
bindkey '^xe' edit-command-line
bindkey '^x^e' edit-command-line

# Enable word jumps
bindkey "^[f" forward-word
bindkey "^[b" backward-word

alias watch='watch '

# # NVM
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

export GPG_TTY=$(tty)

if [ -n "${ZSH_DEBUGRC+1}" ]; then
    zprof
fi

export TERM=alacritty

export PATH=$PATH:/Users/rentziass/.spicetify

# JJ config
export JJ_CONFIG=$HOME/.config/jj/config.toml
eval "$(~/.local/bin/mise activate)"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# opencode
export PATH=/Users/rentziass/.opencode/bin:$PATH
export GITHUB_PERSONAL_ACCESS_TOKEN="$(gh auth token)"

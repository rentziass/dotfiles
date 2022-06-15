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
source ~/.env

# functions
for function in $MY_DOTFILES_PATH/zsh/functions/*; do
  source $function
done

bindkey -s "^F" "tmux-sessionizer\n"
bindkey -s "^T" "dotfiles\n"

export PATH=$PATH":$HOME/bin"

# GOLANG
export PATH=$PATH:/usr/local/opt/go/libexec/bin # 1.11
export GOPATH=~/go
export PATH=$PATH":$GOPATH/bin"
export PATH=~/.local/bin:$PATH

# Enable Ctrl-x-e to edit command line
autoload -U edit-command-line
zle -N edit-command-line
bindkey '^xe' edit-command-line
bindkey '^x^e' edit-command-line

# Enable word jumps
bindkey "^[f" forward-word
bindkey "^[b" backward-word

alias watch='watch '

export PATH="/usr/local/opt/python/libexec/bin:$PATH"
export PATH="$HOME/.yarn/bin:$PATH"
export PATH="/Users/francescorenzi/.gem/ruby/3.0.0/bin:$PATH"

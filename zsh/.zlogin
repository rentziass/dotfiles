# Execute code that does not affect the current session in the background.
{
  # Compile the completion dump to increase startup speed.
  zcompdump="${ZDOTDIR:-$HOME}/.zcompdump"
  if [[ -s "$zcompdump" && (! -s "${zcompdump}.zwc" || "$zcompdump" -nt "${zcompdump}.zwc") ]]; then
    zcompile "$zcompdump"
  fi
} &!

export CLICOLOR=1

# Print a random, hopefully interesting, adage.
if (( $+commands[fortune] )); then
  if [[ -t 0 || -t 1 ]]; then
    fortune -a
    print
  fi
fi

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

# PATH
export PATH=$PATH":$HOME/bin"
export PATH=$PATH:/usr/local/opt/go/libexec/bin # 1.11
export PATH=$PATH":$GOPATH/bin"
export PATH=$PATH:~/.local/bin
export PATH=$PATH":/usr/local/opt/python/libexec/bin"
export PATH="$HOME/.yarn/bin:$PATH"
export PATH="$HOME/.gem/ruby/3.0.0/bin:$PATH"
export PATH="$HOME/.dotnet/tools:$PATH"

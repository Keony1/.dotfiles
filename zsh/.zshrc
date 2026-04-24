export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="robbyrussell"

plugins=(git zsh-autosuggestions zsh-syntax-highlighting zsh-vi-mode)

source $ZSH/oh-my-zsh.sh

# editor
export EDITOR=nvim

# history
HISTSIZE=10000
SAVEHIST=10000
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_SPACE
setopt SHARE_HISTORY

# path
export PATH="$HOME/.cargo/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"
export PATH="/opt/nvim-linux-x86_64/bin:$PATH"

# ssh agent
eval "$(ssh-agent -s)" > /dev/null

# jj completions
fpath=(~/.zsh/completions $fpath)
autoload -U compinit && compinit

# jj aliases
alias jjs="jj status"
alias jjl="jj log"
alias jjd="jj diff"
alias jjn="jj new"
alias jje="jj edit"
alias jjc="jj commit"
alias jjb="jj branch"

# autosuggestions style
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=244"

# aliases
alias v="nvim"
alias gs="git status"
alias gc="git commit"
alias gp="git push"
alias gl="git log --oneline --graph"

# fzf
[ -f /usr/share/doc/fzf/examples/key-bindings.zsh ] && source /usr/share/doc/fzf/examples/key-bindings.zsh
[ -f /usr/share/doc/fzf/examples/completion.zsh ] && source /usr/share/doc/fzf/examples/completion.zsh

# zoxide
eval "$(zoxide init zsh)"

# nvm (lazy load)
export NVM_DIR="$HOME/.nvm"
nvm() {
    unset -f nvm node npm npx
    [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
    [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"
    nvm "$@"
}
node() { nvm; node "$@"; }
npm() { nvm; npm "$@"; }
npx() { nvm; npx "$@"; }

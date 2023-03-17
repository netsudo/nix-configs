export ZSH="/Users/k/.oh-my-zsh"
ZSH_THEME=agnoster

export PATH=/opt/homebrew/bin:$PATH
alias n="nvim"
alias g="git"
alias ngrok="~/ngrok"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
source $ZSH/oh-my-zsh.sh

# Setting fd as the default source for fzf
export FZF_DEFAULT_COMMAND='ag -l --path-to-ignore ~/.ignore --nocolor --hidden -g ""'

# To apply the command to CTRL-T as well
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

eval "$(direnv hook zsh)"
. /opt/homebrew/opt/asdf/libexec/asdf.sh

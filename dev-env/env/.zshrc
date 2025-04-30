# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.config/zsh/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# To customize prompt, run `p10k configure` or edit ~/.config/zsh/.p10k.zsh.
[[ ! -f ~/.config/zsh/.p10k.zsh ]] || source ~/.config/zsh/.p10k.zsh
XDG_CONFIG_HOME="$HOME/.config"
XDG_DATA_HOME="$XDG_CONFIG_HOME/local/share"
XDG_CACHE_HOME="$XDG_CONFIG_HOME/cache"
EDITOR="nvim"
VISUAL="nvim"
ZDOTDIR="$XDG_CONFIG_HOME/zsh"
HISTFILE="$ZDOTDIR/.zhistory"    # History filepath
HISTSIZE=25000
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

# Options
setopt HIST_SAVE_NO_DUPS         # Do not write a duplicate event to the history file.

source /home/m/.zsh/powerlevel10k/powerlevel10k.zsh-theme
source /home/m/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
source /home/m/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

autoload -U compinit; compinit

alias cd=z
alias ls='ls --color'
alias vim=nvim

# Where should I put you?
bindkey -s ^f "tmux-sessionizer\n"

catr() {
    tail -n "+$1" $3 | head -n "$(($2 - $1 + 1))"
}

cat1Line() {
    cat $1 | tr -d "\n"
}

addToPath() {
    if [[ "$PATH" != *"$1"* ]]; then
        export PATH=$PATH:$1
    fi
}

addToPathFront() {
    if [[ ! -z "$2" ]] || [[ "$PATH" != *"$1"* ]]; then
        export PATH=$1:$PATH
    fi
}

addToPathFront $HOME/.local/.npm-global/bin
addToPathFront $HOME/.local/apps
addToPathFront $HOME/.local/scripts
addToPathFront $HOME/.local/bin
addToPathFront $HOME/.local/npm/bin
addToPathFront $HOME/.local/n/bin/
export N_PREFIX="$HOME/.n"


eval "$(zoxide init zsh)"

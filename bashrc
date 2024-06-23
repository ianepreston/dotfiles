# If not running interactively, don't do anything
[[ $- != *i* ]] && return
# Activate blesh
[[ $- == *i* ]] && source $(blesh-share)/ble.sh --noattach

alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias vi='nvim'
alias vim='nvim'
PS1='[\u@\h \W]\$ '
# Starship for prompt
eval "$(starship init bash)"

eval "$(ssh-agent -s)"
# attach blesh
[[ ${BLE_VERSION-} ]] && ble-attach

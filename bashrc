# If not running interactively, don't do anything
[[ $- != *i* ]] && return
# Activate blesh
# [[ $- == *i* ]] && source $(blesh-share)/ble.sh --noattach

alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias vi='nvim'
alias vim='nvim'
PS1='[\u@\h \W]\$ '
# Use fish shell
# if [[ $(ps --no-header --pid=$PPID --format=comm) != "fish" && -z ${BASH_EXECUTION_STRING} ]]
# then
#   shopt -q login_shell && LOGIN_OPTION='--login' || LOGIN_OPTION=''
#   exec fish $LOGIN_OPTION
# fi
# Starship for prompt
# eval "$(starship init bash)"
# # keychain for ssh key management, might be better in WSL
# if [ -f $HOME/.ssh/id_rsa ]; then
#     $(which keychain) -q --nogui $HOME/.ssh/id_rsa
# fi
# if [ -f $HOME/.ssh/id_ed25519 ]; then
#     $(which keychain) -q --nogui $HOME/.ssh/id_ed25519
# fi
# source $HOME/.keychain/$(hostname)-sh
#
# # attach blesh
# [[ ${BLE_VERSION-} ]] && ble-attach

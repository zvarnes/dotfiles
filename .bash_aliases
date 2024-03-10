alias dcup='sudo docker-compose -f docker-compose.yml up -d'  #brings up all containers if one is not defined after dcup
alias dcdown='sudo docker-compose -f docker-compose.yml stop' #brings down all containers if one is not defined after dcdown
alias dcpull='sudo docker-compose -f docker-compose.yml pull' #pulls all new images is specified after dcpull
alias dclogs='sudo docker-compose -f docker-compose.yml logs -tf --tail="50" '
alias dtail='sudo docker logs -tf --tail="50" "$@"'
alias vim='nvim'
alias ls='lsd'
alias l='ls'
alias ll='ls -alF'
alias la='ls -A'
alias cat='batcat -p'

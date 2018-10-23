status --is-login; and status --is-interactive; and exec byobu-launcher

# set PATH "$HOME/.dropbox-bin" $PATH

if test -d "$HOME/bin"
  set PATH "$HOME/bin" $PATH
end

if test -d "$HOME/.local/bin"
  set PATH "$HOME/.local/bin" $PATH
end

set GOPATH "$HOME/go"
if test -d "$GOPATH/bin"
  set PATH "/usr/local/go/bin" "$GOPATH/bin" $PATH
end

# TeX Live installation
if test -d "/usr/local/texlive/2017"
  set MANPATH "/usr/local/texlive/2017/texmf-dist/doc/man"
  set INFOPATH "/usr/local/texlive/2017/texmf-dist/doc/info"
  set PATH "/usr/local/texlive/2017/bin/x86_64-linux" $PATH
end

set -g theme_display_virtualenv no

# https://www.calazan.com/docker-cleanup-commands/

# Kill all running containers.
alias dockerkillall='docker kill (docker ps -q)'

# Delete all stopped containers.
alias dockercleanc='printf "\n>>> Deleting stopped containers\n\n" & docker rm (docker ps -a -q)'

# Delete all untagged images.
alias dockercleani='printf "\n>>> Deleting untagged images\n\n" & docker rmi (docker images -q -f dangling=true)'

alias dockercleanv='docker volume ls -qf dangling=true | xargs -r docker volume rm'

# Delete all stopped containers and untagged images.
alias dockerclean='dockercleanc; and dockercleani; or or echo "Docker cleaning failed"'

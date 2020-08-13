status --is-login; and status --is-interactive; and exec byobu-launcher

# set PATH "$HOME/.dropbox-bin" $PATH

if test -d "$HOME/bin"
  set PATH "$HOME/bin" $PATH
end

if test -d "$HOME/.local/bin"
  set PATH "$HOME/.local/bin" $PATH
end

# https://github.com/axetroy/dvm
if test -d "$HOME/.deno/bin"
  set PATH "$HOME/.deno/bin" $PATH
end

set GOPATH "$HOME/go"
if test -d "$GOPATH/bin"
  set PATH "/usr/local/go/bin" "$GOPATH/bin" $PATH
end

# TeX Live installation
if test -d "/usr/local/texlive/2018"
  set MANPATH "/usr/local/texlive/2018/texmf-dist/doc/man"
  set INFOPATH "/usr/local/texlive/2018/texmf-dist/doc/info"
  set PATH "/usr/local/texlive/2018/bin/x86_64-linux" $PATH
end

set ANDROID_SDK "$HOME/Android/Sdk"
if test -d "$ANDROID_SDK"
  set PATH "$ANDROID_SDK/platform-tools" $PATH
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

alias docker-container-ip 'docker inspect -f "{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}"'

# https://ditchwindows.com/elementary-os-community-tips-and-tricks/
alias current-network-adapter 'lspci -nnk | grep 0280 -A3'

abbr -a gaa git add -A
abbr -a gan git add .
abbr -a gau git add -u
abbr -a gcb git checkout -b
abbr -a gco git checkout
abbr -a gcr git checkout --track origin/
abbr -a gl git log --oneline
abbr -a gll git log
abbr -a gpb git push -u origin HEAD
abbr -a gprune git prune-branches
abbr -a gs git status
abbr -a gsl git status --long

# wifi-list-available
abbr -a wla nmcli d wifi list
# wifi-list-configured
abbr -a wlc nmcli c
# wifi-connect
abbr -a wc nmcli c up
# wifi-disconnect
abbr -a wd nmcli c down

# http://www.codecoffee.com/tipsforlinux/articles/22.html
function dirsize
    du -ch $argv | grep total
end

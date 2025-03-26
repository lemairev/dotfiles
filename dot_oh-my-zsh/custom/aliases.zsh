# aliases

# cmd display
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'
alias ll='ls -lh'
alias la='ls -lha'
alias lsn='ls -1 | sort -V' # sort by number order (even if 1 12 112...)
alias df='df -PH'
alias c='clear'

# path
alias dl="cd ~/Downloads"
alias pp="cd ~/project"
alias op="cd ~/ownproj"

# typo
alias sl='ls'
alias py='python -q'
alias python='python -q'
alias pyhton='py'
alias ipy='ipython'
alias R='R --no-restore --no-save'
alias r='R'

# mac related
# show/hide hidden files in finder
alias hidef_show='defaults write com.apple.finder AppleShowAllFiles TRUE  ; killall Finder'
alias hidef_hide='defaults write com.apple.finder AppleShowAllFiles FALSE ; killall Finder'
# open stuff from terminal
function finder-fn() {
  open ${1:-.}
}
alias f='finder-fn'
alias fdl='finder-fn ~/Downloads'
alias fpp='finder-fn ~/projects'
alias fop='finder-fn ~/ownproj'
alias chrome='open -a "Google chrome"'
alias vs='open -a "Visual Studio Code"'
alias restart="exec ${SHELL} -l"

# conda
function ca-fn() {
  conda activate ${1:-py3dev}
}
alias ca='ca-fn'
alias cde='conda deactivate'
alias cl="conda list"
alias ci="conda install"
alias cr="conda remove"
alias cu="ci -n base -c defaults conda" # update conda base!

# docker (https://gist.github.com/jgrodziski/9ed4a17709baad10dbcd4530b60dfcbb)
function dex-fn {
  docker exec -it ${1} ${2:-bash}
}

function di-fn {
  docker inspect ${1}
}

function dl-fn {
  docker logs -f $1
}

function drun-fn {
  docker run -it ${1} ${2:-bash}
}

function dsr-fn {
  docker stop $1; docker rm $1
}

function dc-fn {
  docker compose $*
}

alias dc='dc-fn'     # docker-compose
alias di='di-fn'     # docker inspect <container>
alias dl='dl-fn'     # docker logs <container>
alias dex='dex-fn'   # docker exec <container>
alias dsr='dsr-fn'   # docker stop / rm <container>
alias drun='drun-fn' # docker run <image>

# rm docker & images
alias drm='docker container prune -f' # rm all stopped container
alias drmi='docker image prune -f'    # rm all dangling images

# see docker container/images
dps_format='{{.ID}}\t{{.Names}}\t{{.Image}}\t{{.Status}}\t{{.RunningFor}}' #{{.CreatedAt}}\t{{.Ports}}'
alias dps="docker ps --format 'table ${dps_format}'" # list container running
alias dpsa="dps -a"                                  # list all container
alias dim="docker images"                            # list docker images

# git
alias ga="git add"                          # add file
alias gac="git add . && git commit -m"      # + commit message"
alias gb="git branch"                       # create branch
alias gc="git checkout"                     # swich to
alias gd="git diff"                         # view diff
alias gi="git init && gac 'Initial commit'" # init proj & commit
alias gs="git status"                       # check state

# functions
# make dir & go
mcd() {
  if [ $# -ne 1 ]; then
    echo "Usage: mcd <directory-name>"
    return
  fi
  mkdir "$1" ; cd "$1"
}

# serv webserver
web_server() {
  python3 -m http.server "${1:-8000}"
}

# init proj folder
iniproj() {
  if [ $# -eq 0 ]; then
    echo "please specified the pathname"
    return
  fi

  local proj=${1}
  mkdir -p ${proj} ${proj}/src ${proj}/data ${proj}/tests ${proj}/doc ${proj}/figs
}

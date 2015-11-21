function parse_git_branch () {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/[\1]/'
}

RED="\[\033[0;31m\]"
YELLOW="\[\033[0;33m\]"
GREEN="\[\033[0;32m\]"
NO_COLOR="\[\033[0m\]"
WHITE="\[\033[1;37m\]"
CYAN="\[\033[0;36m\]"
GRAY="\[\033[0;37m\]"
BLUE="\[\033[0;34m\]"
PINK=$'\e[35;40m'

# prompt with git path
PS1="$GREEN\w ➜ $GREEN\$(parse_git_branch)$NO_COLOR "

# typical script paths
export PATH="/usr/local/bin:/usr/local/sbin:$HOME/bin:$PATH"
# sublime path finding
export PATH="/Applications/Sublime Text.app/Contents/SharedSupport/bin:$PATH"

# history
export HISTFILESIZE=2000
export HISTSIZE=80
export HISTFILE=~/.bash_history
export JRUBY_OPTS=-J-Xmx2g

#chruby
source '/usr/local/share/chruby/chruby.sh'
source '/usr/local/share/chruby/auto.sh'

alias start_mysql='mysql.server start'
alias start_redis='redis-server /usr/local/etc/redis.conf'
alias start_elasticsearch='elasticsearch'
alias start_es='elasticsearch'

title(){
  echo -n -e "\033]0;$1\007"  
}

function gh() {
  giturl=$(git config --get remote.origin.url)
  if [ "$giturl" == "" ]
    then
      echo "Not a git repository or no remote.origin.url set"
      exit 1;
  fi
  echo $giturl
  giturl=${giturl/://}
  echo $giturl
  giturl=${giturl/git\@/https://}
  echo $giturl
  giturl=${giturl/\.git/\/}
  branch="$(git symbolic-ref HEAD 2>/dev/null)" ||
    branch="(unnamed branch)"     # detached HEAD
  branch=${branch##refs/heads/}
  giturl=${giturl}tree/$branch
  open $giturl
}

if [ -f $(brew --prefix)/etc/bash_completion ]; then
  . $(brew --prefix)/etc/bash_completion.d/git-completion.bash
  . $(brew --prefix)/etc/bash_completion.d/git-prompt.sh
fi
PS1="\h:\W \u\$(__git_ps1 \" (%s) \")\$ "

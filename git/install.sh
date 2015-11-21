# DO NOT put anything PRIVATE in here!

git config --global alias.lg "log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit --date=relative"
git config --global alias.update "pull --rebase origin master"
git config --global alias.push-gerrit "push gerrit HEAD:refs/for/master"
git config --global alias.push-draft "push gerrit HEAD:refs/drafts/master"

source ~/.private
if [ ! "$(git config --global user.email)" ]; then
  git config --global user.email "$GIT_USER_EMAIL"
fi

if [ ! "$(git config --global user.name)" ]; then
  git config --global user.name "$GIT_USER_NAME"
fi

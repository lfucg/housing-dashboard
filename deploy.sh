if [[ $(git diff --shortstat HEAD 2> /dev/null | tail -n1) != "" ]]; then
  echo 'working directory is dirty, please commit all changes before deploy'
else
  git pull origin gh-pages
  cp -a public/* .
  git add .
  git commit -m 'build'
  git push origin gh-pages
fi

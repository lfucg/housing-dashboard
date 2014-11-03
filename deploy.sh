if [[ $(git status --short) != "" ]]; then
  echo 'working directory is dirty, please commit all changes before deploy'
else
  git pull origin gh-pages
  # start with a clean slate and copy from _site so that files removed
  # from the build are removed from gh-pages
  ls | grep -v bower | grep -v deploy | grep -v node_modules | grep -v _site | xargs git rm -r
  cp -a _site/* .
  git add .
  git commit -m 'build'
  git push origin gh-pages
fi

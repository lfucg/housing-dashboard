git pull origin gh-pages
cp -a public/* .
git add .
git commit -m 'build'
git push origin gh-pages

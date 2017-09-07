#!/bin/bash
set -eu

# see https://gohugo.io/hosting-and-deployment/hosting-on-github/
echo -e "\033[0;32mPublishing to GitHub...\033[0m"

rm -rf public
git worktree prune
git worktree add -B master public origin/master
npm run build

cd public
git add --all
git commit -m"Publishing to master"
cd ..
git push origin master


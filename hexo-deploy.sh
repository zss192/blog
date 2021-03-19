#!/bin/bash
time=$(date "+%Y-%m-%d %H:%M:%S")
echo "${time}"
echo "-----------------------------------"
hexo g -d
echo "成功操作hexo g -d"

echo "-----------------------------------"
git add .
git commit -m "add"
proxychains git pull origin master
proxychains git push origin master
echo "成功将博客源码推到github"
#! /bin/zsh

export -f template

rm -rf .tmp
mkdir -p .tmp

# Get currently available versions
# Requires jq, awk
curl https://api.github.com/repos/purescript/purescript/releases |
    jq '.[] | .name' |
    awk '{print $1}' |
    sort | uniq | sed s/\"//g > .tmp/versions.txt

mkdir -p versions

while read line
do
    name=$line
    if [ "$line" != "" ] && [[ $line != v0.5* ]]; then
        mkdir -p versions/"$line"
        sed s/{version}/"$line"/g Dockerfile.template > versions/"$line"/Dockerfile
    fi
done < .tmp/versions.txt

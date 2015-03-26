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
        wget "https://github.com/purescript/purescript/releases/download/$line/linux64.sha" -O "versions/$line/linux64.sha"
        SHA=$(awk '{print $1}' "versions/$line/linux64.sha")
        sed s/{version}/"$line"/g Dockerfile.template \
            | sed s/{SHA}/"$SHA"/g > versions/"$line"/Dockerfile
    fi
done < .tmp/versions.txt

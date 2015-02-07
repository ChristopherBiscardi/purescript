# Must ./update first. Requires existence of .tmp/versions.txt

# remove any previous file
touch .tmp/official-commits
rm .tmp/official-commits
echo "# maintainer ChristopherBiscardi <chris@christopherbiscardi.com> @chrisbiscardi\n" >> .tmp/official-commits

while read line
do
    name=$line
    if [ "$line" != "" ] && [[ $line != v0.5* ]]; then
        sed s/{folder}/"versions\/$line"/g official.template |
            sed s/{raw-version}/${line#"v"}/g >> .tmp/official-commits
    fi
done < .tmp/versions.txt

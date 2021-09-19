SAVEIFS=$IFS
IFS=$(echo -en "\n\b")
rm index.html 2012* .html
for f in $(find . -name "*.html" | sort)
do
	title=$(cat $f | grep "<h1>")
	date=$(cat $f | grep "<h2>")
	filename=$(echo $date $title | tr "," " " | sed 's/<h1>//g' | sed 's/<h2>//g' | sed 's/<\/h1>//g' | sed 's/<\/h2>//g').html
	cat $f>$filename
	filenamewohtml=$(echo $filename | sed 's/.html//g')
	echo "<a href='$filename'>$filenamewohtml</a><br>" >> index.html
done
IFS=$SAVEIFS

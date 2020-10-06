#!/bin/bash

file=""
if [ $# -ge 1 ] && [ -n $1 ]
then
	file=$1
	echo "Creating $file.html"
else
	file='gallery'
	echo "Creating $file.html"
fi

imgs=`ls ./Images | grep -i -e .jpg$ -e .png$ -e .gif$ -e .jpeg$`

htmlimgs=""

for img in $imgs
do
	htmlimgs="$htmlimgs <a href=\"Images/$img\"><img src=\"Images/$img\" alt=\"\" width=\"260px\" height=\"260px\" /></a> "
done

htmlpart1='<!DOCTYPE html>
<html>
   <head>
       <title>My Gallery</title>
       <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
       <style type="text/css">
       a img { border:0; }
       </style>
</head>
<body><p>'

htmlpart2='</p></body></html>'

touch $file.html

echo "$htmlpart1 $htmlimgs $htmlpart2" > $file.html


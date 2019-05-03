#!/bin/bash
for foldername
do
	/usr/libexec/PlistBuddy -x -c Print ~/Library/Safari/Bookmarks.plist | \
		xmlstarlet sel --net -t -m "//key[.='Title']/following-sibling::string[.='$foldername']/parent::node()//key" \
		-i ".='URIDictionary'" -v "./following-sibling::dict[1]/string[1]" -n \
		--else -i ".='URLString'" -v "./following-sibling::string[1]" -n -n
	echo
done

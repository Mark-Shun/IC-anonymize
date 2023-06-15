#!/bin/bash
# Written by Sonicfreak, use with care.
echo "Executing bash script to replace video names, and storing the original names in a new txt file."
Process_files=0
if [ ! -f original-names.txt ]; then
	touch original-names.txt
	echo "This text file contains the original file names." > original-names.txt
fi

for file in *; do
	if [[ "$file" == *.mp4 || "$file" == *.mkv || "$file" == *.avi || "$file" == *.mov || "$file" == *.webm || "$file" == *.m4v ]]; then
		if [[ "$file" == *"- Anon Editor -"* ]]; then
			echo "Skipping $file"
		else
			Process_files=$((Process_files + 1))
			echo "$file" >> original-names.txt
			new_file=$(echo "$file" | sed 's/\(.* - \).*\( - .*\)/\1Anon Editor\2/')
			mv "$file" "$new_file"
		fi
	fi
done

echo "Amount of processed files: $Process_files"
read -p "Press a key to close"
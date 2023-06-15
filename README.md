# IC anonymizing scripts
Have you ever organized an IC competition with the possibility to send in anonymized entries, but end up with lots of files to rename? These scripts are written to help relief this work.

# What does it do?
These scripts loop through every video file (mp4, mkv, avi, mov, webm and m4v) in the directory in which it is executed, and renames the editor name portion of the video title. For example "[Action] - Sakura - Beat It" gets renamed to "[Action] - Anon Editor - Beat It". And the original file names get stored in a text file, with which you can match the editor name to the correct file name after the fact. 

This makes it possible to simply run this script in a folder with lots of video's, exclude the generated "original-names.txt" file, and then you can share the directory with others who shouldn't be able to see the editor names. 

You can check out the functionality by running the script in the example folder.

# Prerequisite
The implementation of these scripts expect a file name with the following format: [Category] - Editor Name - Video Title. With which it specifically renames the part in-between the dashes. A file name that doesn't adhere to this format can result in undefined behavior.

# Usage
## Unix systems (Linux, ios etc)
Run the rename_vids.sh file, either by double clicking on it or in a terminal.
## Windows
Run the rename_vids.bat file, either by double clicking on it or in a terminal.

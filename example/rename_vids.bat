@echo off
Rem Written by Sonicfreak, use with care.
echo Executing batch script to replace video names, and storing the original names in a new txt file.

setlocal EnableDelayedExpansion

set "Process_files=0"

if not exist "original-names.txt" (
	echo This text file contains the original file names. > original-names.txt
)

for %%A in (*.mp4 *.mkv *.avi *.mov *.webm *.m4v) do (
    set "file=%%~nA"
    set "ext=%%~xA"
    set "orig_name=%%A"
    for /f "tokens=1,2,* delims=-" %%B in ("!file!") do (
        set "new_name=%%B- Anon Editor -%%D!ext!"
    )
    for /f "tokens=2 delims=-" %%C in ("!file!") do (
        IF /i "%%C"==" Anon Editor " (
            echo Skipping !orig_name!
        ) ELSE (
			set /a "Process_files+=1"
			echo !orig_name! >> original-names.txt
			echo Renaming !orig_name! to !new_name!
			ren "!orig_name!" "!new_name!"
		)
    )
)

echo Amount of processed files: %Process_files%
echo Press a key to finish...
pause >nul
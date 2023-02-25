@echo off
setlocal EnableDelayedExpansion

:: set the maximum file size in MB
set /A max_size=7

:: find all video files in the current directory and its subdirectories
set /A counter=0
for /r %%i in (*.mp4,*.avi,*.mov,*.wmv,*.mkv) do (
    set /A counter+=1
    set "file[!counter!]=%%i"
)

:: check if any video files were found
if %counter% == 0 (
    echo No video files found in current directory and its subdirectories.
    goto end
)

:: display the list of video files and prompt the user to select one
echo Select a video file to compress:
for /L %%i in (1,1,%counter%) do (
    echo %%i: !file[%%i]!
)
set /P selection="Enter a number (1-%counter%): "

:: check if the user entered a valid selection
if not defined file[%selection%] (
    echo Invalid selection.
    goto end
)

:: ask if the user wants to use the default maximum size or enter a custom size
set /P custom="Enter a custom maximum file size in MB (press Enter for default of %max_size% MB): "
if "%custom%" == "" (
    set /A max_size=max_size
) else (
    set /A max_size=custom
)

:: compress the selected video file to the specified maximum size
ffmpeg -i "!file[%selection%]!" -codec:v libx264 -crf 28 -preset slow -b:v 1M -maxrate 1M -bufsize 2M -threads 0 -codec:a aac -b:a 128k -f mp4 -fs %max_size%M "compressed.mp4"

echo Compression complete. Press ENTER to close.
pause >nul

:end

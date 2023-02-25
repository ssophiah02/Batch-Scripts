Script for compressing a video to 7 MB (will scan current working directory for available videos) or custom file size
Assumes that you have already downloaded FFmpeg to your system

To download Choco which you can use to download FFmpeg:
Open a Powershell window as administrator and run:
Set-ExecutionPolicy Bypass -Scope Process -Force; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))
Then exit, reopen the window, and run:
choco install ffmpeg

FFmpeg should now be installed!

You can also update FFmpeg on the command line by running:
choco upgrade ffmpeg

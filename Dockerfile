FROM mcr.microsoft.com/windows:1909
LABEL maintainer=hi@antonybailey.net"
RUN powershell.exe -NoProfile -InputFormat None -ExecutionPolicy Bypass -Command "[System.Net.ServicePointManager]::SecurityProtocol = 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))" && SET "PATH=%PATH%;%ALLUSERSPROFILE%\chocolatey\bin"
RUN choco.exe install dotnetfx --version 4.7.2.20180712  --fail-on-unfound --yes --no-progress --limit-output --timeout 2700 --force
RUN choco list --local-only
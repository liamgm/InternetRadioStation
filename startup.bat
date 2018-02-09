@echo off
REM This is a simple tool to setup Mixxx and IceCast so that
REM they'll work together out of the box.

REM We need a minimal mixxx.cfg file in the user's appdata\local directory
REM that tells MIXXX how to connect to Icecast. When Mixxx starts up, it'll 
REM fill out the rest of the values necessary for its configuration.

ECHO "Minimally configuring Mixxx"

IF NOT EXIST "%localappdata%\Mixxx" (
MKDIR "%localappdata%\Mixxx"
COPY "configuration\mixxx.cfg" "%localappdata%\mixxx\"
) ELSE (
ECHO "Mixxx app data file already exists, so we'll use your existing setup."
)

REM Get IP
REM https://stackoverflow.com/questions/5898763/#answer-5901991

for /f "delims=[] tokens=2" %%a in ('ping -4 -n 1 %ComputerName% ^| findstr [') do set NetworkIP=%%a
ECHO "This computer's IP address is:" %NetworkIP%

REM Create lnk shortcut in the current folder
REM https://stackoverflow.com/questions/30028709/#answer-30029955

powershell "$s=(New-Object -COM WScript.Shell).CreateShortcut('.\LinkToClassRadioStation.lnk');$s.TargetPath='http://%NetworkIP%:8000';$s.Save()"

REM Firing up your Icecast2 server
START .\Icecast\bin\icecast.exe -c .\configuration\icecast.xml



REM Firing up Mixxx
.\mixxx\mixxx.exe

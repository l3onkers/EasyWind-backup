@echo off
Ping 4poll0 -n 1 -w 1000
if errorlevel 1 echo Not connected
pause
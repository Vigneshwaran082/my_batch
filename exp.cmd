@echo off
::GET the location to open the file
set locationToOpen=%1

:: If location is present use that else use present wworking dir
if [%locationToOpen%]==[] (
	explorer.exe %cd%) else (
	explorer.exe %locationToOpen%)

	
:: Script to PASS OUTPUT OF ONE SCRIPT TO ANOTHER
::chdir > %TEMP%\my_temp_script_file
::SET /P pwd=<%Temp%\my_temp_script_file
::del %Temp%\my_temp_script_file
::echo %pwd%
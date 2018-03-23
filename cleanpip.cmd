@echo off
set dirName=pip_build_
set userName=%USERNAME%
set directoryToDel=%dirName%%userName%
set location= %TEMP%\%directoryToDel%

if not exist %location% ( 
	echo Directory not exist to delete ) else (
	echo Directory exist deleting the directory and its contents
	rmdir /s /q %location%
		if %ERRORLEVEL% EQU 0 ( 
			goto EOF
		) else (
			echo Error deleting the directory
		)
	)

:EOF
:: This script is a solution for the issues:  https://github.com/pypa/pip/issues/2979
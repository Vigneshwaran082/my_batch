@echo off
set fileName=%1
set /A page_number=%2
:: This is because when we start a process in windows, it starts the process or application but command line hangs
:: meaning  there is no way to use 'nohub' like commands in windows command prompt so we are going to powershell to solve this issue
powershell "C:\Users\vigkanda\Work_Place\Software\my_batch\powershell_scripts\ar.ps1" %fileName% %page_number%

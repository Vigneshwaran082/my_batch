@echo off
set directoryToDelete=%1
:: s --  Removes the specified directory and all subdirectories including any files. q --Runs rmdir in quiet mode. Deletes directories without confirmation.
:: We can use rmdir or rd command to delete the directory
rmdir %directoryToDelete%  /s /q

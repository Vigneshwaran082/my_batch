@echo off
tasklist /nh|findstr "chrome.exe"&&start "" "http://www.google.com"
@echo off
set process_name=%1
:: F- Force /IM -Tells next parameter is a image file[A.K.A(Also known as) executable name]
if %process_name%  == ar (
  taskkill /F /IM AcroRd32.exe 
)else if %process_name%  == np+ (
  taskkill /F /IM Notepad++.exe
) else ( 
 taskkill /F /IM %process_name%.exe)


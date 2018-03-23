:: REFERENCE:  http://steve-jansen.github.io/guides/windows-batch-scripting/part-1-getting-started.html
@echo off 
Rem This is Just a comment.
:: This is another way of comment
:: '%1' --> A way of getting input from the user
set argument_one=%1

:: Declaring numeric value . Note the '/A 'switch which supports arithmetic operations during assignments
set /A v1 =10
set /A v2 =10
set /A v3 = %v1% + %v2%
echo %v3%

echo ===========Local and Global variable=============
:: LOCAL Variable and GOBAL Variable
set /A global_variable = 82
:: local variable can be set using 'SETLOCAL' comment, if variable declared inside 'SETLOCAL' then it can be accessed till 'ENDLOCAL' 
SETLOCAL 
    echo INSIDE LOCAL
	echo %global_variable%
	set local_variable=Not accessibale outside
	echo %local_variable%
ENDLOCAL

echo %global_variable%
echo "Echo is not printing the value:-->" %local_variable%

echo ========== Arrays example =================

:: SYNTAX - set ARRAY_NAME[ARRAY_ELEMENT_INDEX] = VALUE
set firstArray[0]=vignesh
echo %firstArray[0]%
::SYNTAX-2 - set ARRAY_NAME = LIST OF ELEMENTS
::set myArray = 1 2 3 4 5
::for /l %%Index in myArray do (echo !myArray[%%Index]! ) -- NOT WORKING

echo ============= Decision example =============
:: SYNTAX - if CONDITION do_something -- NOTE: EVERYTHING IN ONE LINE , if you need multiple lines use ()
set myName = vignesh
set myEmptyName=%3
if %myName% == vignesh echo My name is 'Vignesh'
if [%myEmptyName%]==[] echo Name is Empty 
:: SYNATX - if CONDITION do_something ELSE do_something_else
echo ===IF-ELSE====
set wifeName = karthika
if %myName%==karthika (
    echo My name is 'Karthika') ELSE (
    echo My wife name is 'Karthika')
echo ==IF-DEFINED==
if defined myColleagueName (
   echo My colleague Name is defined) else (
   echo My colleague Name is undefined) 
:: OTHER SYNTAX - if exist ABSOLUTE_PATH do_something
:: OTHER SYNTAX - if not (CONDITION) do_something

echo ========== Relational operator =====
SET /A a=5 
SET /A b=10 
if %a% EQU %b% echo A is equal to than B 
if %a% NEQ %b% echo A is not equal to than B 
if %a% LSS %b% echo A is less than B 
if %a% LEQ %b% echo A is less than or equal B
if %a% GTR %b% echo A is greater than B 
if %a% GEQ %b% echo A is greater than or equal to B


echo =============TIME====================
echo CURRENT TIME IS :  %TIME%

echo ============REDIRECTION===============
echo -Type something in the below screen. Once done press ctrl+c-
::type con > data_collected.txt
echo Now All the input data are redirected to data_collected.txt file

:: %ERRORLEVEL% to check if the previous command executed successfully of not

echo ============= LOOPING ================
:: NO DIRECT WHILE 
SET /A count=0
:while
if  %count% lss 5 (
   echo The value of count is %count%
   SET /A count=%count% + 1
   goto :while
)
echo ===FOR-LOOP===
:: SYNTAX - FOR %%Single_Char_Ele IN list DO do_something
set list = 4 5 6 
FOR %%E IN  (1,2,3) DO echo %%E
FOR %%E IN  (%list%) DO echo %%E

# In PowerShell, variables always have a dollar sign ($) before them.
$name = 'Vignesh waran' #String declaration
$number = 12345 
$location = 'Charlotte'
$listofnumbers = 6,7,8,9  # Array declaration
$my_last_math_grade = 'D+'

#Print in Powershell is Write-Host or write-host -- Note case insensitive
write-host "My Name is $name"

#IF Else 
if (10 -gt 15) { # -gt is a powershell term of representing "greater than"

 write-host "10 is greater than 15"
}elseif(10 -eq 15) {
	write-host "10 is equal to 15"
}else {
	 write-host "10 is lesser than 15"

}

#LOOPS 
## do while

$count =1

do {
 write-host "Hai Vignesh , Welcome. You are inside DO -WHILE loop. The count is $count"
 $count =$count+1
}while($count -eq 1)

# while Loop

while($count -eq 2 ){
 write-host "Hai Vignesh , Welcome. You are inside while loop. The count is $count"
 $count =$count+1
}

#ForEach Loop
foreach($number in $listofnumbers){
 write-host $number
}

#We can use command-line commands in powershell directly
#redirect-and-append arrow (>>). EG: ipconfig /all >tshoot.txt; route print >>tshoot.txt
# https://htipe.wordpress.com/2010/10/20/adobe-acrobat-command-line-options/
if($args.Length -eq 2){ 
 $file_Name_with_location = $args[0]
 $page_number=  $args[1]
& "C:\Program Files (x86)\Adobe\Acrobat Reader DC\Reader\AcroRd32.exe" /A "page=$page_number" $file_Name_with_location
}elseif ($args.Length -eq 1){
	Write-Host($args[0])
	& "C:\Program Files (x86)\Adobe\Acrobat Reader DC\Reader\AcroRd32.exe"  $args[0]
}else{
  & "C:\Program Files (x86)\Adobe\Acrobat Reader DC\Reader\AcroRd32.exe"
}

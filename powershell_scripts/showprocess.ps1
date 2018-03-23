#https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.utility/add-type?view=powershell-6
#https://stackoverflow.com/questions/12801563/powershell-setforegroundwindow
#https://stackoverflow.com/questions/42566799/how-to-bring-focus-to-window-by-process-name
#https://www.dotnetperls.com/dllimport

if($args.Length -eq 0){
   write-warning("Error!!!Please provide process name to focus")
   exit(1)
}elseif($args.Length -gt 1){
  write-warning("Error!!!Only one process can be made to focus")
  exit(1)
}elseif ($args.Length -eq 1){
  if($args[0].Contains(".exe")){
	$args[0] = $args[0].Replace(".exe","")
  }
}
$process_name = $args[0]


#FORMATTING PROCESS NAMES::
if($process_name -eq "ar" -Or $process_name -eq "adobereader" ){
  $process_name = "AcroRd32"
}elseif($process_name.contains("powershell")){
  $process_name ="PowerShell_ISE"
}elseif($process_name.contains("visualstudio")){
 $process_name="devenv"
}


# - In the below script we are creating a custom cmd-let with a class CallWindow which in turn has declared a native method[Check DLLImport in google] 
# Note 'extern' in the method declaration which show this method is return inside user32.dll file and 'return : MarshalAs' line tells these method return bool value
Add-Type @"
  using System;
  using System.Runtime.InteropServices;
  public class CallWindow {
     [DllImport("user32.dll")]
     [return: MarshalAs(UnmanagedType.Bool)]
     public static extern bool SetForegroundWindow(IntPtr hWnd);
  }
"@


Try{
	$process = get-process $process_name -ErrorAction silentlyContinue
	
	if ($process.GetType().ToString() -eq "System.Object[]"){
	 #$process=$process[0]
	  foreach($single_process in $process) {
	   $h =  $single_process.MainWindowHandle
	   $isCameToFront = [CallWindow]::SetForegroundWindow($h)
	   if($isCameToFront){
		 break;
	   }
	 }
	 write-host("DONE");
	 exit(0)
	}elseif ($process.GetType().ToString() -eq "System.Diagnostics.Process"){
	   #THIS IS NOT NEEDED JUST TO BE SURE
	   $process = $process
	}else{
	  write-warning("Error!!!Looks like invalid process name , Please check the process name and try again.")
	  exit(1)
	}
	
	$h =  $process.MainWindowHandle 
	$isCameToFront = [CallWindow]::SetForegroundWindow($h) 
	write-host("DONE") 
	
} Catch [System.Management.Automation.RuntimeException] {
	write-warning("Error!!!Looks Like invalid process name is entered or process NOT exist, Please check the process name and try again!!")
    exit(1)
} Catch {
	write-host("****************Error******************")
	Write-Error($_.Exception)
	#write-warning($_.Exception.Message)
	#write-host("ItemName" + $_.Exception.ItemName)
	exit(1)
}
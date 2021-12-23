Write-Progress -Activity "Checking" -Status "Checking For Malware" -Id 1 -PercentComplete 60
cmd /C "dir /S /B > %SystemDrive%\%root%\files"

Write-Progress -Activity "Comparing" -Status "Comparing Hash Data" -Id 1 -PercentComplete 40
cmd /C "call "%SystemDrive%\%root%\endbit.bat""

Write-Progress -Activity "Found" -Status "Done." -Id 1 -PercentComplete 100
cmd /C "echo You had: && Type Found"
cmd /C "goto protect"
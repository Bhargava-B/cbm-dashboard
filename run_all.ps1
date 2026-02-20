$logFile = "C:\cbm-dashboard\run_all.log"

Add-Content $logFile "==============================="
Add-Content $logFile "Run started at $(Get-Date)"

Write-Output "Starting CBM process..."

# Step 1: Collect status
Add-Content $logFile "Running collect_status.ps1..."
powershell -ExecutionPolicy Bypass -File "C:\inetpub\wwwroot\CBM\scripts\collect_status.ps1" 2>&1 | Tee-Object -FilePath $logFile -Append

Add-Content $logFile "Collect completed."

# Step 2: Auto push
Add-Content $logFile "Running auto_push.ps1..."
powershell -ExecutionPolicy Bypass -File "C:\cbm-dashboard\auto_push.ps1" 2>&1 | Tee-Object -FilePath $logFile -Append

Add-Content $logFile "Push completed."
Add-Content $logFile "Run finished at $(Get-Date)"
Add-Content $logFile "==============================="

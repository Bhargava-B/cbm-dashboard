$source = "C:\inetpub\wwwroot\CBM\data\status.json"
$destination = "C:\cbm-dashboard\data\status.json"

# Copy latest file
Copy-Item -Path $source -Destination $destination -Force

Set-Location "C:\cbm-dashboard"

# Stage only status.json
git add data/status.json

# Check if THIS file changed
$changes = git diff --cached --name-only

if ($changes -match "data/status.json") {

    $time = Get-Date -Format "yyyy-MM-dd HH:mm:ss"
    git commit -m "Auto update backup status - $time"
    git push

    Write-Output "Changes detected. Pushed to GitHub."
}
else {
    Write-Output "No changes detected. Skipping push."
}

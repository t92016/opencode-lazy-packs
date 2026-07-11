# OpenCode config restore script
# Restores ~/.config/opencode/ from Google Drive backup

$backupRoot = "J:\我的雲端硬碟\AI\AI Agents\opencode-config-backup"
$latestZip = Join-Path $backupRoot "opencode-config-latest.zip"
$restoreTarget = "$env:USERPROFILE\.config\opencode"

Write-Host "=== OpenCode Config Restore ===" -ForegroundColor Cyan

if (-not (Test-Path $latestZip)) {
    Write-Host "ERROR: Backup not found at $latestZip" -ForegroundColor Red
    Write-Host "Make sure Google Drive has synced the backup folder." -ForegroundColor Yellow
    exit 1
}

Write-Host "Will restore to: $restoreTarget" -ForegroundColor Yellow
Write-Host "From backup: $latestZip" -ForegroundColor Yellow
$confirm = Read-Host "Proceed? (y/N)"
if ($confirm -ne "y" -and $confirm -ne "Y") {
    Write-Host "Cancelled" -ForegroundColor Red
    exit 0
}

$tempDir = Join-Path $env:TEMP "opencode-restore-temp"
if (Test-Path $tempDir) { Remove-Item -Recurse -Force $tempDir }
New-Item -ItemType Directory -Force -Path $tempDir | Out-Null

Add-Type -AssemblyName System.IO.Compression.FileSystem
[System.IO.Compression.ZipFile]::ExtractToDirectory($latestZip, $tempDir)

# Backup old config
$oldBackup = "$restoreTarget.old"
if (Test-Path $restoreTarget) {
    if (Test-Path $oldBackup) { Remove-Item -Recurse -Force $oldBackup }
    Move-Item $restoreTarget $oldBackup
    Write-Host "Old config backed up to $oldBackup" -ForegroundColor Yellow
}

# Copy restored config
Copy-Item -Recurse (Join-Path $tempDir "opencode") $restoreTarget
Remove-Item -Recurse -Force $tempDir

Write-Host "RESTORE COMPLETE!" -ForegroundColor Green
Write-Host ""
Write-Host "NEXT STEPS (on new PC):" -ForegroundColor Cyan
Write-Host "1. Verify opencode: opencode --version" -ForegroundColor White
Write-Host "2. Login NotebookLM: nlm login" -ForegroundColor White
Write-Host "3. Run opencode in project dir, say '开工'" -ForegroundColor White

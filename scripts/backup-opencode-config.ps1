# OpenCode config backup script
# Backs up ~/.config/opencode/ to Google Drive

$source = "$env:USERPROFILE\.config\opencode"
$backupRoot = "J:\我的雲端硬碟\AI\AI Agents\opencode-config-backup"

# Ensure backup dir exists
New-Item -ItemType Directory -Force -Path $backupRoot | Out-Null

$timestamp = Get-Date -Format "yyyyMMdd-HHmmss"
$zipName = "opencode-config-$timestamp.zip"
$zipPath = Join-Path $backupRoot $zipName
$latestPath = Join-Path $backupRoot "opencode-config-latest.zip"

Write-Host "=== OpenCode Config Backup ===" -ForegroundColor Cyan

if (-not (Test-Path $source)) {
    Write-Host "ERROR: $source not found" -ForegroundColor Red
    exit 1
}

$tempDir = Join-Path $env:TEMP "opencode-backup-temp"
if (Test-Path $tempDir) { Remove-Item -Recurse -Force $tempDir }
New-Item -ItemType Directory -Force -Path $tempDir | Out-Null

# Copy config files (exclude .git)
Get-ChildItem -Path $source -Exclude ".git" | ForEach-Object {
    $dest = Join-Path $tempDir $_.Name
    Copy-Item -Recurse $_.FullName -Destination $dest -Force
}

# Create zip
Add-Type -AssemblyName System.IO.Compression.FileSystem
[System.IO.Compression.ZipFile]::CreateFromDirectory($tempDir, $zipPath)

# Update latest.zip
Copy-Item $zipPath $latestPath -Force
Remove-Item -Recurse -Force $tempDir

Write-Host "BACKUP DONE: $zipPath" -ForegroundColor Green
Write-Host "Latest also saved as: opencode-config-latest.zip" -ForegroundColor Yellow

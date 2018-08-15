$upper = Split-Path -Parent $PSScriptRoot
$result = Get-ChildItem -Path $upper -Directory

foreach ($dir in $result)
{
    try
    {
        $destPath = Join-Path -Path (Join-Path -Path $upper -ChildPath $dir) -ChildPath 'proc.pid'
        Write-Host "Looking for: $destPath"
        Get-Content $destPath -ErrorAction Stop
        Write-Host "File found in $destPath"
        Get-Process -Id (Get-Content -Path $destPath) -ErrorAction stop | Stop-Process
        Write-Host "PID killed."
    }
    catch
    {
        Write-Host "No file."
    }
}
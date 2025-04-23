
# Get-SystemInfo.ps1
# Gathers system information and logs it to a file

$logPath = "$PSScriptRoot\SystemInfoLog.txt"
$date = Get-Date -Format "yyyy-MM-dd HH:mm:ss"

function Write-Log {
    param([string]$message)
    $timestamped = "[$date] $message"
    Write-Output $timestamped
    Add-Content -Path $logPath -Value $timestamped
}

Write-Log "=== System Info Collection Started ==="

# OS Information
$os = Get-CimInstance Win32_OperatingSystem
Write-Log "`n--- OS Info ---"
Write-Log "OS Name: $($os.Caption)"
Write-Log "Version: $($os.Version)"
Write-Log "Architecture: $($os.OSArchitecture)"

# CPU Information
$cpu = Get-CimInstance Win32_Processor
Write-Log "`n--- CPU Info ---"
Write-Log "CPU Name: $($cpu.Name)"
Write-Log "Cores: $($cpu.NumberOfCores)"
Write-Log "Logical Processors: $($cpu.NumberOfLogicalProcessors)"

# RAM Information
$ram = [math]::round($os.TotalVisibleMemorySize / 1MB, 2)
Write-Log "`n--- RAM Info ---"
Write-Log "Total RAM (GB): $ram"

# Disk Usage
$disks = Get-CimInstance Win32_LogicalDisk -Filter "DriveType=3"
Write-Log "`n--- Disk Info ---"
foreach ($disk in $disks) {
    $size = [math]::round($disk.Size / 1GB, 2)
    $free = [math]::round($disk.FreeSpace / 1GB, 2)
    Write-Log "Drive $($disk.DeviceID): $free GB free of $size GB"
}

Write-Log "`n=== System Info Collection Completed ==="

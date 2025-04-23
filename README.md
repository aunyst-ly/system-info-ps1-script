#System Info Check Script 🖥️

A basic PowerShell script that collects and logs important system information like CPU, RAM, disk usage, and OS version.

## 🧰 What It Logs
- OS name, version, architecture
- CPU model, core count, logical processors
- Total RAM (in GB)
- Disk usage for each local drive

## ▶️ How to Use
1. Download the script.
2. Right-click the `Get-SystemInfo.ps1` file and choose **Run with PowerShell**.
3. Check the `SystemInfoLog.txt` in the same folder for your system report.

> 🔐 Requires PowerShell and administrative privileges for full access.

## 📁 Output
All data is saved in a human-readable `SystemInfoLog.txt`.

## 🧪 Future Ideas
- Export as JSON or CSV
- Email or upload report
- Add system uptime, hostname, user info

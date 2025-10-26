Param(
  [string[]]$Servers = (Get-Content -Path "servers.txt"),
  [string]$ReportPath = "report.html"
)
$results = @()
foreach ($s in $Servers) {
  Write-Host "Checking $s" -ForegroundColor Cyan
  $ok = Test-Connection -ComputerName $s -Count 1 -Quiet
  if (-not $ok) {
    $results += [pscustomobject]@{Server=$s; Reachable=$false; CPU="-"; Memory="-"; DiskFree="-"}
    continue
  }
  $cpu = Get-CimInstance -ClassName Win32_Processor -ComputerName $s | Measure-Object -Property LoadPercentage -Average | Select-Object -ExpandProperty Average
  $mem = Get-CimInstance -ClassName Win32_OperatingSystem -ComputerName $s
  $memFreePct = [math]::Round(($mem.FreePhysicalMemory/$mem.TotalVisibleMemorySize)*100,2)
  $disk = Get-CimInstance -ClassName Win32_LogicalDisk -ComputerName $s -Filter "DriveType=3" | ForEach-Object { [math]::Round(($_.FreeSpace/1GB),2) } | Measure-Object -Minimum | Select-Object -ExpandProperty Minimum
  $results += [pscustomobject]@{Server=$s; Reachable=$true; CPU=$cpu; MemoryFreePct=$memFreePct; MinDiskFreeGB=$disk}
}
# Simple HTML report
$style = '<style>table{border-collapse:collapse}td,th{border:1px solid #ddd;padding:6px}th{background:#f3f3f3}</style>'
$results | ConvertTo-Html -Head $style -Title "Infrastructure Health" -PreContent "<h2>Infrastructure Health Report</h2>" | Out-File $ReportPath
Write-Host "Report generated at $ReportPath" -ForegroundColor Green

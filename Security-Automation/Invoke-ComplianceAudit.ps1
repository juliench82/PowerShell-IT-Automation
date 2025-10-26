Param(
  [ValidateSet('ISO27001','GDPR','CIS')]
  [string]$Standard = 'ISO27001',
  [string]$Export = 'compliance.html'
)
$checks = @()
# Account lockout policy
$pol = (Get-ItemProperty "HKLM:\SYSTEM\CurrentControlSet\Control\Lsa").restrictanonymous
$checks += [pscustomobject]@{Control='Anonymous SID/Name Translation'; Expected='Disabled'; Actual=$pol; Passed=($pol -eq 0)}
# RDP Network Level Authentication
$nla = (Get-ItemProperty "HKLM:\SYSTEM\CurrentControlSet\Control\Terminal Server\WinStations\RDP-Tcp").UserAuthentication
$checks += [pscustomobject]@{Control='RDP NLA'; Expected='Enabled'; Actual=$nla; Passed=($nla -eq 1)}
# Firewall state
$fw = (Get-NetFirewallProfile | Where-Object {$_.Enabled -eq 'True'}).Count -ge 1
$checks += [pscustomobject]@{Control='Windows Firewall'; Expected='Enabled'; Actual=$fw; Passed=$fw}
$passRate = [math]::Round((($checks | Where-Object Passed).Count/$checks.Count)*100,2)
$style = '<style>table{border-collapse:collapse}td,th{border:1px solid #ddd;padding:6px}th{background:#f3f3f3}</style>'
$pre = "<h2>Compliance Audit ($Standard)</h2><p>Pass Rate: $passRate%</p>"
$checks | ConvertTo-Html -Head $style -PreContent $pre | Out-File $Export
Write-Host "Compliance report saved to $Export (PassRate=$passRate%)" -ForegroundColor Green

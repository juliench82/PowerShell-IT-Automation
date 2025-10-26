Param(
  [Parameter(Mandatory=$true)][string]$User,
  [Parameter(Mandatory=$true)][string]$SkuId
)
Write-Host "Assigning license $SkuId to $User" -ForegroundColor Cyan
# Connect-ExchangeOnline; Connect-MgGraph -Scopes User.ReadWrite.All
# Set-M365License -User $User -SkuId $SkuId
Write-Host "License assignment completed (placeholder)" -ForegroundColor Green

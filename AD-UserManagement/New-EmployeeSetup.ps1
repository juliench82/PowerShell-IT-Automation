Param(
    [Parameter(Mandatory=$true)]
    [string]$UserData,
    [Parameter(Mandatory=$true)]
    [string]$Template
)
Import-Module ActiveDirectory
# Import CSV of new hires with columns: FirstName,LastName,Email,Department,Title,Manager,OU,Groups
$users = Import-Csv -Path $UserData
foreach ($u in $users) {
    $sam = ("{0}.{1}" -f $u.FirstName,$u.LastName).ToLower()
    $upn = "$sam@company.local"
    $name = "$($u.FirstName) $($u.LastName)"
    Write-Host "Creating AD user $name ($sam)" -ForegroundColor Cyan
    New-ADUser -Name $name -GivenName $u.FirstName -Surname $u.LastName -SamAccountName $sam -UserPrincipalName $upn -DisplayName $name -EmailAddress $u.Email -Department $u.Department -Title $u.Title -Path $u.OU -Enabled $true -ChangePasswordAtLogon $true -AccountPassword (ConvertTo-SecureString -String (New-Guid).Guid -AsPlainText -Force)
    if ($u.Manager) { Set-ADUser -Identity $sam -Manager $u.Manager }
    if ($u.Groups) { $u.Groups.Split(';') | ForEach-Object { Add-ADGroupMember -Identity $_ -Members $sam } }
}
Write-Host "Assigning Microsoft 365 licenses (placeholder)" -ForegroundColor Yellow
# Connect-MgGraph; foreach ($u in $users) { Set-M365License -User $u.Email -SkuId "ENTERPRISEPACK" }
Write-Host "Provisioning complete" -ForegroundColor Green

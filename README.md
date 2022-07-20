# Office365 Powershell
### scripts and statements for Exchange Online and Office365

Get-MgGroupMember -GroupId 12f1791c-54cb-44b3-9100-2f1c02a6a021  | ForEach-Object { Get-MgUser -UserId $_.Id }
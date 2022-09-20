# Office365 Powershell
### scripts and statements for Exchange Online and Office365

![PowerShell](https://repository-images.githubusercontent.com/221074232/158c2480-5262-11ea-8af0-452a86d9e56d)

##### Get-Group Memberhship (GRAPH)
Get-MgGroupMember -GroupId 12f1791c-54cb-44b3-9100-2f1c02a6a021  | ForEach-Object { Get-MgUser -UserId $_.Id }

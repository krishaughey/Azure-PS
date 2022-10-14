# Azure
### scripts and statements for Azure, Exchange Online, and Office365

![PowerShell](https://repository-images.githubusercontent.com/221074232/158c2480-5262-11ea-8af0-452a86d9e56d)

##### Connect to AzureAD
    Install-Module AzureAD
    Connect-AzureAd

##### Get Group Membership - Graph
    Get-MgGroupMember -GroupId 12f1791c-54cb-44b3-9100-2f1c02a6a021  | ForEach-Object { Get-MgUser -UserId $_.Id }

##### Get User registered to a Device - Graph
    Get-MgDevice -all -filter "displayName eq '<DISPLAYNAME>'" | %{Get-MgDeviceRegisteredUser -deviceid $_.id | select -ExpandProperty additionalproperties}

##### Get Devices
    Get-AzureADDevice -all $True | select DisplayName,ProfileType,ObjectId
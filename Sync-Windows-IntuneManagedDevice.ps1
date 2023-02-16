$Devices = Get-IntuneManagedDevice -Filter "contains(operatingsystem, 'Windows')"
# $Devices.count (if you want to double check the count if numbers are     matching with Intune console)
Foreach ($Device in $Devices)
{
Invoke-IntuneManagedDeviceSyncDevice -managedDeviceId $Device.managedDeviceId
Write-Host "Sending Sync request to Device with DeviceID $($Device.managedDeviceId)" 
}

##WORK IN PROGRESS

Connect-MgGraph -Scopes 'Device.Read.All, User.Read.All'
$deviceList = Get-Content ~/temp/ServerList.txt
foreach($device in $deviceList){
    $Id = Get-MgDevice -search "displayName:$device" -ConsistencyLevel eventual
    Get-MgDeviceRegisteredUser -deviceid $Id.DeviceId | Select-Object -ExpandProperty additionalproperties
}

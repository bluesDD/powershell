Write-Output "Start checking services."

# 確認したいサービス名の配列
$SERVICES = @("SENS", "seclogon")
$SERVICE_HEALTH = "Running"

$services_result =　Get-Service　$SERVICES
$services_status =　$services_result |ForEach-Object{$_.Status}
$services_name =　$services_result |ForEach-Object{$_.Name}
$exit_message = "All target services is runnning!" 

for ($i = 0; $i -lt $services_status.Count; $i++) {
    if ($services_status[$i] -ne $SERVICE_HEALTH) {
        $exit_message = "Some services are not running..."
        Write-Output "$services_name[$i] is not working"
    }
}
Show-Message $exit_message
Write-Output "Finished checking services."

function Show-Message ($message){
    $obj = New-Object -ComObject wscript.shell
    return $obj.popup($message)
}
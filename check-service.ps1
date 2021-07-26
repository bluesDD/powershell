# 確認したいサービス名の配列
$TargetServices = @("SENS")
# 確認したいサービスの状態
$TargetServicesHealth = "Running"
$exitMessage = "OK: status of target services are '$($TargetServicesHealth)'" 

$startDate = Get-Date -DisplayHint DateTime
Write-Output "$($startDate) Started checking status of:"
Write-Output "$($TargetServices)"

Get-Service　$TargetServices -ErrorAction Stop | ForEach-Object {
    if ($_.Status -ne $TargetServicesHealth) {
        Write-Output "$($_.Name) NG"
        $exitMessage = "Status of some services are not '$($TargetServicesHealth)'..."
    }
}

Write-Output $exitMessage

$endDate = Get-Date -DisplayHint DateTime
Write-Output "$($endDate) Finished checking services"


# $services_status =　$services_result |ForEach-Object{$_.Status}
# $services_name =　$services_result |ForEach-Object{$_.Name}
# for ($i = 0; $i -lt $services_status.Count; $i++) {
#     if ($services_status[$i] -ne $SERVICE_HEALTH) {
#         $exit_message = "Some services are not running..."
#         Write-Output "$services_name[$i] is not working"
#     }
# }
# Show-ResultMessage $exit_message

# function Show-ResultMessage ($message){
#     $obj = New-Object -ComObject wscript.shell
#     return $obj.popup($message)
# }
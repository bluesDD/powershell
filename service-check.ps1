Write-Output "Start checking services."

# 確認したいサービス名の配列
$SERVICES = @("SENS", "seclogon")
$SERVICE_HEALTH = "Running"

$services_status =　Get-Service　$SERVICES |ForEach-Object{$_.Status}
$exit_message = "All target services is runnning!" 

for ($i = 0; $i -lt $services_status.Count; $i++) {
    if ($services_status[$i] -ne $SERVICE_HEALTH) {
        $exit_message = "Some service are not running..."
    }
}

Write-Output $exit_message
Write-Output "Finished checking services."
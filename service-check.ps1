Write-Output "Start checking services !"

# 確認したいサービス名の配列
$SERVICES = @("SENS", "seclogon")

# foreach ($service In $SERVICES) {
#     Get-Service　$service
# }

Get-Service　$SERVICES

Write-Output "Script ended 1 !"
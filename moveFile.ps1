$startDate = Get-Date -DisplayHint DateTime
Write-Output "$($startDate) Started $($myInvocation.MyCommand.name)"

$TargetFileName = "testMove.html"
$TargetFileDirectory = ".\"
$TargetFile = $TargetFileDirectory + $TargetFileName
$DestinationDirectory = ".\docs"

try {
    Copy-Item -Path $TargetFile -Destination $DestinationDirectory -errorAction stop
    Write-Output "Successfully copied"
} catch {
    Write-Output "Failed to copy"
    $errorMessage = $_.Exception.Message
    Write-Output $errorMessage
} finally {
    $endDate = Get-Date -DisplayHint DateTime
    Write-Output "$($endDate) Finished $($myInvocation.MyCommand.name)"
}

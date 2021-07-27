$TargetFiles = $(".\testMove.html", ".\testRemove.html")

$startDate = Get-Date -DisplayHint DateTime
Write-Output "$($startDate) Started $($myInvocation.MyCommand.name)"


foreach ($file in $TargetFiles) {
    if (Test-Path $file) {
        Remove-Item $file
        Write-Output "Removed $($file)"
    } else {
        Write-Output "Could not be found $($file)"
    }
}


$endDate = Get-Date -DisplayHint DateTime
Write-Output "$($endDate) Finished $($myInvocation.MyCommand.name)"

# try {
#     Remove-Item $TargetFiles -errorAction stop
#     Write-Output "Successfully removed"
# } catch {
#     Write-Output "Failed to remove files"
#     $errorMessage = $_.Exception.Message
#     Write-Output $errorMessage
# } finally {
#     $endDate = Get-Date -DisplayHint DateTime
    
#     Write-Output "$($endDate) Finished $($myInvocation.MyCommand.name)"
# }

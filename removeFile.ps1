$TargetFiles = $(".\testMove.html")

$startDate = Get-Date -DisplayHint DateTime
Write-Output "$($startDate) Started $($myInvocation.MyCommand.name)"


foreach ($file in $TargetFiles) {
    if ( -not (Test-Path $file)) {
        Write-Output "Could not be found $($file). Exit."
        exit
    }
    
    Remove-Item $file -Confirm

    # Remove-Itemが実行されなかった場合の終了処理
    if (Test-Path $file) {
        Write-Output "File was not removed. Exit."
        exit
    }
    Write-Output "File was deleted."
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

$startDate = Get-Date -DisplayHint DateTime
Write-Output "$($startDate) Started $($myInvocation.MyCommand.name)"

$TargetFile = ".\testMove.html"
$DestinationDirectory = ".\docs"
# TODO Define $DestinationFile
try {
    Copy-Item -Path $TargetFile -Destination $DestinationDirectory -errorAction stop
} catch {
    Write-Output "Failed to copy. Exit"
    $errorMessage = $_.Exception.Message
    Write-Output $errorMessage
    exit
}
if ( -not (Test-Path $DestinationFile )) {
    Write-Output "File was not copied. Exit"
    exit
}

Write-Output "File was copied"
}

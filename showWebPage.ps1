$URL = "https://www.google.co.jp"

# IEオブジェクト
$ie = New-Object -ComObject InternetExplorer.Application

# URL指定してIEを開く
$ie.Navigate($URL, 4)
$ie.Visible = $true
# ロード完了まで待機
While($ie.busy){
    Start-Sleep -Milliseconds 100
}
Start-Sleep -Seconds 2

# スクリーンキャプチャ
$bitmap = New-Object System.Drawing.Bitmap($ie.Width, $ie.Height)
$graphics = [System.Drawing.Graphics]::FromImage($bitmap)
$graphics.CopyFromScreen($ie.Left, $ie.Top, 0, 0, $bitmap.Size)
$savedDate = Get-Date -DisplayHint DateTime
$bitmap.Save("screenshot-.jpg")

# IEを終了する
$ie.Quit()

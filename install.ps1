# Get-Executionpolicy
# Set-Executionpolicy RemoteSigned

if (Get-Command -Name winget -ErrorAction SilentlyContinue) {
  Write-Output "winget success."
}
else {
  Write-Output "download winget"
  Invoke-WebRequest -Uri "https://github.com/microsoft/winget-cli/releases/download/v1.2.10271/Microsoft.DesktopAppInstaller_8wekyb3d8bbwe.msixbundle" -OutFile "./DesktopAppInstaller.msixbundle"
}

# Apps
$install_apps = @(
  @{ id = "Git.Git"; name = "Git"; location = "D:\Program Files\Git" }
  @{ id = "Google.Chrome"; name = "Google Chrome"; location = "" }
  @{ id = "Tonec.InternetDownloadManager"; name = "Internet Download Manager"; location = "" }
  @{ id = "Notepad++.Notepad++"; name = "Notepad++"; location = "D:\Program Files\Notepad++" }
  @{ id = "Tencent.QQWubi"; name = "QQWubi"; location = "D:\Program Files (x86)\Tencent\QQWubi" }
  @{ id = "Tencent.TIM"; name = "TIM"; location = "D:\Program Files (x86)\Tencent\TIM" }
  @{ id = "Tencent.WeChat"; name = "WeChat"; location = "D:\Program Files (x86)\Tencent\WeChat" }
  @{ id = "RARLab.WinRAR"; name = "WinRAR"; location = "" }
  @{ id = "Fndroid.ClashForWindows"; name = "Clash for Windows"; location = "D:\Program Files\Clash for Windows" }
  @{ id = "Python.Python.3"; name = "Python 3"; location = "" }
  @{ id = "TheDocumentFoundation.LibreOffice"; name = "LibreOffice"; location = "D:\Program Files\LibreOffice" }
  @{ id = "Neovim.Neovim"; name = "Neovim"; location = "D:\Program Files\Neovim" }
  @{ id = "OpenJS.NodeJS"; name = "Node.js"; location = "D:\Program Files\nodejs" }
  @{ id = "Yarn.Yarn"; name = "Yarn"; location = "D:\Program Files (x86)\Yarn" }
  @{ id = "Microsoft.VisualStudioCode"; name = "Microsoft Visual Studio Code"; location = "D:\Program Files\Microsoft VS Code" }
)

foreach ($app in $install_apps) {
  if ($app.location -eq "") {
    winget install --id $app.id --accept-package-agreements --accept-source-agreements
  } else {
    winget install --id $app.id -l $app.location --accept-package-agreements --accept-source-agreements
  }
}
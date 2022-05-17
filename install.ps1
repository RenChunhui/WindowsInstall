# Get-Executionpolicy
# Set-Executionpolicy RemoteSigned

if (Get-Command -Name winget -ErrorAction SilentlyContinue) {
  Write-Output "winget success."
}
else {
  Write-Output "download winget"
  Invoke-WebRequest -Uri "https://github.com/microsoft/winget-cli/releases/download/v1.2.10271/Microsoft.DesktopAppInstaller_8wekyb3d8bbwe.msixbundle" -OutFile "./DesktopAppInstaller.msixbundle"
}

# Change environment variables
if ([Environment]::GetEnvironmentVariable('ProgramFiles') -eq 'C:\Program Files') {
  $Env:ProgramFiles = 'D:\Program Files'
} 

if ([Environment]::GetEnvironmentVariable('ProgramFiles(x86)') -eq 'C:\Program Files (x86)') {
  [Environment]::SetEnvironmentVariable('ProgramFiles(x86)','D:\Program Files (x86)')
} 

if ([Environment]::GetEnvironmentVariable('ProgramW6432') -eq 'C:\Program Files') {
  $Env:ProgramW6432 = 'D:\Program Files'
} 

winget import -i .\install.json --ignore-unavailable --ignore-versions --accept-package-agreements --accept-source-agreements
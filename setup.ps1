#
# Generic system things
#
& $env:windir\system32\tzutil /s "UTC"

# show hidden files.
Set-ItemProperty -Path HKCU:Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced -Name Hidden -Value 1

# show file extensions.
Set-ItemProperty -Path HKCU:Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced -Name HideFileExt -Value 0

# display full path in the title bar.
New-Item -Path HKCU:Software\Microsoft\Windows\CurrentVersion\Explorer\CabinetState -Force `
    | New-ItemProperty -Name FullPath -Value 1 -PropertyType DWORD `
    | Out-Null

#
# Now install the container features
#
Install-WindowsFeature Containers

$progressPreference = 'silentlyContinue'
Install-Package NuGet -Force
Install-Module DockerMsftProvider -Force
Install-Package Docker -ProviderName DockerMsftProvider -Force

if ((Get-WmiObject Win32_ComputerSystemProduct Vendor).Vendor -eq 'QEMU') {
    Install-WindowsFeature Hyper-V,Hyper-V-PowerShell
}



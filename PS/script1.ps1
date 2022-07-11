hostname
Write-Host "Welcome to the World of PowerShell" -ForegroundColor Green

$hostName = Read-Host -Prompt "Enter your Workstation Name ..."

Write-Host "Connecting to $hostName" -ForegroundColor Yellow

Test-Connection -ComputerName $hostName -Count 1
Test-Connection -ComputerName $hostName -Count 1 | select -Property IPV4Address,IPV6Address



$hostsDataFilePath = "C:\Users\user525\Documents\PS\Files-CSV\Hosts.csv"
$hostsDataOutputPath = "C:\Users\user525\Documents\PS\Files-CSV\Hosts-Status.csv"

$hosts = Import-Csv -Path $hostsDataFilePath -Encoding ASCII
$outputs = @()
$serverEntries = 0

foreach($hostInfo in $hosts)
{
    if($hostInfo.Type -eq "Server")
    {
        $serverEntries += 1

        Write-Host "Connecting to" $hostInfo.HostName " (Located in" $hostInfo.Location ")..." -ForegroundColor Yellow

        try
        {
            $status = Test-Connection -ComputerName $hostInfo.HostName -Count 1 -ErrorAction Stop
            $data = @{
                Source=$hostInfo.HostName
                IPV4Address=$status.IPV4Address
                IPV6Address=$status.IPV6Address
                Status="Available"
                Message=$NULL
            }
        }
        catch
        {
            $data = @{
                Source=$hostInfo.HostName
                IPV4Address=$NULL
                IPV6Address=$NULL
                Status="Not Available"
                Message=$Error[0]
            }
        }
        
        $statusObject = New-Object PSObject -Property $data
        $outputs += $statusObject        
    }
}

$outputs | Export-Csv -Path $hostsDataOutputPath -NoTypeInformation

$unavailableEntries = @($outputs | ? { $_.Status -eq "Not Available" }).Count
$availableEntries = @($outputs | ? { $_.Status -eq "Available" }).Count

Write-Host "Total Available Hosts ..." $availableEntries " (Out Of)" $serverEntries
Write-Host "Total Unavailable Hosts ..." $unavailableEntries" (Out Of)" $serverEntries


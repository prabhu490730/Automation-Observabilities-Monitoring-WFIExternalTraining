hostname
$hostsDataFilePath = "C:\Users\user525\Documents\PS\Files-CSV\Hosts.csv"

$hosts = Import-Csv -Path $hostsDataFilePath -Encoding ASCII

foreach($hostInfo in $hosts)
{
    if($hostInfo.Type -eq "Server")
    {
        Write-Host "Connecting to" $hostInfo.HostName " (Located in" $hostInfo.Location ")..." -ForegroundColor Yellow

        Test-Connection -ComputerName $hostInfo.HostName -Count 1 -ErrorAction Continue
    }
}

Get-Process | Sort-Object -Descending -Property "CPU" | select -First 10
hostname

$hostsXmlPath = "C:\Users\user525\Documents\PS\Files-CSV\Hosts.xml"
$xmlFileContents = Get-Content -Path $hostsXmlPath
$hostsXmlData = [xml] $xmlFileContents
$outputFolder = "C:\Users\user525\Documents\PS\Files-CSV\"

foreach($hostInfo in $hostsXmlData.Hosts.Host)
{
    $hostName = $hostInfo.HostName
    $location = $hostInfo.Location
    $priority = $hostInfo.Priority
    $type = $hostInfo.Type

    if($type -eq "Server" -and $priority -le 2)
    {
        try
        {
            Write-Host "Connecting, Processing, Collecting Data from ..." $hostName "(Priority:" $priority")" 

            $top10Processes = Get-Process -ComputerName $hostName |
                Sort-Object -Property "CPU" -Descending |
                Select-Object -First 10 -Property Name,Path,CPU,ProcessName,StartTime,Threads -ErrorAction SilentlyContinue

            $outputFileName = $outputFolder + "\\" + $hostName + "-top10-processes.csv"

            $top10Processes | Export-Csv -NoTypeInformation -Path $outputFileName
        }
        catch
        {
            Write-Host "Unable to connect the Host ..." $hostName
        }
    }
}


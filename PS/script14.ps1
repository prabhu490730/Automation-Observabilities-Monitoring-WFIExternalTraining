# Read Selected File Lines and values using Function
function get-hosts {
    param(
        [Parameter(Mandatory = $true)] [string] $hostsFilePath,
        [Parameter(Mandatory = $true)] [string] $hostType
    )

    $status = Test-Path $hostsFilePath

    if ($status -eq $false) {
        throw "Invalid File Name Specified!"
    }

    $hostsFileContents = Get-Content $hostsFilePath
    $hosts = [xml] $hostsFileContents
    $matchingRecords = @()

    foreach ($hostInfo in $hosts.Hosts.Host) {
        if ($hostInfo.Type -eq $hostType) {
            $matchingRecords += $hostInfo
        }
    }

    $matchingRecords
}

$hostsFilePath = "C:\Users\user525\Documents\PS\Files-CSV\Hosts.xml"
$servers = get-hosts -hostsFilePath $hostsFilePath -hostType Server

$servers | % { $_.HostName }

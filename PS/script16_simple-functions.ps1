
# Calling Script15_utilities.psm1 using this file function..!!

Import-Module .\utilities.psm1

$hostsFilePath = "C:\Users\user525\Documents\PS\Files-CSV\Hosts.xml"
$servers = get-hosts -hostsFilePath $hostsFilePath -hostType Server

$servers | % { $_.HostName }

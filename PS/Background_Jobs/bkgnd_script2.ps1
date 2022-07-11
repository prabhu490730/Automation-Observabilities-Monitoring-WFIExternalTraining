foreach($job in $listofJobs) {
    while(@(Get-Job -State Running).Count -gt 10) {
        Start-Sleep -Seconds 10
    }

    Start-Job -ScriptBlock {
        Start-Sleep -Seconds (Get-Random -Minimum 10 -Maximum 50)
    }
}
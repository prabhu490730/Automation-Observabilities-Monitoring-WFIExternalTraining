$job = Start-Job -ScriptBlock {
    1..10 | ForEach-Object {
        $_

        Start-Sleep -Seconds 2
    }
}

Write-Host 'Sleeping 2 seconds ...'

Start-Sleep -Seconds 2 

$job | Receive-Job 

Write-Host 'Sleeping for 5 seconds more ...'

Start-Sleep -Seconds 5

$job | Receive-Job 
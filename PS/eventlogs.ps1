# Evnet Logs

Get-WinEvent -ListLog * | Sort-Object -Descending "RecordCount" | select LogName, RecordCount


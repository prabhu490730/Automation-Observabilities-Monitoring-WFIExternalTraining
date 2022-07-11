# Looping in PS

$names = @("Ramkumar", "Suresh", "Sandeep", "Aprajitha", "Dinesh")

for($i=0;$i -lt $names.Length;$i++) 
{
    $currentName = $names[$i]

    Write-Host "Currently Evaluating the IT Resource ... $currentName" -ForegroundColor Yellow
}

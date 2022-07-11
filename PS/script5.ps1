
$names = @("Ramkumar", "Suresh", "Sandeep", "Aprajitha", "Dinesh")

foreach($name in $names)
{
    Write-Host "Working with $name" -ForegroundColor Yellow
}

Write-Host "Different approach to looping ..."

$names | foreach { Write-Host "Working with $_" }

Write-Host "Another Approach which is quite advanced ..."
Write-Host " Working with: "

$names | % { $_ }


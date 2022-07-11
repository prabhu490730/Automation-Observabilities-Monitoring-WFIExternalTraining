#Switch Cases: Write multiple If Cases

$x = 45

switch($x) 
{
    1 { Write-Host "Value is One" }
    2 { Write-Host "Value is Two" }
    22 { Write-Host "Value is Twenty Two" }
    22 { Write-Host "Value is Twenty Two Again" }
    default { Write-Host "Value is Something Which I can't Understand!" -ForegroundColor Yellow }
}

#Dictionary 
$userprofile = @{id=1;name="Rajkumar";location="Hyderabad"}

foreach($key in $userprofile.Keys) 
{
    $value = $userprofile[$key]

    Write-Host "Key : $key, Value: $value" -ForegroundColor Green
}

Write-Host "Name of the Profile : " $userprofile["name"] -ForegroundColor Yellow


$userprofile.Keys | % { $userprofile[$_] }

@(1,2,3,4,5) | % { $_ }

# ?: Where Condition or filtering, %: For Loop Condition, $_: Printing the Value
@(1..5) | ? { $_ -ge 3 } | % { $_ }

#using conditional statements

$x = 10

if($x -le 0)
{
    Write-Host "Invalid Input" -ForegroundColor Red
} 
else 
{
    Write-Host "Value is Accepted ..." -ForegroundColor Green
}

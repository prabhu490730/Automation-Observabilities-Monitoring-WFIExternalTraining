# PowerShell brackets
# {} () []
# {} - Enclosing Statements / Blocks - Dictionaries
# () - Passing Arguments, Create Array
# [] - Accessing Array Elements, Access to Dictionary Values and Filter using Regular Expressions

$names = @("Raj", "Ram", "Mahesh", "Uma")

foreach($name in $names) 
{
    if($name -match "Ra")
    {
        Write-Host $name
    }
}

Write-Host "First Element: " $names[0]
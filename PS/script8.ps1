
# Regular Expression Support

$phone = "99999-30303"
$pattern = "^\d{3,5}-\d{3,5}$"

# ^ starts with
# \d digits
# {} condition
# {3,5} - min of 3 and max of 5 (min of 3 digits and max of 5 digits)
# $ ends with

$match = $phone -match $pattern

Write-Host $match -ForegroundColor Green
# Active Directory User Management Automation Script
Write-Host "Starting AD User Management..." -ForegroundColor Green

# Import Active Directory module
Import-Module ActiveDirectory

# Create a new user from a CSV file
$users = Import-Csv "C:\Users\Administrator\Desktop\users.csv"

foreach ($user in $users) {
    New-ADUser -Name $user.Name -GivenName $user.FirstName -Surname $user.LastName `
        -UserPrincipalName "$($user.FirstName).$($user.LastName)@domain.com" `
        -Path "OU=Users,DC=domain,DC=com" -AccountPassword (ConvertTo-SecureString "P@ssw0rd" -AsPlainText -Force) `
        -Enabled $true

    Write-Host "User $($user.Name) created successfully!" -ForegroundColor Cyan
}

Write-Host "Active Directory User Management Completed!" -ForegroundColor Green

# Import Active Directory module
Import-Module ActiveDirectory

# Define password (Security Concern - Consider secure storage)
$password = ConvertTo-SecureString "password" -AsPlainText -Force

# Function to create user
function Create-ADUser {
    param (
        [string]$FullName,
        [string]$OUPath
    )

    try {
        # Check for valid FullName and OUPath
        if (![string]::IsNullOrWhiteSpace($FullName) -and (Test-Path "AD:\$OUPath")) {
            # Split Full Name into first and last names (remove special characters)
            $splitName = $FullName -replace '[^\w\s-]', '' -split ' '
            if ($splitName.Count -eq 2) {
                $firstName = $splitName[0].ToLower()
                $lastName = $splitName[1].ToLower()
                $username = "$firstName.$lastName"

                # Check for existing users
                $existingUsers = Get-ADUser -Filter "SamAccountName -eq '$username'"
                if ($existingUsers) {
                    # Append a number to make the username unique
                    $index = 1
                    do {
                        $index++
                        $username = "$firstName.$lastName$index"
                        $existingUsers = Get-ADUser -Filter "SamAccountName -eq '$username'"
                    } while ($existingUsers)
                }

                # Create user with unique username
                New-ADUser -Name $username -AccountPassword $password -Enabled $true -Path "AD:\$OUPath"
                Write-Host "User $FullName created successfully in $OUPath with username $username"
            } else {
                Write-Host "Full name '$FullName' is not in the correct format. Expected format: 'First Last'."
            }
        } else {
            if ([string]::IsNullOrWhiteSpace($FullName)) {
                Write-Warning "Full name is null or empty"
            }
            if (!(Test-Path "AD:\$OUPath")) {
                Write-Warning "OU path '$OUPath' does not exist."
            }
        }
    }
    catch {
        throw "Error creating user $FullName: $($_.Exception.Message)"
    }
}

# Domain and OU Information
$Domain = "test.local"

$users = @(
    @{ FullName = "Mira Keller"; OUPath = "OU=Sales,DC=test,DC=local"},
    @{ FullName = "Dallas Pruitt"; OUPath = "OU=IT,DC=test,DC=local"},    
    @{ FullName = "Aedan Pennington"; OUPath = "OU=HR,DC=test,DC=local"},
    @{ FullName = "Shelby Boyd"; OUPath = "OU=Ledelse,DC=test,DC=local"},
    @{ FullName = "Giancarlo Matthews"; OUPath = "OU=Arbeider,DC=test,DC=local"}
)

# Loop through each user in the array and create users
foreach ($user in $users) {
    try {
        Create-ADUser -FullName $user.FullName -OUPath $user.OUPath
    }
    catch {
        Write-Error $_
    }
}

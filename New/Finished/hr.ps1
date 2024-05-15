# Function to generate a username in the format firstname.lastname
function GenerateUsername($firstName, $lastName) {
    return "$($firstName.ToLower()).$($lastName.ToLower())"
}

# Function to create a user account in Active Directory
function CreateADUser($firstName, $lastName, $phoneNumber, $email) {
    # Generate username
    $username = GenerateUsername $firstName $lastName
    
    # Set password (you may want to customize this)
    $password = "P@ssw0rd123"

    # Create user principal name (UPN)
    $userPrincipalName = "$username@bjerkerud.local"  # Update 'yourdomain.com' with your actual domain

    # Set other attributes
    $displayName = "$firstName $lastName"
    $ou = "OU=HR,DC=bjerkerud,DC=local"  # Update 'yourdomain.com' with your actual domain

    # Create the user account
    New-ADUser `
        -SamAccountName $username `
        -UserPrincipalName $userPrincipalName `
        -Name $displayName `
        -GivenName $firstName `
        -Surname $lastName `
        -DisplayName $displayName `
        -AccountPassword (ConvertTo-SecureString -AsPlainText $password -Force) `
        -Enabled $true `
        -OfficePhone $phoneNumber `
        -EmailAddress $email `
        -Path $ou
}

# Example usage:
CreateADUser "Aedan" "Pennington" "7972177992" "kaz-agucopu13@gmail.com"
CreateADUser "Daniela" "Foley" "7588397545" "jogogu-zejo44@outlook.com"
CreateADUser "Kolten" "Kerr" "6542543582" "vay_agiyifu24@hotmail.com"
CreateADUser "Junior" "Cunningham" "2789853086" "tigot_ejane1@yahoo.com"
CreateADUser "Daniella" "Coleman" "2249285633" "tamohul_uhi94@hotmail.com"

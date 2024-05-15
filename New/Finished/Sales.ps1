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
    $ou = "OU=Sales,DC=bjerkerud,DC=local"  # Update 'yourdomain.com' with your actual domain

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
CreateADUser "Mira" "Keller" "3816128043" "biv-ikacore81@outlook.com" 
CreateADUser "Johan" "Duke" "4762614010" "kosidu-dori30@hotmail.com"
CreateADUser "London" "Cunningham" "5576433285" "fadal_acize96@gmail.com"
CreateADUser "Claire" "Melton" "9153542265" "leciy-ejuka9@aol.com"
CreateADUser "Kareem" "Garrison" "6997949084" "mes_ozogasu99@outlook.com"
CreateADUser "Kyler" "Ferrell" "2266909939" "leh-osucuko31@mail.com"
CreateADUser "Camryn" "Carver" "3135307725" "sayeru_vuru32@aol.com"
CreateADUser "Edith" "Campbell" "9924509590" "xikide_bebo26@yahoo.com"
CreateADUser "Reed" "Glover" "3854671000" "vigowe-jepe60@hotmail.com"
CreateADUser "Cailyn" "Hobbs" "7109785329" "vadot-apuwe65@mail.com"
CreateADUser "Jade" "Mosley" "8297933744" "bose_wituwu7@aol.com"
CreateADUser "Deandre" "Daugherty" "3174116246" "suru-wonocu12@outlook.com" 

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
     $ou = "OU=Ledelse,DC=bjerkerud,DC=local"  # Update 'yourdomain.com' with your actual domain

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

CreateADUser "Shelby" "Boyd" "4132839869" "megire_lija76@yahoo.com"
CreateADUser "Patience" "Choi" "4737408100" "nosekis_avu99@yahoo.com"
CreateADUser "Weston" "Wolfe" "3427302001" "yuna-bopugi67@outlook.com"
CreateADUser "Natalia" "Tate" "4092681000" "piveyet-abi9@gmail.com"
CreateADUser "Monserrat" "Weiss" "5216416444" "pacode_ducu8@outlook.com"
CreateADUser "Lennon" "Macdonald" "6379847163" "mirilev_ipo28@mail.com"
CreateADUser "Alina" "Mueller" "6003975340" "xuluv_atina17@yahoo.com"
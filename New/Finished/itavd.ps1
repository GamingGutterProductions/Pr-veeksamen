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
   $ou = "OU=IT,DC=bjerkerud,DC=local"  # Update 'yourdomain.com' with your actual domain

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
CreateADUser "Dallas" "Pruitt" "5624299561"  "ram_efexopa73@yahoo.com" 
CreateADUser "Makhi" "Robertson" "5894865145" "yohec-orevo83@aol.com"  
CreateADUser "Mark" "Walsh"  "7024671819" "xitimu_xele44@yahoo.com"
CreateADUser "Kamden" "Black"  "2493584096" "vofar_akohi45@yahoo.com"
CreateADUser "Andrew" "Hale" "5708809048" "yafog-onuwa16@mail.com" 
CreateADUser "Katelynn" "Odom"  "3258537560" "hikoled_usu89@outlook.com"
CreateADUser "Francisco" "Dalton" "9258901177"  "meyi_voleji61@outlook.com" 
CreateADUser "Esther" "Davenport"  "4344092897" "deboy-asuji8@outlook.com"
CreateADUser "Tommy" "Beltran" "2659281112" "zuhunef_iju75@yahoo.com"

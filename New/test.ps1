#Function to generate a username in the format firstname.lastname
function GenerateUsername($firstName, $lastName) {
    return "$($firstName.ToLower()).$($lastName.ToLower())"
}

#Function to create a user account in Active Directory
function CreateADUser($firstName, $lastName, $email, $phoneNumber, $ou) {
    # Generate username
    $username = GenerateUsername $firstName $lastName

    # Set password (you may want to customize this)
    $password = "ByttPassord123!"

    # Create user principal name (UPN)
    $userPrincipalName = "$username@GamasjerAS.local"  # Update 'yourdomain.com' with your actual domain

    # Set other attributes
    $displayName = "$firstName $lastName"

    # Create the user account
    New-ADUser 
        -SamAccountName $username 
        -UserPrincipalName $userPrincipalName 
        -Name $displayName 
        -GivenName $firstName 
        -Surname $lastName 
        -DisplayName $displayName 
        -AccountPassword (ConvertTo-SecureString -AsPlainText $password -Force) 
        -Enabled $true 
        -OfficePhone $phoneNumber 
        -EmailAddress $email `
        -Path $ou
}

Example usage
CreateADUser "Dallas" "Pruitt" "ram_efexopa73@yahoo.com" "5624299561" "OU=IT,DC=GamasjerAS,DC=local"
CreateADUser "Makhi" "Robertson" "yohec-orevo83@aol.com" "5894865145" "OU=IT,DC=GamasjerAS,DC=local"
CreateADUser "Mark" "Walsh" "xitimu_xele44@yahoo.com" "7024671819" "OU=IT,DC=GamasjerAS,DC=local"
CreateADUser "Kamden" "Black" "vofar_akohi45@yahoo.com" "2493584096" "OU=IT,DC=GamasjerAS,DC=local"
CreateADUser "Andrew" "Hale" "yafog-onuwa16@mail.com" "5708809048" "OU=IT,DC=GamasjerAS,DC=local"
CreateADUser "Katelynn" "Odom" "hikoled_usu89@outlook.com" "3258537560" "OU=IT,DC=GamasjerAS,DC=local"
CreateADUser "Francisco" "Dalton" "meyi_voleji61@outlook.com" "9258901177" "OU=IT,DC=GamasjerAS,DC=local"
CreateADUser "Esther" "Davenport" "deboy-asuji8@outlook.com" "4344092897" "OU=IT,DC=GamasjerAS,DC=local"
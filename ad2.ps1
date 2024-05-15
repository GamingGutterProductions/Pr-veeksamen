# Define the parent OU
$ParentOU = "Test"

# Define the domain
$Domain = "test.local"

# Define child OUs and their corresponding users
$OUsAndUsers = @{
    "Sales" = @(
        "Mira,Keller,biv-ikacore81@outlook.com,3816128043,3530",
        "Johan,Duke,kosidu-dori30@hotmail.com,4762614010,3530"
        # Add more users as needed
    )
    "IT" = @(
        "Dallas,Pruitt,ram_efexopa73@yahoo.com,5624299561,3530",
        "Makhi,Robertson,yohec-orevo83@aol.com,5894865145,3530"
        # Add more users as needed
    )
    # Add other OUs and their users similarly
}

# Create child OUs and their users
foreach ($OU in $OUsAndUsers.Keys) {
    # Try creating the OU
    try {
        New-ADOrganizationalUnit -FullName $OU -Path "OU=$OU,OU=$ParentOU,DC=$Domain" -ErrorAction Stop
        Write-Host "OU '$OU' created successfully."

        # Retrieve users for this OU and create them
        $Users = $OUsAndUsers[$OU]
        foreach ($User in $Users) {
            $UserInfo = $User -split ","
            $FirstName = $UserInfo[0].Trim()
            $LastName = $UserInfo[1].Trim()
            $Email = $UserInfo[2].Trim()
            $PhoneNumber = $UserInfo[3].Trim()
            $PostalCode = $UserInfo[4].Trim()

            # Create user account using New-ADUser cmdlet
            New-ADUser -FullName "$FirstName $LastName" -GivenName $FirstName -Surname $LastName -EmailAddress $Email -Path "OU=$OU,OU=$ParentOU,DC=$Domain" -AccountPassword (ConvertTo-SecureString "P@ssw0rd" -AsPlainText -Force) -Enabled $true -ErrorAction Stop
            Write-Host "User '$FirstName $LastName' created successfully in OU '$OU'."
        }
    } catch {
        Write-Host "Error occurred while creating OU '$OU': $_" -ForegroundColor Red
    }
}

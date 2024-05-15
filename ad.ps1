# Import the Active Directory module
Import-Module ActiveDirectory

# Specify the path to the text file
$filePath = "C:\path\to\your\textfile.txt"

# Read the contents of the text file
$contents = Get-Content $filePath

# Loop through each line in the text file
foreach ($line in $contents) {
    # Split the line into an array of values
    $values = $line -split ","

    # Check the first value to determine the type of object to create
    $objectType = $values[0].Trim()

    # Create the object based on the specified type
    switch ($objectType) {
        "User" {
            $username = $values[1].Trim()
            $password = $values[2].Trim()
            $ou = $values[3].Trim()

            # Create the user in the specified OU
            New-ADUser -SamAccountName $username -UserPrincipalName "$username@yourdomain.com" -FullName $username -GivenName $username -Surname "User" -Enabled $true -AccountPassword (ConvertTo-SecureString -AsPlainText $password -Force) -PassThru | Move-ADObject -TargetPath $ou
        }
        "OU" {
            $ouName = $values[1].Trim()
            $parentOU = $values[2].Trim()

            # Create the OU under the specified parent OU
            New-ADOrganizationalUnit -FullName $ouName -Path $parentOU
        }
        "Group" {
            $groupName = $values[1].Trim()
            $groupScope = $values[2].Trim()
            $groupType = $values[3].Trim()
            $ou = $values[4].Trim()

            # Create the group in the specified OU
            New-ADGroup -FullName $groupName -GroupScope $groupScope -GroupCategory $groupType -Path $ou
        }
        default {
            Write-Host "Invalid object type: $objectType"
        }
    }
}
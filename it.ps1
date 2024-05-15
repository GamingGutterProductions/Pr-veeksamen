# Import the Active Directory module
Import-Module ActiveDirectory

# Specify the name of the parent OU
$parentOU = "OU=Test,DC=test,DC=local"

# Specify the name of the new OU
$newOU = "IT"
$newOU = "Sales"

# Create the new OU with accidental deletion protection disabled
New-ADOrganizationalUnit -FullName $newOU -Path $parentOU -ProtectedFromAccidentalDeletion $false -ErrorAction SilentlyContinue

# Check if the OU was created successfully
if (Get-ADOrganizationalUnit -Filter "Name -eq '$newOU'" -SearchBase $parentOU -ErrorAction SilentlyContinue) {
    Write-Host "OU '$newOU' created successfully."
} else {
    Write-Host "Failed to create OU '$newOU'."
}

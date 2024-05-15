# Import the Active Directory module
Import-Module ActiveDirectory

# Specify the name of the parent OU
$parentOU = "OU=Test,DC=test,DC=local"

# Specify the names of the new OUs
$newOUs = @("IT", "HR", "Sales", "Ledelse", "Arbeider")

# Loop through each new OU name and create it
foreach ($newOU in $newOUs) {
    # Create the new OU without accidental deletion protection
    New-ADOrganizationalUnit -FullName $newOU -Path $parentOU -ProtectedFromAccidentalDeletion $false -ErrorAction SilentlyContinue

    # Check if the OU was created successfully
    if (Get-ADOrganizationalUnit -Filter "Name -eq '$newOU'" -SearchBase $parentOU -ErrorAction SilentlyContinue) {
        Write-Host "OU '$newOU' created successfully."
    } else {
        Write-Host "Failed to create OU '$newOU'."
    }
}

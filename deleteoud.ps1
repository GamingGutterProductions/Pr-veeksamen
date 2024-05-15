# Import the Active Directory module
Import-Module ActiveDirectory

# Specify the distinguished name (DN) of the OUs you want to delete
$OU1DN = "OU=Test1,DC=domain,DC=local"


# Disable accidental deletion protection for OU1
Get-ADOrganizationalUnit -Identity $OU1DN | Set-ADObject -ProtectedFromAccidentalDeletion $false

# Delete OU1
Remove-ADOrganizationalUnit -Identity $OU1DN -Confirm:$false
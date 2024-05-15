# Import Active Directory module
Import-Module ActiveDirectory

# Define the path to the text file
$filePath = "C:\Users\Administrator\Desktop\script\ad.txt"

# Check if the file exists
if (Test-Path $filePath) {
    # Read each line from the file
    Get-Content $filePath | ForEach-Object {
        # Split the line into name and department
        $userInfo = $_ -split "="
        $name = $userInfo[0]
        $department = $userInfo[1]
        
        # Map department to the appropriate OU
        switch ($department) {
            "IT" { $ouPath = "OU=IT,DC=test,DC=local" }
            "Ledelse" { $ouPath = "OU=Ledelse,DC=test,DC=local" }
            "HR" { $ouPath = "OU=HR,DC=test,DC=local" }
            "Sales" { $ouPath = "OU=Sales,DC=test,DC=local" }
           "Arbeider" { $ouPath = "OU=Arbeider,DC=test,DC=local" }
            Default { Write-Host "Unknown department: $department" }
        }
        
        # Generate a random password
        $password = "Temp123!"
        $securePassword = ConvertTo-SecureString -String $password -AsPlainText -Force

        # Create the new AD user
        try {
            $newUser = New-ADUser -FullName $name -AccountPassword $securePassword -Enabled $true -Path $ouPath
            Write-Host "User $name created successfully."
        } catch [Exception] {
            $errorMessage = $_.Exception.Message
            Write-Host "Failed to create user $name due to AD error: ${errorMessage}"
        }
    }
    Write-Host "Users imported successfully."
} else {
    Write-Host "File not found: $filePath"
}

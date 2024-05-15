# Import Active Directory module
Import-Module ActiveDirectory

# Define password
$password = ConvertTo-SecureString "Password" -AsPlainText -Force

# Function to create user
function Create-ADUser {
    param (
        [string]$FullName,
        [string]$OUPath
    )

    # Check if $FullName is not null or empty
    if (![string]::IsNullOrWhiteSpace($FullName)) {
        # Check if OU path exists
        if (Test-Path "AD:\$OUPath") {
            # Split full name into first and last names
            $splitName = $FullName -split ' '
            if ($splitName.Count -eq 2) {
                $firstName = $splitName[0].ToLower()
                $lastName = $splitName[1].ToLower()
                $username = "$firstName.$lastName"
                # Check if username already exists
                $existingUsers = Get-ADUser -Filter "SamAccountName -eq '$username'"
                if ($existingUsers) {
                    # Append a number to make the username unique
                    $index = 1
                    do {
                        $index++
                        $username = "$firstName.$lastName$index"
                        $existingUsers = Get-ADUser -Filter "SamAccountName -eq '$username'"
                    } while ($existingUsers)
                }
                # Create user with the unique username
                New-ADUser -Name $username -AccountPassword $password -Enabled $true -Path "AD:\$OUPath"
                Write-Host "User $FullName created successfully in $OUPath with username $username"
            } else {
                Write-Host "Full name '$FullName' is not in the correct format. Expected format: 'First Last'."
            }
        } else {
            Write-Host "OU path '$OUPath' does not exist."
        }
    } else {
        Write-Host "Full name is null or empty"
    }
}

# Define parameters for user creation
$Domain = "test.local"

# Sales Department Users
Create-ADUser -FullName "Mira Keller" -OUPath "OU=Sales,DC=test,DC=local"
Create-ADUser -FullName "Johan Duke" -OUPath "OU=Sales,DC=test,DC=local"
Create-ADUser -FullName "London Cunningham" -OUPath "OU=Sales,DC=test,DC=local"
Create-ADUser -FullName "Claire Melton" -OUPath "OU=Sales,DC=test,DC=local"
Create-ADUser -FullName "Kareem Garrison" -OUPath "OU=Sales,DC=test,DC=local"
Create-ADUser -FullName "Kyler Ferrell" -OUPath "OU=Sales,DC=test,DC=local"
Create-ADUser -FullName "Camryn Carver" -OUPath "OU=Sales,DC=test,DC=local"
Create-ADUser -FullName "Edith Campbell" -OUPath "OU=Sales,DC=test,DC=local"
Create-ADUser -FullName "Reed Glover" -OUPath "OU=Sales,DC=test,DC=local"
Create-ADUser -FullName "Cailyn Hobbs" -OUPath "OU=Sales,DC=test,DC=local"
Create-ADUser -FullName "Jade Mosley" -OUPath "OU=Sales,DC=test,DC=local"
Create-ADUser -FullName "Deandre Daugherty" -OUPath "OU=Sales,DC=test,DC=local"

# IT Department Users
Create-ADUser -FullName "Dallas Pruitt" -OUPath "OU=IT,DC=test,DC=local"
Create-ADUser -FullName "Makhi Robertson" -OUPath "OU=IT,DC=test,DC=local"
Create-ADUser -FullName "Mark Walsh" -OUPath "OU=IT,DC=test,DC=local"
Create-ADUser -FullName "Kamden Black" -OUPath "OU=IT,DC=test,DC=local"
Create-ADUser -FullName "Andrew Hale" -OUPath "OU=IT,DC=test,DC=local"
Create-ADUser -FullName "Katelynn Odom" -OUPath "OU=IT,DC=test,DC=local"
Create-ADUser -FullName "Francisco Dalton" -OUPath "OU=IT,DC=test,DC=local"
Create-ADUser -FullName "Esther Davenport" -OUPath "OU=IT,DC=test,DC=local"
Create-ADUser -FullName "Tommy Beltran" -OUPath "OU=IT,DC=test,DC=local"

# HR Department Users
Create-ADUser -FullName "Aedan Pennington" -OUPath "OU=HR,DC=test,DC=local"
Create-ADUser -FullName "Daniela Foley" -OUPath "OU=HR,DC=test,DC=local"
Create-ADUser -FullName "Kolten Kerr" -OUPath "OU=HR,DC=test,DC=local"
Create-ADUser -FullName "Junior Cunningham" -OUPath "OU=HR,DC=test,DC=local"
Create-ADUser -FullName "Daniella Coleman" -OUPath "OU=HR,DC=test,DC=local"

# Ledelse Department Users
Create-ADUser -FullName "Shelby Boyd" -OUPath "OU=Ledelse,DC=test,DC=local"
Create-ADUser -FullName "Patience Choi" -OUPath "OU=Ledelse,DC=test,DC=local"
Create-ADUser -FullName "Weston Wolfe" -OUPath "OU=Ledelse,DC=test,DC=local"
Create-ADUser -FullName "Natalia Tate" -OUPath "OU=Ledelse,DC=test,DC=local"
Create-ADUser -FullName "Monserrat Weiss" -OUPath "OU=Ledelse,DC=test,DC=local"
Create-ADUser -FullName "Lennon Macdonald" -OUPath "OU=Ledelse,DC=test,DC=local"
Create-ADUser -FullName "Alina Mueller" -OUPath "OU=Ledelse,DC=test,DC=local"

# Arbeider Department Users
Create-ADUser -FullName "Giancarlo Matthews" -OUPath "OU=Arbeider,DC=test,DC=local"
Create-ADUser -FullName "Martin Phelps" -OUPath "OU=Arbeider,DC=test,DC=local"
Create-ADUser -FullName "Ronald Mcintosh" -OUPath "OU=Arbeider,DC=test,DC=local"
Create-ADUser -FullName "Lena Joseph" -OUPath "OU=Arbeider,DC=test,DC=local"
Create-ADUser -FullName "Taylor Avery" -OUPath "OU=Arbeider,DC=test,DC=local"
Create-ADUser -FullName "Jadon Hoffman" -OUPath "OU=Arbeider,DC=test,DC=local"
Create-ADUser -FullName "Ben Sutton" -OUPath "OU=Arbeider,DC=test,DC=local"
Create-ADUser -FullName "Jadyn Fowler" -OUPath "OU=Arbeider,DC=test,DC=local"
Create-ADUser -FullName "Alexis Bartlett" -OUPath "OU=Arbeider,DC=test,DC=local"
Create-ADUser -FullName "Cristina Ponce" -OUPath "OU=Arbeider,DC=test,DC=local"
Create-ADUser -FullName "Lindsey Wilkerson" -OUPath "OU=Arbeider,DC=test,DC=local"
Create-ADUser -FullName "Halle Snow" -OUPath "OU=Arbeider,DC=test,DC=local"
Create-ADUser -FullName "Kristin Ford" -OUPath "OU=Arbeider,DC=test,DC=local"
Create-ADUser -FullName "Londyn Solomon" -OUPath "OU=Arbeider,DC=test,DC=local"
Create-ADUser -FullName "Khloe Hardy" -OUPath "OU=Arbeider,DC=test,DC=local"
Create-ADUser -FullName "Rowan Ruiz" -OUPath "OU=Arbeider,DC=test,DC=local"
Create-ADUser -FullName "Terrell Petty" -OUPath "OU=Arbeider,DC=test,DC=local"
Create-ADUser -FullName "Ian Gilbert" -OUPath "OU=Arbeider,DC=test,DC=local"
Create-ADUser -FullName "Asa Hunt" -OUPath "OU=Arbeider,DC=test,DC=local"
Create-ADUser -FullName "Rodolfo Russell" -OUPath "OU=Arbeider,DC=test,DC=local"
Create-ADUser -FullName "Jamal Berg" -OUPath "OU=Arbeider,DC=test,DC=local"
Create-ADUser -FullName "Ximena Marsh" -OUPath "OU=Arbeider,DC=test,DC=local"
Create-ADUser -FullName "Braxton Hoover" -OUPath "OU=Arbeider,DC=test,DC=local"
Create-ADUser -FullName "Quinn Ray" -OUPath "OU=Arbeider,DC=test,DC=local"
Create-ADUser -FullName "Gerald Cummings" -OUPath "OU=Arbeider,DC=test,DC=local"
Create-ADUser -FullName "Terrell Petty" -OUPath "OU=Arbeider,DC=test,DC=local"
Create-ADUser -FullName "Ian Gilbert" -OUPath "OU=Arbeider,DC=test,DC=local"
Create-ADUser -FullName "Asa Hunt" -OUPath "OU=Arbeider,DC=test,DC=local"
Create-ADUser -FullName "Rodolfo Russell" -OUPath "OU=Arbeider,DC=test,DC=local"
Create-ADUser -FullName "Jamal Berg" -OUPath "OU=Arbeider,DC=test,DC=local"
Create-ADUser -FullName "Jermaine Herring" -OUPath "OU=Arbeider,DC=test,DC=local"
Create-ADUser -FullName "Rodrigo Acosta" -OUPath "OU=Arbeider,DC=test,DC=local"
Create-ADUser -FullName "Aubrey Gibbs" -OUPath "OU=Arbeider,DC=test,DC=local"
Create-ADUser -FullName "Donna Duke" -OUPath "OU=Arbeider,DC=test,DC=local"
Create-ADUser -FullName "Mariah Ewing" -OUPath "OU=Arbeider,DC=test,DC=local"
Create-ADUser -FullName "Amelie Burch" -OUPath "OU=Arbeider,DC=test,DC=local"
Create-ADUser -FullName "Aaden Glover" -OUPath "OU=Arbeider,DC=test,DC=local"
Create-ADUser -FullName "Laney Horne" -OUPath "OU=Arbeider,DC=test,DC=local"
Create-ADUser -FullName "Hanna Shaffer" -OUPath "OU=Arbeider,DC=test,DC=local"
Create-ADUser -FullName "Chase Schmitt" -OUPath "OU=Arbeider,DC=test,DC=local"
Create-ADUser -FullName "Maleah Shannon" -OUPath "OU=Arbeider,DC=test,DC=local"
Create-ADUser -FullName "Sage Stewart" -OUPath "OU=Arbeider,DC=test,DC=local"
Create-ADUser -FullName "Naomi Bender" -OUPath "OU=Arbeider,DC=test,DC=local"
Create-ADUser -FullName "Georgia Mclean" -OUPath "OU=Arbeider,DC=test,DC=local"
Create-ADUser -FullName "Jaylen Villa" -OUPath "OU=Arbeider,DC=test,DC=local"
Create-ADUser -FullName "Bryan Lang" -OUPath "OU=Arbeider,DC=test,DC=local"
Create-ADUser -FullName "Clara Gentry" -OUPath "OU=Arbeider,DC=test,DC=local"
Create-ADUser -FullName "Teagan Blevins" -OUPath "OU=Arbeider,DC=test,DC=local"
Create-ADUser -FullName "Tess Frye" -OUPath "OU=Arbeider,DC=test,DC=local"
Create-ADUser -FullName "Emma Gallagher" -OUPath "OU=Arbeider,DC=test,DC=local"
Create-ADUser -FullName "Paige Velasquez" -OUPath "OU=Arbeider,DC=test,DC=local"
Create-ADUser -FullName "Matthias Patton" -OUPath "OU=Arbeider,DC=test,DC=local"
Create-ADUser -FullName "Terry Evans" -OUPath "OU=Arbeider,DC=test,DC=local"
Create-ADUser -FullName "Genesis Strong" -OUPath "OU=Arbeider,DC=test,DC=local"
Create-ADUser -FullName "Cason Sandoval" -OUPath "OU=Arbeider,DC=test,DC=local"
Create-ADUser -FullName "Angeline Schultz" -OUPath "OU=Arbeider,DC=test,DC=local"
Create-ADUser -FullName "Brynlee Nash" -OUPath "OU=Arbeider,DC=test,DC=local"
Create-ADUser -FullName "Maddison Dawson" -OUPath "OU=Arbeider,DC=test,DC=local"
Create-ADUser -FullName "Anastasia Hendrix" -OUPath "OU=Arbeider,DC=test,DC=local"
Create-ADUser -FullName "Erick Villarreal" -OUPath "OU=Arbeider,DC=test,DC=local"
Create-ADUser -FullName "Ahmed Shelton" -OUPath "OU=Arbeider,DC=test,DC=local"
Create-ADUser -FullName "Samara Kaufman" -OUPath "OU=Arbeider,DC=test,DC=local"
Create-ADUser -FullName "Daphne Harvey" -OUPath "OU=Arbeider,DC=test,DC=local"
Create-ADUser -FullName "Aleena Underwood" -OUPath "OU=Arbeider,DC=test,DC=local"
Create-ADUser -FullName "Charlize Elliott" -OUPath "OU=Arbeider,DC=test,DC=local"
Create-ADUser -FullName "Santos Rivers" -OUPath "OU=Arbeider,DC=test,DC=local"
Create-ADUser -FullName "Tanya Sheppard" -OUPath "OU=Arbeider,DC=test,DC=local"
Create-ADUser -FullName "Abril Holder" -OUPath "OU=Arbeider,DC=test,DC=local"
Create-ADUser -FullName "Ashly Castaneda" -OUPath "OU=Arbeider,DC=test,DC=local"
Create-ADUser -FullName "Justice Bauer" -OUPath "OU=Arbeider,DC=test,DC=local"
Create-ADUser -FullName "Jeffrey Grant" -OUPath "OU=Arbeider,DC=test,DC=local"
Create-ADUser -FullName "Marie Dunlap" -OUPath "OU=Arbeider,DC=test,DC=local"
Create-ADUser -FullName "Noah Davis" -OUPath "OU=Arbeider,DC=test,DC=local"
Create-ADUser -FullName "Avery Holloway" -OUPath "OU=Arbeider,DC=test,DC=local"
Create-ADUser -FullName "Noel Moran" -OUPath "OU=Arbeider,DC=test,DC=local"
Create-ADUser -FullName "Austin Michael" -OUPath "OU=Arbeider,DC=test,DC=local"
Create-ADUser -FullName "Bella Bryan" -OUPath "OU=Arbeider,DC=test,DC=local"
Create-ADUser -FullName "Ciara Fuentes" -OUPath "OU=Arbeider,DC=test,DC=local"
Create-ADUser -FullName "Alessandra Castro" -OUPath "OU=Arbeider,DC=test,DC=local"
Create-ADUser -FullName "Leroy Hobbs" -OUPath "OU=Arbeider,DC=test,DC=local"
Create-ADUser -FullName "Layton Spence" -OUPath "OU=Arbeider,DC=test,DC=local"
Create-ADUser -FullName "Ashlynn Hayes" -OUPath "OU=Arbeider,DC=test,DC=local"
Create-ADUser -FullName "Freddy Middleton" -OUPath "OU=Arbeider,DC=test,DC=local"
Create-ADUser -FullName "Virginia Wallace" -OUPath "OU=Arbeider,DC=test,DC=local"
Create-ADUser -FullName "Lillie Parsons" -OUPath "OU=Arbeider,DC=test,DC=local"
Create-ADUser -FullName "Walter Lawrence" -OUPath "OU=Arbeider,DC=test,DC=local"
Create-ADUser -FullName "Solomon Camacho" -OUPath "OU=Arbeider,DC=test,DC=local"
Create-ADUser -FullName "Alexus Huynh" -OUPath "OU=Arbeider,DC=test,DC=local"
Create-ADUser -FullName "Wyatt Haas" -OUPath "OU=Arbeider,DC=test,DC=local"
Create-ADUser -FullName "Jaydon Sawyer" -OUPath "OU=Arbeider,DC=test,DC=local"
Create-ADUser -FullName "Clare Mcdonald" -OUPath "OU=Arbeider,DC=test,DC=local"
Create-ADUser -FullName "Bennett Mullins" -OUPath "OU=Arbeider,DC=test,DC=local"
Create-ADUser -FullName "Brendon Brewer" -OUPath "OU=Arbeider,DC=test,DC=local"
Create-ADUser -FullName "Lacey Pitts" -OUPath "OU=Arbeider,DC=test,DC=local"
Create-ADUser -FullName "Edward Frost" -OUPath "OU=Arbeider,DC=test,DC=local"
Create-ADUser -FullName "Waylon Barnett" -OUPath "OU=Arbeider,DC=test,DC=local"
Create-ADUser -FullName "Sandra Frederick" -OUPath "OU=Arbeider,DC=test,DC=local"
Create-ADUser -FullName "Abbigail Greene" -OUPath "OU=Arbeider,DC=test,DC=local"
Create-ADUser -FullName "Anika Blake" -OUPath "OU=Arbeider,DC=test,DC=local"
Create-ADUser -FullName "Jaiden Rodriguez" -OUPath "OU=Arbeider,DC=test,DC=local"
Create-ADUser -FullName "Laurel Khan" -OUPath "OU=Arbeider,DC=test,DC=local"
Create-ADUser -FullName "Emely Flynn" -OUPath "OU=Arbeider,DC=test,DC=local"
Create-ADUser -FullName "Kaleb Macias" -OUPath "OU=Arbeider,DC=test,DC=local"
Create-ADUser -FullName "Orion Griffith" -OUPath "OU=Arbeider,DC=test,DC=local"
Create-ADUser -FullName "Yusuf Booker" -OUPath "OU=Arbeider,DC=test,DC=local"
Create-ADUser -FullName "Josiah Leblanc" -OUPath "OU=Arbeider,DC=test,DC=local"
Create-ADUser -FullName "Damian Dyer" -OUPath "OU=Arbeider,DC=test,DC=local"
Create-ADUser -FullName "Clay Hurley" -OUPath "OU=Arbeider,DC=test,DC=local"
Create-ADUser -FullName "Jazlene Winters" -OUPath "OU=Arbeider,DC=test,DC=local"
Create-ADUser -FullName "Jaylee Leon" -OUPath "OU=Arbeider,DC=test,DC=local"
Create-ADUser -FullName "Phoenix Lin" -OUPath "OU=Arbeider,DC=test,DC=local"
Create-ADUser -FullName "Bianca Conner" -OUPath "OU=Arbeider,DC=test,DC=local"
Create-ADUser -FullName "Aleah Mcbride" -OUPath "OU=Arbeider,DC=test,DC=local"
Create-ADUser -FullName "Anabella Dominguez" -OUPath "OU=Arbeider,DC=test,DC=local"
Create-ADUser -FullName "Rolando Flowers" -OUPath "OU=Arbeider,DC=test,DC=local"
Create-ADUser -FullName "Jensen Mullins" -OUPath "OU=Arbeider,DC=test,DC=local"
Create-ADUser -FullName "Trinity Franco" -OUPath "OU=Arbeider,DC=test,DC=local"
Create-ADUser -FullName "Paulina Grimes" -OUPath "OU=Arbeider,DC=test,DC=local"
Create-ADUser -FullName "Heidi Villa" -OUPath "OU=Arbeider,DC=test,DC=local"
Create-ADUser -FullName "Braylee Ho" -OUPath "OU=Arbeider,DC=test,DC=local"
Create-ADUser -FullName "Braxton Vaughan" -OUPath "OU=Arbeider,DC=test,DC=local"
Create-ADUser -FullName "Iliana Rangel" -OUPath "OU=Arbeider,DC=test,DC=local"
Create-ADUser -FullName "Leyla Santana" -OUPath "OU=Arbeider,DC=test,DC=local"
Create-ADUser -FullName "Skye Acevedo" -OUPath "OU=Arbeider,DC=test,DC=local"
Create-ADUser -FullName "Zion Lester" -OUPath "OU=Arbeider,DC=test,DC=local"
# Import Active Directory module
Import-Module ActiveDirectory

# Define password (Security Concern - Consider secure storage)
$password = ConvertTo-SecureString "password" -AsPlainText -Force

# Function to create user
function Create-ADUser {
    param (
        [string]$FullName,
        [string]$OUPath
    )

    # Check for valid FullName and OUPath
    if (![string]::IsNullOrWhiteSpace($FullName) -and (Test-Path "AD:\$OUPath")) {
        # Split Full Name into first and last names (remove special characters)
        $splitName = $FullName -replace '[^\w\s-]', ''  -split ' '
        if ($splitName.Count -eq 2) {
            $firstName = $splitName[0].ToLower()
            $lastName = $splitName[1].ToLower()
            $username = "$firstName.$lastName"

            # Check for existing users
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

            # Create user with unique username
            try {
                New-ADUser -Name $username -AccountPassword $password -Enabled $true -Path "AD:\$OUPath"
                Write-Host "User $FullName created successfully in $OUPath with username $username"
            }
            catch {
                Write-Error "Error creating user ${FullName}: ${_.Exception.Message}"
            }
        } else {
            Write-Host "Full name '$FullName' is not in the correct format. Expected format: 'First Last'."
        }
    } else {
        if ([string]::IsNullOrWhiteSpace($FullName)) {
            Write-Warning "Full name is null or empty"
        }
        if (!(Test-Path "AD:\$OUPath")) {
            Write-Warning "OU path '$OUPath' does not exist."
        }
    }
}

# Domain and OU Information
$Domain = "test.local"


$users = @(
@{ FullName = "Mira Keller"; OUPath = "OU=Sales,DC=test,DC=local" },
@{ FullName = "Johan Duke"; OUPath = "OU=Sales,DC=test,DC=local" },
@{ FullName = "London Cunningham"; OUPath = "OU=Sales,DC=test,DC=local" },
@{ FullName = "Claire Melton"; OUPath = "OU=Sales,DC=test,DC=local" },
@{ FullName = "Kareem Garrison"; OUPath = "OU=Sales,DC=test,DC=local" },
@{ FullName = "Kyler Ferrell"; OUPath = "OU=Sales,DC=test,DC=local" },
@{ FullName = "Camryn Carver"; OUPath = "OU=Sales,DC=test,DC=local" },
@{ FullName = "Edith Campbell"; OUPath = "OU=Sales,DC=test,DC=local" },
@{ FullName = "Reed Glover"; OUPath = "OU=Sales,DC=test,DC=local" },
@{ FullName = "Cailyn Hobbs"; OUPath = "OU=Sales,DC=test,DC=local" },
@{ FullName = "Jade Mosley"; OUPath = "OU=Sales,DC=test,DC=local" },
@{ FullName = "Deandre Daugherty"; OUPath = "OU=Sales,DC=test,DC=local" },
    
@{ FullName = "Dallas Pruitt"; OUPath = "OU=IT,DC=test,DC=local" },
@{ FullName = "Makhi Robertson"; OUPath = "OU=IT,DC=test,DC=local" },
@{ FullName = "Mark Walsh"; OUPath = "OU=IT,DC=test,DC=local" },
@{ FullName = "Kamden Black"; OUPath = "OU=IT,DC=test,DC=local" },
@{ FullName = "Andrew Hale"; OUPath = "OU=IT,DC=test,DC=local" },
@{ FullName = "Katelynn Odom"; OUPath = "OU=IT,DC=test,DC=local" },
@{ FullName = "Francisco Dalton"; OUPath = "OU=IT,DC=test,DC=local" },
@{ FullName = "Esther Davenport"; OUPath = "OU=IT,DC=test,DC=local" },
@{ FullName = "Tommy Beltran"; OUPath = "OU=IT,DC=test,DC=local" },
    
@{ FullName = "Aedan Pennington"; OUPath = "OU=HR,DC=test,DC=local" },
@{ FullName = "Daniela Foley"; OUPath = "OU=HR,DC=test,DC=local" },
@{ FullName = "Kolten Kerr"; OUPath = "OU=HR,DC=test,DC=local" },
@{ FullName = "Junior Cunningham"; OUPath = "OU=HR,DC=test,DC=local" },
@{ FullName = "Daniella Coleman"; OUPath = "OU=HR,DC=test,DC=local" },
    
@{ FullName = "Shelby Boyd"; OUPath = "OU=Ledelse,DC=test,DC=local" },
@{ FullName = "Patience Choi"; OUPath = "OU=Ledelse,DC=test,DC=local" },
@{ FullName = "Weston Wolfe"; OUPath = "OU=Ledelse,DC=test,DC=local" },
@{ FullName = "Natalia Tate"; OUPath = "OU=Ledelse,DC=test,DC=local" },
@{ FullName = "Monserrat Weiss"; OUPath = "OU=Ledelse,DC=test,DC=local" },
@{ FullName = "Lennon Macdonald"; OUPath = "OU=Ledelse,DC=test,DC=local" },
@{ FullName = "Alina Mueller"; OUPath = "OU=Ledelse,DC=test,DC=local" },
    
@{ FullName = "Giancarlo Matthews"; OUPath = "OU=Arbeider,DC=test,DC=local" },
@{ FullName = "Martin Phelps"; OUPath = "OU=Arbeider,DC=test,DC=local" },
@{ FullName = "Ronald Mcintosh"; OUPath = "OU=Arbeider,DC=test,DC=local" },
@{ FullName = "Lena Joseph"; OUPath = "OU=Arbeider,DC=test,DC=local" },
@{ FullName = "Taylor Avery"; OUPath = "OU=Arbeider,DC=test,DC=local" },
@{ FullName = "Jadon Hoffman"; Path = "OU=Arbeider,DC=test,DC=local" },
@{ FullName = "Ben Sutton" Path = "OU=Arbeider,DC=test,DC=local" },
@{ FullName = "Jadyn Fowler" Path = "OU=Arbeider,DC=test,DC=local" },
@{ FullName = "Alexis Bartlett" OUPath = "OU=Arbeider,DC=test,DC=local" },
@{ FullName = "Cristina Ponce" OUPath = "OU=Arbeider,DC=test,DC=local" },
@{ FullName = "Lindsey Wilkerson" OUPath = "OU=Arbeider,DC=test,DC=local" },
@{ FullName = "Halle Snow" OUPath = "OU=Arbeider,DC=test,DC=local" },
@{ FullName = "Kristin Ford" OUPath = "OU=Arbeider,DC=test,DC=local" },
@{ FullName = "Londyn Solomon" OUPath = "OU=Arbeider,DC=test,DC=local" },
@{ FullName = "Khloe Hardy" OUPath = "OU=Arbeider,DC=test,DC=local" },
@{ FullName = "Rowan Ruiz" OUPath = "OU=Arbeider,DC=test,DC=local" },
@{ FullName = "Terrell Petty" OUPath = "OU=Arbeider,DC=test,DC=local" },
@{ FullName = "Ian Gilbert" OUPath = "OU=Arbeider,DC=test,DC=local" },
@{ FullName = "Asa Hunt" OUPath = "OU=Arbeider,DC=test,DC=local" },
@{ FullName = "Rodolfo Russell" OUPath = "OU=Arbeider,DC=test,DC=local" },
@{ FullName = "Jamal Berg" OUPath = "OU=Arbeider,DC=test,DC=local" },
@{ FullName = "Ximena Marsh" OUPath = "OU=Arbeider,DC=test,DC=local" },
@{ FullName = "Braxton Hoover" OUPath = "OU=Arbeider,DC=test,DC=local" },
@{ FullName = "Quinn Ray" OUPath = "OU=Arbeider,DC=test,DC=local" },
@{ FullName = "Gerald Cummings" OUPath = "OU=Arbeider,DC=test,DC=local" },
@{ FullName = "Terrell Petty" OUPath = "OU=Arbeider,DC=test,DC=local" },
@{ FullName = "Ian Gilbert" OUPath = "OU=Arbeider,DC=test,DC=local" },
@{ FullName = "Asa Hunt" OUPath = "OU=Arbeider,DC=test,DC=local" },
@{ FullName = "Rodolfo Russell" OUPath = "OU=Arbeider,DC=test,DC=local" },
@{ FullName = "Jamal Berg" OUPath = "OU=Arbeider,DC=test,DC=local" },
@{ FullName = "Jermaine Herring" OUPath = "OU=Arbeider,DC=test,DC=local" },
@{ FullName = "Rodrigo Acosta" OUPath = "OU=Arbeider,DC=test,DC=local" },
@{ FullName = "Aubrey Gibbs" OUPath = "OU=Arbeider,DC=test,DC=local" },
@{ FullName = "Donna Duke" OUPath = "OU=Arbeider,DC=test,DC=local" },
@{ FullName = "Mariah Ewing" OUPath = "OU=Arbeider,DC=test,DC=local" },
@{ FullName = "Amelie Burch" OUPath = "OU=Arbeider,DC=test,DC=local" },
@{ FullName = "Aaden Glover" OUPath = "OU=Arbeider,DC=test,DC=local" },
@{ FullName = "Laney Horne" OUPath = "OU=Arbeider,DC=test,DC=local" },
@{ FullName = "Hanna Shaffer" OUPath = "OU=Arbeider,DC=test,DC=local" },
@{ FullName = "Chase Schmitt" OUPath = "OU=Arbeider,DC=test,DC=local" },
@{ FullName = "Maleah Shannon" OUPath = "OU=Arbeider,DC=test,DC=local" },
@{ FullName = "Sage Stewart" OUPath = "OU=Arbeider,DC=test,DC=local" },
@{ FullName = "Naomi Bender" OUPath = "OU=Arbeider,DC=test,DC=local" },
@{ FullName = "Georgia Mclean" OUPath = "OU=Arbeider,DC=test,DC=local" },
@{ FullName = "Jaylen Villa" OUPath = "OU=Arbeider,DC=test,DC=local" },
@{ FullName = "Bryan Lang" OUPath = "OU=Arbeider,DC=test,DC=local" },
@{ FullName = "Clara Gentry" OUPath = "OU=Arbeider,DC=test,DC=local" },
@{ FullName = "Teagan Blevins" OUPath = "OU=Arbeider,DC=test,DC=local" },
@{ FullName = "Tess Frye" OUPath = "OU=Arbeider,DC=test,DC=local" },
@{ FullName = "Emma Gallagher" OUPath = "OU=Arbeider,DC=test,DC=local" },
@{ FullName = "Paige Velasquez" OUPath = "OU=Arbeider,DC=test,DC=local" },
@{ FullName = "Matthias Patton" OUPath = "OU=Arbeider,DC=test,DC=local" },
@{ FullName = "Terry Evans" OUPath = "OU=Arbeider,DC=test,DC=local" },
@{ FullName = "Genesis Strong" OUPath = "OU=Arbeider,DC=test,DC=local" },
@{ FullName = "Cason Sandoval" OUPath = "OU=Arbeider,DC=test,DC=local" },
@{ FullName = "Angeline Schultz" OUPath = "OU=Arbeider,DC=test,DC=local" },
@{ FullName = "Brynlee Nash" OUPath = "OU=Arbeider,DC=test,DC=local" },
@{ FullName = "Maddison Dawson" OUPath = "OU=Arbeider,DC=test,DC=local" },
@{ FullName = "Anastasia Hendrix" OUPath = "OU=Arbeider,DC=test,DC=local" },
@{ FullName = "Erick Villarreal" OUPath = "OU=Arbeider,DC=test,DC=local" },
@{ FullName = "Ahmed Shelton" OUPath = "OU=Arbeider,DC=test,DC=local" },
@{ FullName = "Samara Kaufman" OUPath = "OU=Arbeider,DC=test,DC=local" },
@{ FullName = "Daphne Harvey" OUPath = "OU=Arbeider,DC=test,DC=local" },
@{ FullName = "Aleena Underwood" OUPath = "OU=Arbeider,DC=test,DC=local" },
@{ FullName = "Charlize Elliott" OUPath = "OU=Arbeider,DC=test,DC=local" },
@{ FullName = "Santos Rivers" OUPath = "OU=Arbeider,DC=test,DC=local" },
@{ FullName = "Tanya Sheppard" OUPath = "OU=Arbeider,DC=test,DC=local" },
@{ FullName = "Abril Holder" OUPath = "OU=Arbeider,DC=test,DC=local" },
@{ FullName = "Ashly Castaneda" OUPath = "OU=Arbeider,DC=test,DC=local" },
@{ FullName = "Justice Bauer" OUPath = "OU=Arbeider,DC=test,DC=local" },
@{ FullName = "Jeffrey Grant" OUPath = "OU=Arbeider,DC=test,DC=local" },
@{ FullName = "Marie Dunlap" OUPath = "OU=Arbeider,DC=test,DC=local" },
@{ FullName = "Noah Davis" OUPath = "OU=Arbeider,DC=test,DC=local" },
@{ FullName = "Avery Holloway" OUPath = "OU=Arbeider,DC=test,DC=local" },
@{ FullName = "Noel Moran" OUPath = "OU=Arbeider,DC=test,DC=local" },
@{ FullName = "Austin Michael" OUPath = "OU=Arbeider,DC=test,DC=local" },
@{ FullName = "Bella Bryan" OUPath = "OU=Arbeider,DC=test,DC=local" },
@{ FullName = "Ciara Fuentes" OUPath = "OU=Arbeider,DC=test,DC=local" },
@{ FullName = "Alessandra Castro" OUPath = "OU=Arbeider,DC=test,DC=local" },
@{ FullName = "Leroy Hobbs" OUPath = "OU=Arbeider,DC=test,DC=local" },
@{ FullName = "Layton Spence" OUPath = "OU=Arbeider,DC=test,DC=local" },
@{ FullName = "Ashlynn Hayes" OUPath = "OU=Arbeider,DC=test,DC=local" },
@{ FullName = "Freddy Middleton" OUPath = "OU=Arbeider,DC=test,DC=local" },
@{ FullName = "Virginia Wallace" OUPath = "OU=Arbeider,DC=test,DC=local" },
@{ FullName = "Lillie Parsons" OUPath = "OU=Arbeider,DC=test,DC=local" },
@{ FullName = "Walter Lawrence" OUPath = "OU=Arbeider,DC=test,DC=local" },
@{ FullName = "Solomon Camacho" OUPath = "OU=Arbeider,DC=test,DC=local" },
@{ FullName = "Alexus Huynh" OUPath = "OU=Arbeider,DC=test,DC=local" },
@{ FullName = "Wyatt Haas" OUPath = "OU=Arbeider,DC=test,DC=local" },
@{ FullName = "Jaydon Sawyer" OUPath = "OU=Arbeider,DC=test,DC=local" },
@{ FullName = "Clare Mcdonald" OUPath = "OU=Arbeider,DC=test,DC=local" },
@{ FullName = "Bennett Mullins" OUPath = "OU=Arbeider,DC=test,DC=local" },
@{ FullName = "Brendon Brewer" OUPath = "OU=Arbeider,DC=test,DC=local" },
@{ FullName = "Lacey Pitts" OUPath = "OU=Arbeider,DC=test,DC=local" },
@{ FullName = "Edward Frost" OUPath = "OU=Arbeider,DC=test,DC=local" },
@{ FullName = "Waylon Barnett" OUPath = "OU=Arbeider,DC=test,DC=local" },
@{ FullName = "Sandra Frederick" OUPath = "OU=Arbeider,DC=test,DC=local" },
@{ FullName = "Abbigail Greene" OUPath = "OU=Arbeider,DC=test,DC=local" },
@{ FullName = "Anika Blake" OUPath = "OU=Arbeider,DC=test,DC=local" },
@{ FullName = "Jaiden Rodriguez" OUPath = "OU=Arbeider,DC=test,DC=local" },
@{ FullName = "Laurel Khan" OUPath = "OU=Arbeider,DC=test,DC=local" },
@{ FullName = "Emely Flynn" OUPath = "OU=Arbeider,DC=test,DC=local" },
@{ FullName = "Kaleb Macias" OUPath = "OU=Arbeider,DC=test,DC=local" },
@{ FullName = "Orion Griffith" OUPath = "OU=Arbeider,DC=test,DC=local" },
@{ FullName = "Yusuf Booker" OUPath = "OU=Arbeider,DC=test,DC=local" },
@{ FullName = "Josiah Leblanc" OUPath = "OU=Arbeider,DC=test,DC=local" },
@{ FullName = "Damian Dyer" OUPath = "OU=Arbeider,DC=test,DC=local" },
@{ FullName = "Clay Hurley" OUPath = "OU=Arbeider,DC=test,DC=local" },
@{ FullName = "Jazlene Winters" OUPath = "OU=Arbeider,DC=test,DC=local" },
@{ FullName = "Jaylee Leon" OUPath = "OU=Arbeider,DC=test,DC=local" },
@{ FullName = "Phoenix Lin" OUPath = "OU=Arbeider,DC=test,DC=local" },
@{ FullName = "Bianca Conner" OUPath = "OU=Arbeider,DC=test,DC=local" },
@{ FullName = "Aleah Mcbride" OUPath = "OU=Arbeider,DC=test,DC=local" },
@{ FullName = "Anabella Dominguez" OUPath = "OU=Arbeider,DC=test,DC=local" },
@{ FullName = "Rolando Flowers" OUPath = "OU=Arbeider,DC=test,DC=local" },
@{ FullName = "Jensen Mullins" OUPath = "OU=Arbeider,DC=test,DC=local" },
@{ FullName = "Trinity Franco" OUPath = "OU=Arbeider,DC=test,DC=local" },
@{ FullName = "Paulina Grimes" OUPath = "OU=Arbeider,DC=test,DC=local" },
@{ FullName = "Heidi Villa" OUPath = "OU=Arbeider,DC=test,DC=local" },
@{ FullName = "Braylee Ho" OUPath = "OU=Arbeider,DC=test,DC=local" },
@{ FullName = "Braxton Vaughan" OUPath = "OU=Arbeider,DC=test,DC=local" },
@{ FullName = "Iliana Rangel" OUPath = "OU=Arbeider,DC=test,DC=local" },
@{ FullName = "Leyla Santana" OUPath = "OU=Arbeider,DC=test,DC=local" },
@{ FullName = "Skye Acevedo" OUPath = "OU=Arbeider,DC=test,DC=local" },
@{ FullName = "Zion Lester" OUPath = "OU=Arbeider,DC=test,DC=local" }
)

# Loop through each user in the array
foreach ($user in $users) {
    # Extract user properties (FullName and Path)
    $fullName = $user.FullName
    $path = $user.Path
  
    # Create the user using New-ADUser cmdlet
    try {
      New-ADUser -Name $fullName -Path $path -SamAccountName $fullName -Enabled $true -ChangePasswordAtLogon $true
      Write-Host "Successfully created user: $fullName"
    } catch {
      Write-Error "Error creating user: $fullName - $($_.Exception.Message)"
    }
  }

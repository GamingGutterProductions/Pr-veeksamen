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
    $ou = "OU=Arbeidere,DC=bjerkerud,DC=local"  # Update 'yourdomain.com' with your actual domain

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
CreateADUser "Ciara" "Fuentes" "9363723485" "vijoy_exabo98@aol.com"
CreateADUser "Alessandra" "Castro" "6619980455" "ciyem-ihoxe89@aol.com"
CreateADUser "Leroy" "Hobbs" "5705323333" "feza_yimewu92@mail.com"
CreateADUser "Layton" "Spence" "3289826419" "nehe-hijuje84@outlook.com"
CreateADUser "Ashlynn" "Hayes" "9748504822" "ducor-uzuza68@mail.com"
CreateADUser "Freddy" "Middleton" "6256017671" "pahumif_abu42@outlook.com"
CreateADUser "Virginia" "Wallace" "2002632463" "vagedog_aca55@hotmail.com"
CreateADUser "Lillie" "Parsons" "9033629445" "wiso-megeni72@mail.com"
CreateADUser "Walter" "Lawrence" "3186200667" "sohod_aroyo64@hotmail.com"
CreateADUser "Solomon" "Camacho" "6178945064" "pozer_udabu16@yahoo.com"
CreateADUser "Alexus" "Huynh" "7562102773" "bov_eyolira79@mail.com"
CreateADUser "Wyatt" "Haas" "9447587534" "buzuva_kuno15@hotmail.com"
CreateADUser "Jaydon" "Sawyer" "4633092747" "hol_efumeza53@gmail.com"
CreateADUser "Clare" "Mcdonald" "3905836749" "nozepab_ali71@outlook.com"
CreateADUser "Bennett" "Mullins" "9203160622" "sotiwak-ama20@mail.com"
CreateADUser "Brendon" "Brewer" "3446064373" "pikoy_ajile81@mail.com"
CreateADUser "Lacey" "Pitts" "4893673142" "tirojej_ixe28@mail.com"
CreateADUser "Edward" "Frost" "8929114450" "situpi_huwe58@hotmail.com"
CreateADUser "Waylon" "Barnett" "7276618241" "limu-homije22@yahoo.com"
CreateADUser "Sandra" "Frederick" "8738146353" "napi_kavevo63@gmail.com"
CreateADUser "Abbigail" "Greene" "2086534927" "zuxen-oxena4@outlook.com"
CreateADUser "Anika" "Blake" "6193111198" "bozawi_biye79@hotmail.com"
CreateADUser "Jaiden" "Rodriguez" "6398297908" "biru-lirola36@gmail.com"
CreateADUser "Laurel" "Khan" "3738670697" "gapuril_ita91@aol.com"
CreateADUser "Emely" "Flynn" "7749798871" "litahal-oti58@yahoo.com"
CreateADUser "Kaleb" "Macias" "7732224205" "giwukil-ama16@gmail.com"
CreateADUser "Orion" "Griffith" "6874156411" "picanah-iwi97@gmail.com"
CreateADUser "Alexander" "Pittman" "9435897134" "tajicor_ufi56@gmail.com"
CreateADUser "Jensen" "Kent" "5063679245" "tar-asimibo54@aol.com"
CreateADUser "Frederick" "Graham" "6897834870" "juluve_lexe15@aol.com"
CreateADUser "Uriel" "Reese" "4933536422" "mawosu_tiso75@outlook.com"
CreateADUser "Makaila" "Wheeler" "3698128354" "cege-wipufe99@hotmail.com"
CreateADUser "Johnny" "Cobb" "8428822586" "fuhej_irexu43@outlook.com"
CreateADUser "Amanda" "Stout" "6252426731" "jujocu_zala70@outlook.com"
CreateADUser "Ernest" "Long" "4322624615" "bave-rureco8@yahoo.com"
CreateADUser "Payton" "Houston" "2453955428" "xapa_lawode76@hotmail.com"
CreateADUser "Bentley" "Huff" "5458681968" "nuda_xavucu46@hotmail.com"
CreateADUser "Evangeline" "Woodard" "3813444702" "caw_oxojupa23@outlook.com"
CreateADUser "Bryant" "King" "4617888952" "xacumi_loma41@hotmail.com"
CreateADUser "Edwin" "Stephens" "5053012424" "xoguziz_alu32@gmail.com"
CreateADUser "Christine" "Simon" "7603614719" "luzewa-sibo1@gmail.com"
CreateADUser "Braedon" "Torres" "7012687820" "cir-ureyuca31@yahoo.com"
CreateADUser "Micheal" "Dickerson" "8296956798" "yuca-finuke98@aol.com"
CreateADUser "Derek" "Glass" "3614886463" "kun_exajulo86@aol.com"
CreateADUser "Caitlyn" "Henry" "9427592889" "gir-esifara3@hotmail.com"
CreateADUser "Shane" "Stokes" "4684903963" "gejufaf_iko21@gmail.com"
CreateADUser "Stephen" "Patterson" "7312661513" "miver_oyaca29@outlook.com"
CreateADUser "Mauricio" "Johns" "6599355768" "tem_ihutuwa55@hotmail.com"
CreateADUser "Jan" "Delacruz" "9334704928" "gecawu-nina94@hotmail.com"
CreateADUser "Casey" "Whitney" "6548677898" "yup-ewayesu2@yahoo.com"
CreateADUser "Kelsie" "Barron" "2029576505" "xivebe-guxa95@yahoo.com"
CreateADUser "Roy" "Douglas" "3616416311" "liron_edigo92@aol.com"
CreateADUser "Shiloh" "Watson" "5644515243" "ciw_agiciru29@hotmail.com"
CreateADUser "Ainsley" "Gray" "7777129288" "vigiwi_cime4@outlook.com"
CreateADUser "Madison" "Dean" "7284826637" "xicuhus_imu58@outlook.com"
CreateADUser "Mariyah" "Tapia" "3425269248" "yenuwak-umi73@mail.com"
CreateADUser "Charlie" "Dixon" "5197382867" "simaje_gaha44@aol.com"
CreateADUser "Taylor" "Alexander" "4845374246" "mazec_idufo86@gmail.com"
CreateADUser "Bria" "Wilkinson" "3302429451" "juzav_adeji30@gmail.com"
CreateADUser "Kierra" "Werner" "5249410611" "yudami-tutu10@hotmail.com"
CreateADUser "Levi" "Chapman" "3439478262" "fid_upovape97@yahoo.com"
CreateADUser "Felix" "Jensen" "8606037343" "haxan-aneza7@aol.com"
CreateADUser "Rey" "Hendricks" "2599915787" "tiyo-duhivu17@hotmail.com"
CreateADUser "Grady" "Carlson" "7833686858" "hit-uyutifo58@aol.com"
CreateADUser "Braelyn" "Lozano" "6564080958" "tivafu_buze8@outlook.com"
CreateADUser "Paula" "Reyes" "5259100924" "tegopa-voce51@yahoo.com"
CreateADUser "Mariela" "Bird" "7654576041" "ginuye_dabu76@hotmail.com"
CreateADUser "Kason" "Villanueva" "7588011635" "tuharuw_oje68@gmail.com"
CreateADUser "Gunner" "Petersen" "3732163944" "bani_rusewa55@aol.com"
CreateADUser "Zaire" "Jennings" "7123102434" "mebofi_gopi53@gmail.com"
CreateADUser "Malaki" "Barrett" "2863710771" "zaceho_yisi69@hotmail.com"
CreateADUser "Jayvon" "Sanders" "8625739167" "bebacal_ote25@mail.com"
CreateADUser "Keyon" "Garrison" "2487099524" "kebov-ewati44@yahoo.com"
CreateADUser "Carly" "Collins" "2779920147" "lilasi_fiye41@hotmail.com"
CreateADUser "Cecilia" "Castillo" "3168501322" "mawe_zoxahe29@hotmail.com"
CreateADUser "Aubrie" "Hammond" "2338385486" "moha_gapege50@yahoo.com"
CreateADUser "Reese" "Wong" "6129322129" "layig-ojusi37@gmail.com"
CreateADUser "Sophie" "Carter" "8242109078" "laz_ajetanu96@yahoo.com"
CreateADUser "Aidan" "Horn" "2864517812" "gab-omesoce62@gmail.com"
CreateADUser "Violet" "Griffin" "4597397413" "zihohit_ive24@yahoo.com"
CreateADUser "Jayden" "Mays" "4212813587" "feb-osiseti14@hotmail.com"
CreateADUser "Charlie" "Robles" "8298790696" "feh-efetopa2@aol.com"
CreateADUser "Kelly" "Molina" "6847710272" "xajeve-xoge82@hotmail.com"
CreateADUser "Ryker" "Salinas" "9678967506" "deh_ulidone99@gmail.com"
CreateADUser "Konner" "Flores" "6544044160" "kubu_vedomo42@hotmail.com"
CreateADUser "Kiara" "Jhansen" "2168906489" "beyapa-fore60@mail.com"
CreateADUser "Myles" "olavson" "7336810059" "yidoxow-imi8@aol.com"
CreateADUser "Kennedy" "gunnar" "7117348973" "san-axahoxa26@hotmail.com"
CreateADUser "Helena" "Samsung" "6729960320" "heruveb-ona56@gmail.com"
CreateADUser "Gillian" "gjerdingen" "2039068099" "mola-zigafa52@mail.com"
CreateADUser "Selena" "hansen" "3838651918" "xeyafoc_uyi24@outlook.com"
CreateADUser "Kamryn" "hansen" "4976352022" "zereh-idoba66@mail.com"
CreateADUser "Mathias" "hansen" "2397446918" "cebo_texore49@gmail.com"
CreateADUser "Samir" "hansen" "8529001919" "vatali-xumi73@gmail.com"
CreateADUser "Kristopher" "hansen" "7083994421" "sodehez-axe97@mail.com"

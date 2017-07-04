## Script to automate bulk user insert or modify actions in AD
## Script need to be run from a DC server otherwise add -server option 
## Add all the users in the csv file 
## Define the TargetOU field in the CSV file to define where the user will be created
## the Country field should be in two letters format AL, UK, IT, US etc.
## Run the script by uncommenting one of the sections in the script
## Modify the file as needed :) 


$Users = Import-Csv -Path "C:\data\csv-user-creation.csv" 
foreach ($User in $Users)  {            
    $Displayname = $User.givenName + " " + $User.LastName
    $UserFirstname = $User.givenName            
    $UserLastname = $User.LastName
    $mail= $User.Mail       
    $street= $user.StreetAddress
    $po=$user.PostalCode
    $city = $user.City
    $county = $user.Country  
    $company = $user.Company
    $department = $user.department 
    $cel = $user.telephoneNumber
    $OU = $User.TargetOU         
    $SAM = $User.samAccountName           
    $UPN = $User.givenName + "." + $User.Lastname + "@domain.edu.al"          
    $Password = $User.Password  
    $homedir = $user.homeDirectory
    $homedrive = $user.homeDrive
    $mail= $User.Mail
    $name=$User.givenName
    
    ##Create users command section, uncomment below line if needed to be run
    #New-ADUser -EmailAddress "$mail" -StreetAddress "$street" -PostalCode "$po" -City "$city" -Country "$county" -Company "$company" -Department "$department"  -MobilePhone "$cel" -HomeDirector "$homedir" -HomeDrive "$homedrive" -Name "$Displayname" -DisplayName "$Displayname" -SamAccountName $SAM -UserPrincipalName $UPN -GivenName "$UserFirstname" -Surname "$UserLastname"  -AccountPassword (ConvertTo-SecureString $Password -AsPlainText -Force) -Enabled $true -Path "$OU" -ChangePasswordAtLogon $true –PasswordNeverExpires $false

    ## Modify users Command Sectionm, uncomment below line if needed to be run
    #Get-ADUser -Identity $name  | Set-ADUser -GivenName "$UserFirstname" -Surname "$UserLastname" -DisplayName "$Displayname" 
}





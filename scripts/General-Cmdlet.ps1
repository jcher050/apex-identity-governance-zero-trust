#To diagnose a password hash synchronization issue for a specific user using PowerShell on the Microsoft Entra Connect server
Import-Module ADSyncDiagnostics
Invoke-ADSyncDiagnostics -PasswordSync -ADConnectorName "YOUR_AD_CONNECTOR_NAME" -DistinguishedName "CN=User,OU=Users,DC=domain,DC=com"

#to verify whether password hash synchronization is enabled for the tenant and to retrieve the current configuration settings. It checks global settings, not the synchronization status of a specific user object.
Import-Module "C:\Program Files\Microsoft Azure Active Directory Connect\Tools\ADSyncDiagnostics.psm1"
Invoke-ADSyncDiagnostics -PasswordSync -ADConnectorName "yourdomain.com" -DistinguishedName "CN=John Doe,OU=Users,DC=yourdomain,DC=com"

#cmdlet used to turn tenant-wide password synchronization on or off, or to change the sync interval settings. 
# 1. Load the required modules
Import-Module ActiveDirectory
Import-Module "C:\Program Files\Microsoft Azure Active Directory Connect\Tools\ADSyncDiagnostics.psm1"
# 2. Get the exact AD Connector Name
$ADConnector = (Get-ADSyncConnector | Where-Object {$_.Type -eq "Extensible2" -and $_.Name -like "*.*"}).Name
# 3. Get the user's exact Distinguished Name (Replace username)
$UserDN = (Get-ADUser -Identity "TargetSamAccountName").DistinguishedName
# 4. Run the targeted password sync diagnostics
Invoke-ADSyncDiagnostics -PasswordSync -ADConnectorName $ADConnector -DistinguishedName $UserDN

#used to test connectivity between the server and the Azure AD Connect Health service. It verifies network connectivity for monitoring purposes, not password hash synchronization diagnosis for a specific user.
Test-AzureADConnectHealthConnectivity

#Connect to Microsoft Graph to grant roles
Connect-MgGraph -Scopes "RoleManagement.ReadWrite.Directory"

New-MgRoleManagementDirectoryRoleAssignment 
  -DirectoryScopeId "/" 
  -RoleDefinitionId <String> 
  -PrincipalId <String>

# Connect-EntraGraph.ps1
# Purpose: Establish Microsoft Graph connectivity for the Apex IAM automation project.
# Installing and connecting to Microsoft Graph PowerShell module

Set-ExecutionPolicy -ExecutionPolicy Bypass
EXPLANATION: Temporarily sets the script execution policy to Bypass, allowing all scripts to run without prompts or warnings.

Install-Module Microsoft.Graph -Scope CurrentUser -Repository PSGallery -Force
EXPLANATION: Installs the base Microsoft Graph PowerShell module for the current user from the PowerShell Gallery, forcing installation even if already present.

Install-Module Microsoft.Graph.Users -Scope CurrentUser -Force
EXPLANATION: Installs the Microsoft.Graph.Users module, which includes cmdlets for managing user accounts, scoped to the current user.

Connect-MgGraph -Scopes "Group.ReadWrite.All", "User.ReadWrite.All"
EXPLANATION: Connects to Microsoft Graph with delegated permissions to read/write both users and groups.

 Connect-MgGraph -Scopes "Organization.Read.All", "Group.ReadWrite.All", "User.ReadWrite.All" -TenantID "XXXXXXXX-XXXX-XXXX-XXXX-XXXXXXXXXXXX" 
 EXPLANATION: Connects to Microsoft Graph with permissions to read/write across the entire organization.       
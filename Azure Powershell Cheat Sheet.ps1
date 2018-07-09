<# 
=============================================================================
Install PowerShell Azure
=============================================================================
#>

# Installing items from the PowerShell Gallery requires the PowerShellGet 
# module. Make sure you have the appropriate version of PowerShellGet and other 
# system requirements. Run the following command to see if you have 
# PowerShellGet installed on your system.
Get-Module PowerShellGet -list | Select-Object Name,Version,Path

# Install the Azure Resource Manager modules from the PowerShell Gallery
Install-Module AzureRM


<# 
=============================================================================
Connecting PowerShell Azure
=============================================================================
#>

# Log into Azure Resource Manager.
Login-AzureRmAccount

# Log into Azure Resource Manager and straight into the appropriate subscription.
Login-AzureRmAccount -TenantId $MyTenantID

# List all subscriptions you have access to.
Get-AzureRmSubscription

# Set the subscription to use.
Select-AzureRmSubscription -SubscriptionName "$SubscriptionName"

# View the subscription PowerShell is currently running under.
Get-AzureRmContext

<# 
=============================================================================
Listing Virtual Machines Information
=============================================================================
#>

# List all VM's in the subscription
Get-AzureRmVM

# list all Resourse Groups
Get-AzureRmResourceGroup

# List all VM's in the subscription
Get-AzureRmVM -ResourceGroupName $myResourceGroup

# List the OS version of all Virtual Machines
# By sancloud (https://gallery.technet.microsoft.com/How-to-retrieve-Azure-8acc709f)
$VMs = Get-AzureRmVM 
$vmlist = @() 
$VMs | ForEach-Object {  
    $VMObj = New-Object -TypeName PSObject 
    $VMObj | Add-Member -MemberType Noteproperty -Name "VM Name" -Value $_.Name 
    $VMObj | Add-Member -MemberType Noteproperty -Name "OS type" -Value $_.StorageProfile.ImageReference.Sku 
    $vmlist += $VMObj 
} 
$vmlist 

<# 
=============================================================================
Listing Available VM types in Azure
=============================================================================
#>

#List all VM types with details available in a region.
Login-AzureRmAccount
Select-AzureRmSubscription -SubscriptionName "$SubscriptionName"
get-AzureRMVMSize -Location "UK South"





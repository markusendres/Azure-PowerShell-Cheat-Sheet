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
Working with Virtual Machines
=============================================================================
#>

# List all VM's in the subscription
Get-AzureRmVM

# List all VM's in the subscription
Get-AzureRmVM -ResourceGroupName $myResourceGroup

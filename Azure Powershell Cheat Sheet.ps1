<# 
=============================================================================
Connecting PowerShell Azure
=============================================================================
#>

# Log into Azure Resource Manager.
Login-AzureRmAccount

# Log into Azure Resource Manager and straight into the appropriate subscription.
Login-AzureRmAccount -TenantId aaaa1111-aa11-aa11-aa11-aaaaaa111111

# List all subscriptions you have access to.
Get-AzureRmSubscription

# Set the subscription to use.
Select-AzureRmSubscription -SubscriptionName "subscription name"

# View the subscription PowerShell is currently running under.
Get-AzureRmContext

<# 
=============================================================================
Working with Virtual Machines
=============================================================================
#>


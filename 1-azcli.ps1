# Where am i ?
az account list
az account show
# What do i own ?
az resource list --subscription Big-MAS --output 

# Switching subscriptions
az account set --subscription small-VSE
az resource list --output table

# Getting a full picture of all resources for this tenant
az resource list --subscription Big-MAS --output table
az resource list --subscription Small-VSE --output table

# Store output in Variable
$azcliresources = az resource list --subscription Big-MAS
$azcliresources += az resource list --subscription Small-VSE

# Store output in Variable (or as JSON)
$azcliresources = az resource list --subscription Big-MAS 
$azcliresources += az resource list --subscription Small-VSE


# Output processing :-(
(az resource list).count
(az resource list|convertfrom-JSON).count
az resource list|convertfrom-JSON|select -expandproperty syncroot |select -first 1 #name,type,resourceGroup,location |ft -autosize

# Commands against ONE subscription
az account list -o table
$azcliresourcesJSON = az resource list --subscription Big-MAS|convertfrom-JSON|select -expandproperty syncroot 
$azcliresourcesJSON += az resource list --subscription Small-VSE|convertfrom-JSON|select -expandproperty syncroot 




# Query Language: "JMESPath" http://jmespath.org/
az group list --query "[?location=='westeurope']" --output jsonc

az resource list --name 'UbuntuJumpBox' -o table
az resource list --resource-type 'Microsoft.Compute/virtualMachines' -q tags

# Query Example
az vm show -g p-rg-vms -n 'UbuntuJumpBox'
az vm show -g p-rg-vms -n 'UbuntuJumpBox' --query 'storageProfile.osDisk'
az vm show -g p-rg-vms -n 'UbuntuJumpBox' --query 'osProfile'

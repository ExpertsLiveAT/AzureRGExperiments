# What do i own ?
az group list --output table

# Query Language: "JMESPath" http://jmespath.org/
az group list --query "[?location=='westeurope']" --output jsonc

az resource list --name 'UbuntuJumpBox' -o table
az resource list --resource-type 'Microsoft.Compute/virtualMachines' -q tags

# Query Example
az vm show -g p-rg-vms -n 'UbuntuJumpBox'
az vm show -g p-rg-vms -n 'UbuntuJumpBox' --query 'storageProfile.osDisk'
az vm show -g p-rg-vms -n 'UbuntuJumpBox' --query 'osProfile'

# Output processing :-(
(az resource list).count 
(az resource list|convertfrom-JSON).count
az resource list|convertfrom-JSON|select -expandproperty syncroot #|select name,type,resourceGroup,location |ft -autosize

# Commands against ONE subscription
az account list -o table

$azcliresult = az resource list|convertfrom-JSON|select -expandproperty syncroot 
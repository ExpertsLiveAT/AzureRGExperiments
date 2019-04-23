# Where am i ?
az account list
az account show
# What do i own ?
az resource list

# Switching subscriptions
az resource list --subscription small-VSE --output table
az resource list --subscription Big-MAS --output 

# output richness
az resource list --subscription small-VSE --output jsonc


# One VM
az resource list --name UbuntuJumpBox --output jsonc
# Richer output
az vm show --resource-group p-rg-vms --name UbuntuJumpBox --output jsonc

##########

# Query Language: "JMESPath" http://jmespath.org/
az group list --query "[?location=='westeurope']" --output jsonc

az resource list --name 'UbuntuJumpBox' -o table
az resource list --resource-type 'Microsoft.Compute/virtualMachines' -q tags

# Query Example
az vm show -g p-rg-vms -n 'UbuntuJumpBox'
az vm show -g p-rg-vms -n 'UbuntuJumpBox' --query 'storageProfile.osDisk'
az vm show -g p-rg-vms -n 'UbuntuJumpBox' --query 'osProfile'

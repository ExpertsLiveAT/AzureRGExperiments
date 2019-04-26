# Where am i ?
az account list
az account show
# What do i own ?
az resource list

# Switching subscriptions
az resource list --subscription Small-VSE --output table
az resource list --subscription Big-MAS --output tsv

# output richness
az resource list --subscription small-VSE --output jsonc

# One VM
az resource list --name UbuntuJumpBox --output jsonc
# Richer output
az vm show --resource-group p-rg-vms --name UbuntuJumpBox --output jsonc

##########

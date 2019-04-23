# Lets Use PwoerShell for querying
import-module az.resourcegraph
get-command -Module az.resourcegraph

# What do i own ?
Search-AzGraph -Query 'project id'|ft -AutoSize

# Amount of Resources
Search-AzGraph -q "summarize count () by subscriptionId"
Search-AzGraph -q 'summarize count () by resourceGroup |order by count_'

# Easy searching i.e. all with Tag Owner = Roman
Search-AzGraph -q "where tags.Owner=~'Roman'"|select name,tags

# Same query, do the output limitation in the query
Search-AzGraph -q "where tags.Owner=~'Roman'|project name,tags"

# Example:How many resources with public IP addresses are in my tenant ?
Search-AzGraph -q "where type contains 'publicIPAddresses' and `
                    isnotempty(properties.ipAddress)| `
                    summarize count () by subscriptionId"

# What data is provided by ResourceGraph ?
$query = "where name=~'UbuntuJumpBox'"
Search-AzGraph -Query $query -outvariable RgVM |out-null
$RgVM.properties.storageProfile.osDisk.DisksizeGB

#Different Type ==> Same Data
$query = "where name=~'p-thegalaxy-vnet110'"
Search-AzGraph -Query $query -OutVariable RGVnet|out-null
$RGvnet.Properties.addressSpace.AddressPrefixes

# Vague queries allowed
$query = "where name=~'p-thegalaxy-vnet110'"
Search-AzGraph -Query $query -OutVariable RGVnet|out-null

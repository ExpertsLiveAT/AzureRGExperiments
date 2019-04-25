# Lets Use PwoerShell for querying
import-module az.resourcegraph
get-command -Module az.resourcegraph

# What do i own ?
Search-AzGraph -Query 'project id'|ft -AutoSize

# Amount of Resources
Search-AzGraph -q "summarize count () by subscriptionId"
Search-AzGraph -q 'summarize count () by resourceGroup |order by count_'

# Easy searching i.e. all with Tag Owner = Roman
Search-AzGraph -q "where tags.Owner=~'Roman'"|get-member
Search-AzGraph -q "where tags.Owner=~'Roman'"|select name,tags

# Same query, do the output limitation in the query
Search-AzGraph -q "where tags.Owner=~'Roman'|project name,tags"

# Example:How many resources with public IP addresses are in my tenant ?
Search-AzGraph -q "where type contains 'publicIPAddresses' and `
                    isnotempty(properties.ipAddress)| `
                    summarize count () by subscriptionId"

# What data is provided by ResourceGraph ?
Search-AzGraph -Query "where name=~'UbuntuJumpBox'" -outvariable RgVM |out-null
$rgvm.properties.StorageProfile.ImageReference
$RgVM.properties.storageProfile.osDisk.DisksizeGB

#Different Type ==> Same Data
Search-AzGraph -Query "where name=~'p-thegalaxy-vnet110'" -OutVariable RGVnet|out-null
$RGvnet.Properties.addressSpace.AddressPrefixes

# Queries from the GUI
Search-AzGraph -Query "summarize count () by resourceGroup |where resourceGroup <> 'networkwatcherrg' |order by count_"


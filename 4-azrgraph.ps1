# Lets Use PwoerShell for querying
import-module az.resourcegraph
get-command -Module az.resourcegraph

# Amount of Resources
$query = "summarize count () by subscriptionId"
Search-AzGraph -Query $query

# All with Tag Owner = Roman
$query = "where tags.Owner=~'Roman'"
Search-AzGraph -Query $query
Search-AzGraph -Query $query|select name,tags

# Same query, do the limitation in the query
$query = "where tags.Owner=~'Roman'|project name,tags"
Search-AzGraph -Query $query

# Resources with Public IP Addresses
$Query = "where type contains 'publicIPAddresses' and isnotempty(properties.ipAddress)| summarize count () by subscriptionId"
Search-AzGraph -Query $query

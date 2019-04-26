#region authenticate

# Identify a change
$ChangeUri = "https://management.azure.com/providers/Microsoft.ResourceGraph/resourceChanges?api-version=2018-09-01-preview"

$Intervalprops = [ordered]@{
    start = "2019-04-22T00:00:00.000Z"
    end = "2019-04-22T18:00:00.000Z"
}

<#
$Intervalprops = [ordered]@{
    start = (Get-Date).AddMinutes('-15')
    end = (Get-Date)
}
#>

$body = @{
    resourceId = "/subscriptions/98c62a48-2b63-4796-9015-176b9fb173f2/resourceGroups/p-rg-storage/providers/Microsoft.Storage/storageAccounts/computediagnostics"
    interval = $Intervalprops
}
$header = @{
    'Authorization' = "$($Token.token_type) $($Token.access_token)"
    "Content-Type"  = "application/json"
}
$ChangeParam = @{
    method = 'POST'
    uri = $ChangeUri
    headers = $header
    body = $body
}
invoke-webrequest @ChangeParam #-OutVariable Rawrestresults


# Prepare output
$RESTResults = $RawRestResults.Content|ConvertFrom-Json|select -ExpandProperty value

# List all resources Subscription Small-VSE
$subscriptionSMALLid = 'fdfb69f2-ef24-4f8f-9e63-785c9f1ef5ea'
$listUri = "https://management.azure.com/subscriptions/$subscriptionSMALLid/resources?api-version=2018-05-01"
$body = @{
    ts = [System.DateTime]::UtcNow.ToString('o')
}
$header = @{
    'Authorization' = "$($Token.token_type) $($Token.access_token)"
    "Content-Type"  = "application/json"
}
$listparam = @{
    method = 'GET'
    uri = $listUri
    headers = $header
    body = $body
}
invoke-webrequest @listparam -OutVariable Rawrestresults

$RESTResults += $RawRestResults.Content|ConvertFrom-Json|select -ExpandProperty value


# One VM
$vmrgname = 'p-rg-vms'
$vmname = 'UbuntuJumpBox'
$vmGetUri = "https://management.azure.com/subscriptions/$($subscriptionId)/resourceGroups/$($vmrgname)/providers/Microsoft.Compute/virtualMachines/$($vmname)?api-version=2018-06-01"
$body = @{
    ts = [System.DateTime]::UtcNow.ToString('o')
}
$header = @{
    'Authorization' = "$($Token.token_type) $($Token.access_token)"
    'Content-Type'  = 'application/json'
}
$listparam = @{
    method = 'GET'
    uri = $vmGetUri
    headers = $header
    body = $body
}
invoke-webrequest @listparam -OutVariable RawRestVMResults

$RestVM = $RawRestVMResults.Content|ConvertFrom-Json



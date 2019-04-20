#authenticate
$loginurl = 'https://login.microsoftonline.com'

$tokenbody = @{
    grant_type = 'client_credentials'
    client_id = $appid
    client_secret = $appkeyplain
    resource = 'https://management.azure.com/'
}

$iwparam = @{
    uri = "$loginurl" + "/$tenantid/oauth2/token"
    method = 'POST'
    body = $tokenbody
}

invoke-webrequest @iwparam -Outvariable oAuth2
$token = $oauth2.content|convertfrom-JSON
$sectoken = ConvertTo-SecureString $token -AsPlainText -Force

# List all resources Subscription 1
$listUri = "https://management.azure.com/subscriptions/$subscriptionid/resources?api-version=2018-05-01"
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

# Prepare output
$RESTResults = $RawRestResults.Content|ConvertFrom-Json|select -ExpandProperty value

# List all resources Subscription 2
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



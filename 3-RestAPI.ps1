#authenticate
$loginurl = 'https://login.microsoftonline.com'

$tokenbody = @{
    grant_type = 'client_credentials'
    client_id = $appid
    client_secret = $appkey
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

# List all resources
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




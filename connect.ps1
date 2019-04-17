$subscriptionId = '98c62a48-2b63-4796-9015-176b9fb173f2'

$appid = '0da2af74-ec9d-441f-bfb7-e4078070858f'
$appkey = 'imZ/3KF+f6N7cc66fIJVYgqIhDDQOJq/N5KoNMqqeS4='
$apppw = ConvertTo-SecureString $appkey -AsPlainText -Force
$acred = New-Object PSCredential -argumentlist ($appid, $apppw)
$tenantid = '5de6aeba-b232-4a78-9dff-35e20bec0b14'
Connect-AzAccount -TenantId $tenantid -ServicePrincipal -Credential $acred

# AzCLI
az login



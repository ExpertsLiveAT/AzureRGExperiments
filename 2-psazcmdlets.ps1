# What do i own ?
import-module Az.Resources

(Get-AzResource).count
Get-AzContext

Set-AzContext -Subscription 'SMall-VSE'
(Get-AzResource).count
Get-AzResource|gm

Set-AzContext -Subscription 'Small-VSE'
$psresultsSmall = Get-AzResource 
Set-AzContext -Subscription 'Big-MAS'
$psresultsBig = Get-AzResource







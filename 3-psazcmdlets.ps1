# What do i own ?
import-module Az.Resources
Get-AzContext

# What do i own ?
(Get-AzResource).count
(Get-AzResource -ResourceGroupName p-rg-*).count
Get-AzResource|Select-Object -first 1   
Get-AzResource|Select-Object -first 1 |get-member

# Different Subscriptions ? ==> Switch
Set-AzContext -Subscription 'Small-VSE'
(Get-AzResource).count

# One VM
Set-AzContext -Subscription 'Big-MAS'
Get-azresource -ResourceGroupName p-rg-vms -Name UbuntuJumpBox|format-List * -Force
# Richer output
Get-AzVM -ResourceGroupName 'p-rg-vms' -Name 'UbuntuJumpBox' -OutVariable psvm
$psvm.StorageProfile.ImageReference
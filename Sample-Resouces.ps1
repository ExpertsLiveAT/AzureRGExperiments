
Set-AzContext -Subscription 'Small-VSE'
$amount = 11..254
$alllocs = 'centralus','eastus','eastus2','westus','westus2','northcentralus','southcentralus','westcentralus','northeurope','westeurope','canadacentral','canadaeast','uksouth','ukwest','francecentral'

foreach ($i in $amount) {
    $randomloc = Get-Random -InputObject $alllocs
    $RgName = "t-rg-perftest$i"
    if (!(Get-azresourcegroup -Name $rgName -ErrorAction Silentlycontinue )) {
        New-AzResourceGroup -Name $rgName -location $randomloc |select ResourceGroupName,Location|out-null
        
        $frontendSubnet = New-AzVirtualNetworkSubnetConfig -Name frontendSubnet -AddressPrefix "10.0.1.0/24"
        $vnetName = "t-vnet-$i"
        New-AzVirtualNetwork -Name $vnetName -ResourceGroupName $rgName -Location $randomloc -AddressPrefix "10.0.0.0/16" -Subnet $frontendSubnet |out-null
    }
}

# Cleanup
#Get-AzResourceGroup -Name 't-rg-num*' |ForEach-Object  {Remove-AzResourceGroup -Name $_.ResourceGroupName -Force}

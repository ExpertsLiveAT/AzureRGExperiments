Set-AzContext -Subscription 'Big-MAS'

Measure-Command -Expression {Get-AzResource}|select Milliseconds

Measure-Command -Expression `
    {Search-AzGraph -Query "where subscriptionId=~'98c62a48-2b63-4796-9015-176b9fb173f2' `
    |project name,resourceGroup,type,location,id"}|select Milliseconds



<#
Set-AzContext -Subscription 'Small-VSE'
$amount = 1..10
$alllocs = 'centralus','eastus','eastus2','westus','westus2','northcentralus','southcentralus','westcentralus','northeurope','westeurope','canadacentral','canadaeast','uksouth','ukwest','francecentral'
$RgName = "t-rg-perftest"
New-AzResourceGroup -Name $rgName -location 'westeurope' |select ResourceGroupName,Location

foreach ($i in $amount) {
    $randomloc = Get-Random -InputObject $alllocs
    if (!(Get-azresourcegroup -Name "t-rg-num$i")) {
        
        $frontendSubnet = New-AzVirtualNetworkSubnetConfig -Name frontendSubnet -AddressPrefix "10.0.1.0/24"
        $vnetName = "t-vnet-$i"
        New-AzVirtualNetwork -Name $vnetName -ResourceGroupName $rgName -Location $location -AddressPrefix "10.0.0.0/16" -Subnet $frontendSubnet
    }
}

# Cleanup
Get-AzResourceGroup -Name 't-rg-num*' |ForEach-Object  {Remove-AzResourceGroup -Name $_.ResourceGroupName -Force}

#>
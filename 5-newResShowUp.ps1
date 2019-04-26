# How fast does ARG detect changes ?
Set-AzContext -Subscription 'Small-VSE' |out-null
$day = (Get-Date).DayofWeek
$hour = (Get-Date).hour
$minute = (Get-Date).minute
$RgName = "t-rg-$day-$hour-$minute"
$location = 'westeurope'

#Create ResourceGroup
New-AzResourceGroup -Name $rgName -location $location |out-null

# Create Resource
$frontendSubnet = New-AzVirtualNetworkSubnetConfig -Name frontendSubnet -AddressPrefix "10.0.1.0/24"
$vnetName = "t-vnet-$day-$hour-$minute"
New-AzVirtualNetwork -Name $vnetName -ResourceGroupName $rgName -Location $location -AddressPrefix "10.0.0.0/16" -Subnet $frontendSubnet |out-null

# Measure in AzRGraph
$starttime = Get-Date
do {
    "Still not there ..."
}
 while ((Search-AzGraph -Query "where name=~'$vnetname'") -eq $null )
$endtime = Get-Date

$totalseconds = New-TimeSpan -Start $starttime -End (Get-Date)
"It took $totalseconds to show this resource in Resource Graph"

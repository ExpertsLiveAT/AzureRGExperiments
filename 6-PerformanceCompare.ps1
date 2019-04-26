# Resource Manager query
Set-AzContext -Subscription 'Big-MAS'
Measure-Command -Expression {Get-AzResource}|select Milliseconds

# AzResGraph Query
Measure-Command -Expression `
    {Search-AzGraph -Query "where subscriptionId=~'98c62a48-2b63-4796-9015-176b9fb173f2' `
    |project name,resourceGroup,type,location,id"}|select Milliseconds


# Other Subscription, widespread Resources over the globe
Set-AzContext -Subscription 'Small-VSE'
Measure-Command -Expression {Get-AzResource}|select Milliseconds
    
# AzResGraph Query
Measure-Command -Expression `
    {Search-AzGraph -Query "where subscriptionId=~'fdfb69f2-ef24-4f8f-9e63-785c9f1ef5ea' `
    |project name,resourceGroup,type,location,id"}|select Milliseconds
    




#Az CLi
$azcliresourcesJSON.count

# PowerShell Modules
$psresultsBig.count
$psresultsSmall.count

# REST API
$RESTResults.count

# Compare
$RESTResults[0]|gm -MemberType Property
$psresultsBig[0].GetType()
$azcliresourcesJSON[0]

Compare-Object -ReferenceObject $RESTResults[0] -DifferenceObject $psresultsBig[0] -ExcludeDifferent
Compare-Object -ReferenceObject $RESTResults[0] -DifferenceObject $AzcliresourcesJSON[0] -ExcludeDifferent

<# CIAOPS
Script provided as is. Use at own risk. No guarantees or warranty provided.

Description - Get data from Microsoft Cloud App Security

Source - 

Prerequisites = 1
1. Create an API Token in your tenant via - 

More scripts available by joining http://www.ciaopspatron.com

#>

## Variables
$systemmessagecolor = "cyan"
$processmessagecolor = "green"

Clear-Host

write-host -foregroundcolor $systemmessagecolor "Script started`n"

$mcasuri = "<your MCAS URI here>"                    ## This MUST be changed before the script will run correctly
$mcastoken = "your MCAS Token here"                  ## This MUST be changed before the script will run correctly

$endpoint = "alerts"

$response = Invoke-RestMethod `
    -uri "$mcasuri/api/v1/$endpoint/" `
    -headers @{authorization = "Token $mcastoken" } `
    -method POST `
    -body ($body | convertto-json -depth 2) `
    -verbose

$response.data

write-host -foregroundcolor $systemmessagecolor "`nScript Completed`n"
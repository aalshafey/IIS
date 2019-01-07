$name = "master"

Import-Module WebAdministration
sleep 2
Set-ItemProperty IIS:\AppPools\$name managedRuntimeVersion v4.0
$site = Get-WebSite | where { $_.Name -eq $name }
if($site -eq $null)
{
 Write-Host "Creating site: $name $destination" -force 

 # TODO:
 New-WebSite $name -Force
 New-WebApplication -Site $name -Name $name -PhysicalPath "C:\inetpub\wwwroot\master" -ApplicationPool $name
}


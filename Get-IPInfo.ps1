[cmdletbinding()]
param (
[parameter(ValueFromPipeline=$true,ValueFromPipelineByPropertyName=$true)]
[string[]]$ComputerName = $env:computername
)

begin {}
process {
foreach ($Computer in $ComputerName) {
if ($Computer.TOUpper() -like “*.AMR.*”) {
if(Test-Connection -ComputerName $Computer -Count 1 -ea 0) {
$Networks = Get-WmiObject Win32_NetworkAdapterConfiguration -ComputerName $Computer | ? {$_.IPEnabled}
foreach ($Network in $Networks) {
$IPAddresses = $Network.IpAddress
For ($i=0;$i -le $IPAddresses.Count -1;$i++) {
$IPAddress = $IPAddresses[$i]
$SubnetMask = $Network.IPSubnet[$i]
$DefaultGateway = $Network.DefaultIPGateway
$DNSServers = $Network.DNSServerSearchOrder
$DNSDomain = $Network.DNSDomain
$DNSDomainSuffixSearchOrder = $Network.DNSDomainSuffixSearchOrder
$DNSHostName = $Network.DNSHostName
$ISDNSDomainRegistrationEnabled = $false
If($Network.$DomainDNSRegistrationEnabled) {
$DomainDNSRegistrationEnabled = $true
}
$IsDHCPEnabled = $false
If($network.DHCPEnabled) {
$IsDHCPEnabled = $true
}
$WINSPrimaryServer = $Network.WINSPrimaryServer
$WINSSecondaryServer = $Network.WINSSecondaryserver
$MACAddress = $Network.MACAddress
$OutputObj = New-Object -Type PSObject
$OutputObj | Add-Member -MemberType NoteProperty -Name ComputerName -Value $Computer.ToUpper()
$OutputObj | Add-Member -MemberType NoteProperty -Name IPAddress -Value ($IPAddress -join “;”)
$OutputObj | Add-Member -MemberType NoteProperty -Name SubnetMask -Value ($SubnetMask -join “;”)
$OutputObj | Add-Member -MemberType NoteProperty -Name Gateway -Value ($DefaultGateway -join “;”)
$OutputObj | Add-Member -MemberType NoteProperty -Name IsDHCPEnabled -Value $IsDHCPEnabled
$OutputObj | Add-Member -MemberType NoteProperty -Name DNSServers -Value ($DNSServers -join “;”)
$OutputObj | Add-Member -MemberType NoteProperty -Name DNSDomain -Value $DNSDomain
$OutputObj | Add-Member -MemberType NoteProperty -Name DNSHostName -Value $DNSHostName
$OutputObj | Add-Member -MemberType NoteProperty -Name MACAddress -Value $MACAddress
$OutputObj
}
}
}
}
}
}
end {}
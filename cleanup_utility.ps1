$bjnProcess = Get-Process -processname BlueJeans
If ($bjnProcess) {
    Stop-Process -processname BlueJeans
} else {
    Write-Output "No BlueJeans process is running."
}

$bjnPerMachine = Get-WmiObject -Class Win32_Product -Filter "Name = 'Blue Jeans (All User)'"
$bjnPerUser = Get-WmiObject -Class Win32_Product -Filter "Name = 'Blue Jeans'"

$bjnPerMachine.Uninstall()
$bjnPerUser.Uninstall()
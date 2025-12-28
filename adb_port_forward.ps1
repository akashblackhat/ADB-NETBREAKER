# ============================================================
#  ADB PORT FORWARDING TOOL
# ------------------------------------------------------------
#  Description : Expose Android Emulator ADB over Network
#  Use Case    : Android Pentesting / Lab Testing
#
#  Coded by    : AKASH BLACK HAT
#  Platform   : Windows (PowerShell)
#
#  Warning    : Use only on authorized / lab systems
# ============================================================

Write-Host ""
Write-Host "============================================" -ForegroundColor DarkGray
Write-Host "   ADB PORT FORWARDING TOOL" -ForegroundColor Cyan
Write-Host "   Coded by AKASH BLACK HAT" -ForegroundColor Red
Write-Host "============================================" -ForegroundColor DarkGray
Write-Host ""

# -------- FUNCTIONS --------
function Exit-WithError($msg) {
    Write-Host "[ERROR] $msg" -ForegroundColor Red
    exit 1
}

# -------- ADB PATH INPUT --------
$adbPath = Read-Host "Enter FULL path of adb.exe (e.g. C:\Android\platform-tools\adb.exe)"
if (-not (Test-Path $adbPath)) {
    Exit-WithError "adb.exe not found at given path."
}

# -------- USER INPUT --------
$device = Read-Host "Enter Android Emulator / Device name (e.g. emulator-5554)"
if ([string]::IsNullOrWhiteSpace($device)) {
    Exit-WithError "Device name cannot be empty."
}

$winip = Read-Host "Enter Windows IP (e.g. 192.168.0.214)"
if ($winip -notmatch '^(\d{1,3}\.){3}\d{1,3}$') {
    Exit-WithError "Invalid IP address format."
}

$port = Read-Host "Enter ADB Port (default 5555)"
if ([string]::IsNullOrWhiteSpace($port)) {
    $port = 5555
}
if ($port -notmatch '^\d+$') {
    Exit-WithError "Port must be numeric."
}

Write-Host ""
Write-Host "[INFO] ADB Path : $adbPath" -ForegroundColor Yellow
Write-Host "[INFO] Device   : $device"
Write-Host "[INFO] IP       : $winip"
Write-Host "[INFO] Port     : $port"
Write-Host ""

# -------- ENABLE TCP MODE --------
Write-Host "[*] Enabling ADB TCP mode..." -ForegroundColor Cyan
& "$adbPath" -s $device tcpip $port
if ($LASTEXITCODE -ne 0) {
    Exit-WithError "Failed to enable ADB TCP mode. Check device name."
}

# -------- CLEAN OLD PORTPROXY --------
Write-Host "[*] Removing old portproxy rule..." -ForegroundColor Cyan
netsh interface portproxy delete v4tov4 listenport=$port 2>$null

# -------- ADD PORTPROXY --------
Write-Host "[*] Adding portproxy rule..." -ForegroundColor Cyan
netsh interface portproxy add v4tov4 `
listenaddress=$winip listenport=$port `
connectaddress=127.0.0.1 connectport=$port

if ($LASTEXITCODE -ne 0) {
    Exit-WithError "Portproxy failed. Run PowerShell as Administrator."
}

# -------- FIREWALL RULE --------
Write-Host "[*] Adding Firewall rule..." -ForegroundColor Cyan
netsh advfirewall firewall add rule `
name="ADB-$port" dir=in action=allow protocol=TCP localport=$port 2>$null

if ($LASTEXITCODE -ne 0) {
    Exit-WithError "Firewall rule failed."
}

# -------- VERIFY --------
Write-Host ""
Write-Host "[+] Active Portproxy Rules:" -ForegroundColor Green
netsh interface portproxy show all

Write-Host ""
Write-Host "[SUCCESS] ADB EXPOSED SUCCESSFULLY" -ForegroundColor Green
Write-Host "Coded by AKASH BLACK HAT" -ForegroundColor Red
Write-Host "Connect from Kali/Linux using:" -ForegroundColor Yellow
Write-Host "adb connect $winip`:$port"

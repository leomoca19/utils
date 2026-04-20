Set-variable -Name Global:SOURCE -value "C:/src/" -Option ReadOnly -Force
Set-Variable -Name Global:CLOUD -Value "$HOME/My Drive/" -Option ReadOnly -Force

Clear-Host
Get-ChildItem $SOURCE

$dev = $SOURCE
function restart {
	$env:Path = [System.Environment]::GetEnvironmentVariable("Path", "Machine") + ";" + [System.Environment]::GetEnvironmentVariable("Path", "User")
	Write-Host "Path refreshed" -ForegroundColor Cyan
}

function dev {
	param ([string]$extrapath = "")
	Set-Location "$SOURCE$extrapath"
}
function sandbox {
	Set-Location "$SOURCE\sandbox"
}

function nvim_set {
	nvim C:\Users\leomo\Appdata\Local\nvim\init.lua
}

function cloud {
	param ([string]$extrapath = "")
	Set-Location "$CLOUD$extrapath"
}

function gitacp {
	param ([string]$msg)
	git add .; git commit -m $msg; git push
}


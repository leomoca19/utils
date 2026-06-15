Set-variable -Name Global:SOURCE -value "C:/src/" -Option ReadOnly -Force
Set-Variable -Name Global:CLOUD -Value "$HOME/My Drive/" -Option ReadOnly -Force

Clear-Host
Get-ChildItem $SOURCE

$dev = $SOURCE
$here = ""

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

function here {
	param ([string]$path)
	Write-Host $here
	$here = Get-Location 
	Write-Host "Function under construction: set var 'here' to arg path if path is not empty"
	Write-Host "Location saved $here" -ForegroundColor Cyan
}

function back {

	Set-Location "$here"
	Write-Host "Function under construction: add case when var here is empty"
}

# Clones a repo from leomoca19
# It really is just a shortcut for cloning my own repos
function clone {
	param ([string]$repo)
	git clone "https://github.com/leomoca19/$repo"
}

function matrix {
	$KeyPath = "$HOME/.ssh/id_ed25519"
	$Remote = "lde-la-mora-caceres@matrix.senecapolytechnic.ca"

	if(-not (Test-Path "${KeyPath}.pub")) {
		Write-Host "No SSH key found. Generating ed25519 pair..." -ForegroundColor Cyan

		ssh-keygen -t ed25519 -f $KeyPath -N '""'

		Write-Host "Staging key to matrix..." -ForegroundColor Cyan
		scp "${KeyPath}.pub" "${Remote}:~/.key"
	}

	ssh $Remote
}
# To do:
# function to add a path to $PATH
# finish here  and back fucntions
# figure how to persist changes on an object declared at first run of profile script

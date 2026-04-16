function restart {
	$env:Path = [System.Environment]::GetEnvironmentVariable("Path","Machine") + ";" + [System.Environment]::GetEnvironmentVariable("Path","User")
	Write-Host "Path refreshed" -ForegroundColor Cyan
}

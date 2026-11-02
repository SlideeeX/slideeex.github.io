# Serves both language versions from one host and port: http://127.0.0.1:<port>/Guic/en/ and /Guic/ru/
# Builds first. Live reload is not available; rerun the script after editing docs.
param([int]$Port = 8000)
$ErrorActionPreference = 'Stop'
Set-Location $PSScriptRoot

& "$PSScriptRoot/build-docs.ps1"
if ($LASTEXITCODE -ne 0) { throw 'Build failed' }

Write-Host "Serving http://127.0.0.1:$Port/Guic/en/ and /Guic/ru/"
python -m http.server $Port --bind 127.0.0.1 --directory site

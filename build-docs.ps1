# Builds the documentation: English into site/Guic/en, Russian into site/Guic/ru.
# Run from anywhere. site/Guic/index.html redirects to the English version.
$ErrorActionPreference = 'Stop'
Set-Location $PSScriptRoot

Remove-Item -Recurse -Force site/Guic -ErrorAction SilentlyContinue

# mkdocs.ru.yml uses docs/ru as docs_dir, so the shared stylesheet (kept in docs/en) is copied there.
New-Item -ItemType Directory -Force -Path docs/ru/stylesheets | Out-Null
Copy-Item -Force docs/en/stylesheets/extra.css docs/ru/stylesheets/extra.css

python -m mkdocs build --strict -f mkdocs.yml
if ($LASTEXITCODE -ne 0) { throw 'English build failed' }

python -m mkdocs build --strict -f mkdocs.ru.yml
if ($LASTEXITCODE -ne 0) { throw 'Russian build failed' }

$redirect = '<!doctype html><meta charset="utf-8"><meta http-equiv="refresh" content="0; url=en/"><link rel="canonical" href="en/"><title>Guic documentation</title><a href="en/">English</a> | <a href="ru/">Russian</a>'
Set-Content -Path site/Guic/index.html -Value $redirect -Encoding utf8
New-Item -ItemType File -Force -Path site/.nojekyll | Out-Null

Write-Host 'Done: site/Guic/en (en), site/Guic/ru (ru)'

$ErrorActionPreference = 'Stop';
Write-Host "Starting build"

docker build -t $env:USER/$env:IMAGE $env:IMAGE

Write-Host "Finished build"
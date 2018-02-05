$ErrorActionPreference = 'Stop';


$packageName= 'dopamine'
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url = 'https://www.digimezzo.com/content/software/dopamine/Dopamine%201.5.9.0.msi'
$checksum = '8A4363BA0ED47B14F4145E580C83054CA716E4EC6091164FB40507CF50117C68'

$packageArgs = @{
  packageName   = $packageName
  unzipLocation = $toolsDir
  fileType      = 'MSI'
  url           = $url

  softwareName  = 'dopamine*' 

  checksum      = $checksum
  checksumType  = 'sha256' 

  silentArgs    = "/qn /norestart /l*v `"$($env:TEMP)\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`"" 
  validExitCodes= @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs

$ErrorActionPreference = "Stop"

$repoRoot = Split-Path -Parent $PSScriptRoot
$appDirectory = Join-Path $repoRoot "app"
$sourcePath = Join-Path $appDirectory "source.html"
$partCount = 12

if (-not (Test-Path -LiteralPath $sourcePath -PathType Leaf)) {
  throw "No se encontró el archivo fuente: $sourcePath"
}

$encoded = [Convert]::ToBase64String([IO.File]::ReadAllBytes($sourcePath))
$baseLength = [Math]::Floor($encoded.Length / $partCount)
$remainder = $encoded.Length % $partCount
$offset = 0
$utf8WithoutBom = [Text.UTF8Encoding]::new($false)

for ($index = 0; $index -lt $partCount; $index++) {
  $length = $baseLength
  if ($index -lt $remainder) {
    $length++
  }

  $partPath = Join-Path $appDirectory ("part_{0}.b64" -f $index.ToString("00"))
  [IO.File]::WriteAllText(
    $partPath,
    $encoded.Substring($offset, $length),
    $utf8WithoutBom
  )
  $offset += $length
}

Write-Host "Reconstruidos $partCount fragmentos desde app/source.html."

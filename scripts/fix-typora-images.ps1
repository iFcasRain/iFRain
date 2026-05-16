# 将笔记中的 Typora 本地图片复制到 docs/public/assets 并改写为相对 URL
$ErrorActionPreference = "Stop"
$typoraDir = "$env:APPDATA\Typora\typora-user-images"
$assetsDir = Join-Path (Split-Path -Parent $PSScriptRoot) "docs\public\assets"
New-Item -ItemType Directory -Force -Path $assetsDir | Out-Null

$docsRoot = Join-Path (Split-Path -Parent $PSScriptRoot) "docs"
$files = Get-ChildItem -Path $docsRoot -Filter "*.md" -Recurse

$pattern = '(?:src="|!\[[^\]]*\]\()([^"\)]+typora-user-images[^"\)]+)'

foreach ($file in $files) {
    $content = Get-Content $file.FullName -Raw -Encoding UTF8
  $changed = $false
    $newContent = [regex]::Replace($content, $pattern, {
        param($m)
        $fullPath = $m.Groups[1].Value -replace '/', '\'
        if (-not (Test-Path $fullPath)) { return $m.Value }
        $name = Split-Path $fullPath -Leaf
        Copy-Item $fullPath (Join-Path $assetsDir $name) -Force
        $changed = $true
        if ($m.Value -match '^src=') { return "src=`"/assets/$name`" alt=`"$name`"" }
        return "![$name](/assets/$name)"
    })
    if ($newContent -ne $content) {
        Set-Content -Path $file.FullName -Value $newContent -Encoding UTF8 -NoNewline
        Write-Host "Fixed: $($file.FullName)"
    }
}

Write-Host "Images copied to docs/public/assets"

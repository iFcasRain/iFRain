# 复制 Typora 本地图到 docs/public/assets，并修复笔记中的图片引用
$ErrorActionPreference = "Stop"
$root = Split-Path -Parent $PSScriptRoot
$typoraDir = "$env:APPDATA\Typora\typora-user-images"
$assetsDir = Join-Path $root "docs\public\assets"
$docsRoot = Join-Path $root "docs"

New-Item -ItemType Directory -Force -Path $assetsDir | Out-Null

function Repair-ImageMarkup([string]$content) {
    # 修复历史脚本产生的错误：双 alt、多余括号
    $content = $content -replace '\.png""\s*alt="([^"]*)"', '.png" alt="$1"'
    $content = $content -replace '\)\)(?!\))', ')'

    # <img src="/assets/xx" ...> → Markdown（VitePress 会正确处理 base 路径）
    $content = [regex]::Replace(
        $content,
        '<img\s+src="(/assets/[^"]+)"[^>]*>',
        { param($m) "![]($($m.Groups[1].Value))" }
    )

    # 修复已有 Markdown 图片的多余括号
    $content = [regex]::Replace(
        $content,
        '!\[([^\]]*)\]\((/assets/[^)\s]+)\)\)',
        '![$1]($2)'
    )

    return $content
}

function Import-TyporaImage([string]$fullPath, [string]$name) {
    if (-not (Test-Path -LiteralPath $fullPath)) { return $false }
    Copy-Item -LiteralPath $fullPath -Destination (Join-Path $assetsDir $name) -Force
    return $true
}

# 1) 处理 Typora 绝对路径
$typoraPattern = '(?:src="|!\[[^\]]*\]\()([^"\)]+typora-user-images[^"\)]+)'
$files = Get-ChildItem -Path $docsRoot -Filter "*.md" -Recurse

foreach ($file in $files) {
    $content = Get-Content -LiteralPath $file.FullName -Raw -Encoding UTF8
    $original = $content

    $content = [regex]::Replace($content, $typoraPattern, {
        param($m)
        $fullPath = $m.Groups[1].Value -replace '/', '\'
        $name = Split-Path $fullPath -Leaf
        if (-not (Import-TyporaImage $fullPath $name)) { return $m.Value }
        if ($m.Value -match '^src=') { return "![](/assets/$name)" }
        return "![$name](/assets/$name)"
    })

    $content = Repair-ImageMarkup $content

    if ($content -ne $original) {
        [System.IO.File]::WriteAllText($file.FullName, $content, [System.Text.UTF8Encoding]::new($false))
        Write-Host "Fixed: $($file.FullName)"
    }
}

Write-Host "Done. Assets: $assetsDir"

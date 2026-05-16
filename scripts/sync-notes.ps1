# 从上级笔记目录同步 Markdown 到网站（在 personal-site 目录下运行）
$ErrorActionPreference = "Stop"
$root = Split-Path -Parent $PSScriptRoot
$docs = Join-Path $root "docs\notes"

# 固定路径映射
$maps = @{
    (Join-Path $root "..\信号与系统\信号与系统.md")                         = "$docs\signal-system\overview.md"
    (Join-Path $root "..\信号与系统\第二章_线性时不变系统.md")               = "$docs\signal-system\ch02-lti.md"
    (Join-Path $root "..\信号与系统\第三章_周期信号的傅里叶级数表示.md")     = "$docs\signal-system\ch03-fourier-series.md"
    (Join-Path $root "..\信号与系统\第四章_连续时间傅里叶变换.md")           = "$docs\signal-system\ch04-fourier-transform.md"
    (Join-Path $root "..\前端web\HTTP协议.md")                            = "$docs\frontend\http.md"
    (Join-Path $root "..\前端web\CSS.md")                                 = "$docs\frontend\css.md"
    (Join-Path $root "..\前端web\JavaScript.md")                          = "$docs\frontend\javascript.md"
    (Join-Path $root "..\前端web\HTML\HTML.md")                           = "$docs\frontend\html.md"
    (Join-Path $root "..\Agent开发学习实验\docs\Agent开发学习路线.md")      = "$docs\agent\roadmap.md"
    (Join-Path $root "..\Agent开发学习实验\docs\Phase0_零基础Agent入门完整讲义.md") = "$docs\agent\phase0.md"
    (Join-Path $root "..\Leetcode.md")                                    = "$docs\misc\leetcode.md"
    (Join-Path $root "..\Verilog.md")                                    = "$docs\misc\verilog.md"
}

# 操作系统 / 人工智能（通过快捷方式指向网课笔记目录）
$folderMaps = @(
    @{ Lnk = "..\操作系统.lnk"; DstDir = "$docs\os"; Files = @{
            "操作系统.md"           = "overview.md"
            "操作系统原理习题库.md" = "exercises.md"
        }
    }
    @{ Lnk = "..\人工智能.lnk"; DstDir = "$docs\ai"; Files = @{
            "人工智能.md"   = "overview.md"
            "归结原理.md"   = "resolution.md"
            "Python\Python1.md" = "python\python1.md"
        }
    }
)

function Copy-IfExists($src, $dst) {
    $src = [System.IO.Path]::GetFullPath($src)
    if (-not (Test-Path -LiteralPath $src)) {
        Write-Warning "Skip (missing): $src"
        return
    }
    $dir = Split-Path $dst -Parent
    if ($dir) { New-Item -ItemType Directory -Force -Path $dir | Out-Null }
    Copy-Item -LiteralPath $src -Destination $dst -Force
    Write-Host "OK: $src -> $dst"
}

foreach ($pair in $maps.GetEnumerator()) {
    Copy-IfExists $pair.Key $pair.Value
}

$shell = New-Object -ComObject WScript.Shell
foreach ($fm in $folderMaps) {
    $lnkPath = Join-Path $root $fm.Lnk
    if (-not (Test-Path -LiteralPath $lnkPath)) {
        Write-Warning "Skip (no shortcut): $lnkPath"
        continue
    }
    $srcRoot = $shell.CreateShortcut((Resolve-Path -LiteralPath $lnkPath).Path).TargetPath
    foreach ($entry in $fm.Files.GetEnumerator()) {
        Copy-IfExists (Join-Path $srcRoot $entry.Key) (Join-Path $fm.DstDir $entry.Value)
    }
}

Write-Host "Sync complete."
Write-Host "Next: .\scripts\fix-typora-images.ps1"

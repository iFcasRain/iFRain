# 从上级笔记目录同步 Markdown 到网站（在 personal-site 目录下运行）
$ErrorActionPreference = "Stop"
$root = Split-Path -Parent $PSScriptRoot
$docs = Join-Path $root "docs\notes"

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

foreach ($pair in $maps.GetEnumerator()) {
    $src = [System.IO.Path]::GetFullPath($pair.Key)
    $dst = $pair.Value
    if (Test-Path $src) {
        Copy-Item $src $dst -Force
        Write-Host "OK: $src -> $dst"
    } else {
        Write-Warning "Skip (missing): $src"
    }
}

Write-Host "Sync complete."

# 理解並測試三師爸 OpenCode 懶人包

## 專案簡介

這個專案主要是用來測試三師爸老師分享的 OpenCode 懶人包，並且嘗試去理解裡面的技能、一些工具，還有一些邏輯的思考流程。

## 資料夾結構

```
/
├── AGENTS.md          # 專案指令與第二大腦關聯
├── README.md          # 專案說明
└── ...                # 懶人包相關檔案與測試記錄
```

## Obsidian 第二大腦關聯資料

- **Obsidian vault**：`G:\我的雲端硬碟\AI\2ndbrain`
- **專案工作筆記**：`創作庫/OpenCode 懶人包測試/`
- **每日筆記**：`每日筆記/<日期>.md`
- **Templates**：`Templates/`

## 安裝與設定

### 安裝的 MCP 伺服器

| MCP | 用途 | 狀態 |
|-----|------|------|
| NotebookLM | 筆記本 AI 助理 | ✅ |
| GitHub | GitHub API 操作 | ✅ |
| Firebase | Firebase 後端服務 | ✅ |
| Obsidian MCP Vault | Obsidian 筆記讀寫 | ✅ |
| Playwright | 瀏覽器自動化 | ✅ |
| open-computer-use | 桌面自動化 | ✅ |

### 安裝的全域技能

| 技能 | 關鍵字 | 用途 |
|------|--------|------|
| startup | 開工 / 我來了 | 讀進度 + 檢查 Git |
| shutdown | 收工 / 下班 | Git 同步 + 更新 Obsidian |
| project-init | 初始化專案 | 建立新專案結構 |
| draw | 畫一張 / 生圖 | OpenAI gpt-image-2 生圖 |
| audio-to-srt | 做字幕 / 轉 SRT | Groq Whisper 語音轉字幕 |

## 使用方式

1. 在專案目錄執行 `opencode`
2. 說「開工」查看進度
3. 說「收工」同步變更

## 同步對照表

| 位置 | 對應路徑 |
|------|---------|
| GitHub 遠端 | `https://github.com/t92016/opencode-lazy-packs` |
| GitHub Pages (公開) | `https://t92016.github.io/opencode-lazy-packs/` |
| 本機專案 | `G:\我的雲端硬碟\AI\AI Agents\OpenCode\opencode-lazy-packs_20260711` |
| Obsidian 工作筆記 | `創作庫/OpenCode 懶人包測試/README.md` |

## 異地異機同步 — 新電腦設定指南

### 第一步：前置安裝

在新電腦上先安裝基礎環境：

```
1. 安裝 Node.js (https://nodejs.org) → 確認 node --version 可用
2. 安裝 GitHub CLI → 確認 gh --version 可用
3. npm install -g opencode-ai           → 確認 opencode --version 可用
4. 用 Google Drive 同步本機專案資料夾
   或 git clone https://github.com/t92016/opencode-lazy-packs
```

### 第二步：還原 OpenCode 設定

開啟 PowerShell，執行以下命令還原備份的設定檔：

```
# 檢查 Google Drive 是否有備份
Get-ChildItem "G:\我的雲端硬碟\AI\AI Agents\opencode-config-backup"

# 手動還原（把備份 zip 解壓到 ~/.config/opencode/）
$latestZip = "G:\我的雲端硬碟\AI\AI Agents\OpenCode\opencode-config-backup\opencode-config-latest.zip"
$target = "$env:USERPROFILE\.config\opencode"

Add-Type -AssemblyName System.IO.Compression.FileSystem
$tempDir = Join-Path $env:TEMP "opencode-restore"
if (Test-Path $tempDir) { Remove-Item -Recurse -Force $tempDir }
New-Item -ItemType Directory -Force -Path $tempDir | Out-Null
[System.IO.Compression.ZipFile]::ExtractToDirectory($latestZip, $tempDir)

# 備份舊設定（如果有的話）
if (Test-Path $target) {
    Rename-Item $target "$target.old"
}
Copy-Item -Recurse (Join-Path $tempDir "opencode") $target
Remove-Item -Recurse -Force $tempDir
Write-Host "還原完成！"
```

### 第三步：重新登入 NotebookLM

```
nlm login
```

### 第四步：試試「開工」

```
# 切到專案目錄
cd G:\我的雲端硬碟\AI\AI Agents\OpenCode\opencode-lazy-packs_20260711
opencode
# 然後說「開工」
```

### 重點提醒

| 項目 | 每臺新電腦都要做 | 說明 |
|------|-----------------|------|
| Node.js + npm | ✅ | 基礎環境 |
| opencode-ai 全域安裝 | ✅ | `npm install -g opencode-ai` |
| 還原 `~/.config/opencode/` | ✅ | 從 Google Drive 備份解壓 |
| Obsidian Vault 同步 | ✅ | 確認 Google Drive 有同步到 |
| NotebookLM 重新登入 | ✅ | `nlm login`（Google 認證綁本機） |
| GitHub CLI 登入 | ✅ | `gh auth login` |
| 專案資料夾同步 | ✅ | Google Drive 或 git clone |

> **之後每次說「收工」**，shutdown 技能會自動備份 `~/.config/opencode/` 到 Google Drive。
> 換新電腦時只要重複「第二步驟」還原設定，就能無縫接續。

## 更新紀錄

| 日期 | 更新內容 |
|------|---------|
| 2026-07-11 | 專案初始化完成 |
| 2026-07-11 | 新增異地同步指南 + shutdown 雲端備份功能 |

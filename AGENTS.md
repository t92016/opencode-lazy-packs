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

- **Obsidian vault**：`J:\我的雲端硬碟\AI\2ndbrain`
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

## 使用方式

1. 在專案目錄執行 `opencode`
2. 說「開工」查看進度
3. 說「收工」同步變更

## 同步對照表

| 位置 | 對應路徑 |
|------|---------|
| GitHub 遠端 | `https://github.com/t92016/opencode-lazy-packs` |
| 本機專案 | `J:\我的雲端硬碟\AI\AI Agents\OpenCode\opencode-lazy-packs_20260711` |
| Obsidian 工作筆記 | `創作庫/OpenCode 懶人包測試/README.md` |

## 更新紀錄

| 日期 | 更新內容 |
|------|---------|
| 2026-07-11 | 專案初始化完成 |

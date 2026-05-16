# 个人笔记站

基于 [VitePress](https://vitepress.dev/) 的静态个人网站，用于发布学习笔记与个人随笔，通过 GitHub Pages 免费托管。

## 本地预览

```bash
cd personal-site
npm install
npm run dev
```

浏览器打开终端提示的地址（一般为 `http://localhost:5173`）。

## 发布到 GitHub Pages

### 1. 创建仓库

任选一种方式：

| 方式 | 仓库名 | `VITEPRESS_BASE` |
|------|--------|------------------|
| 用户主页 | `你的用户名.github.io` | `/` |
| 项目站 | 任意名称，如 `notes-site` | `/notes-site/` |

将本目录 `personal-site` 下的全部文件推送到仓库根目录（不要多一层 `personal-site` 文件夹）。

### 2. 开启 Pages

仓库 **Settings → Pages → Build and deployment**：

- Source 选择 **GitHub Actions**

推送 `main` 或 `master` 分支后，`.github/workflows/deploy.yml` 会自动构建并部署。

### 3. 项目站修改 base

编辑 `.github/workflows/deploy.yml` 中 `VITEPRESS_BASE`，并同步修改 `docs/.vitepress/config.ts` 里的 `base` 默认值。

## 添加内容

| 类型 | 目录 | 说明 |
|------|------|------|
| 笔记 | `docs/notes/` | 按子目录分类 |
| 随笔 | `docs/essays/` | 个人文章 |
| 关于 | `docs/about.md` | 个人介绍 |

新增页面后，在 `docs/.vitepress/config.ts` 的 `sidebar` 中增加链接。

## 从本地笔记同步

在 `personal-site` 目录依次执行：

```powershell
.\scripts\sync-notes.ps1
.\scripts\fix-typora-images.ps1
```

第一步会把上级 `笔记` 目录中已映射的 Markdown 复制到本站；第二步会把 Typora 本地图片复制到 `docs/public/assets/` 并改写链接。

> 建议在 Typora 中设置：**偏好设置 → 图像 → 复制到指定路径** 为 `./assets`，与网站目录一致，便于长期维护。

## 自定义

- 站点标题、导航：`docs/.vitepress/config.ts`
- 主题样式：`docs/.vitepress/theme/custom.css`
- GitHub 链接：修改 `socialLinks` 与首页 `actions`

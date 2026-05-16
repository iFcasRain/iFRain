import { defineConfig } from 'vitepress'

// GitHub Pages 项目站请改为 '/仓库名/'；用户主页仓库 username.github.io 保持 '/'
const base = process.env.VITEPRESS_BASE || '/'

export default defineConfig({
  title: '个人笔记站',
  description: '学习笔记与个人随笔',
  lang: 'zh-CN',
  base,
  cleanUrls: true,
  lastUpdated: true,
  markdown: {
    math: true,
    lineNumbers: true,
  },
  head: [
    ['link', { rel: 'icon', href: `${base}favicon.svg`, type: 'image/svg+xml' }],
    [
      'link',
      {
        rel: 'stylesheet',
        href: 'https://fonts.googleapis.com/css2?family=Noto+Sans+SC:wght@400;500;600;700&family=JetBrains+Mono:wght@400;500&display=swap',
      },
    ],
  ],
  themeConfig: {
    logo: '/favicon.svg',
    siteTitle: '个人笔记站',
    outline: { level: [2, 3] },
    search: {
      provider: 'local',
      options: {
        locales: {
          root: {
            translations: {
              button: { buttonText: '搜索', buttonAriaLabel: '搜索' },
              modal: {
                noResultsText: '未找到结果',
                resetButtonTitle: '清除',
                footer: {
                  selectText: '选择',
                  navigateText: '切换',
                  closeText: '关闭',
                },
              },
            },
          },
        },
      },
    },
    nav: [
      { text: '首页', link: '/' },
      { text: '笔记', link: '/notes/' },
      { text: '随笔', link: '/essays/' },
      { text: '关于', link: '/about' },
    ],
    sidebar: {
      '/notes/': [
        {
          text: '信号与系统',
          collapsed: false,
          items: [
            { text: '课程概览', link: '/notes/signal-system/overview' },
            { text: '第二章 LTI 系统', link: '/notes/signal-system/ch02-lti' },
            { text: '第三章 傅里叶级数', link: '/notes/signal-system/ch03-fourier-series' },
            { text: '第四章 傅里叶变换', link: '/notes/signal-system/ch04-fourier-transform' },
          ],
        },
        {
          text: '前端 Web',
          collapsed: false,
          items: [
            { text: 'HTML', link: '/notes/frontend/html' },
            { text: 'CSS', link: '/notes/frontend/css' },
            { text: 'JavaScript', link: '/notes/frontend/javascript' },
            { text: 'HTTP 协议', link: '/notes/frontend/http' },
          ],
        },
        {
          text: 'Agent 开发',
          collapsed: true,
          items: [
            { text: '学习路线', link: '/notes/agent/roadmap' },
            { text: 'Phase 0 入门', link: '/notes/agent/phase0' },
          ],
        },
        {
          text: '其他',
          collapsed: true,
          items: [
            { text: 'Leetcode', link: '/notes/misc/leetcode' },
            { text: 'Verilog', link: '/notes/misc/verilog' },
          ],
        },
      ],
      '/essays/': [
        {
          text: '随笔',
          items: [{ text: '欢迎来到我的博客', link: '/essays/welcome' }],
        },
      ],
    },
    socialLinks: [
      // 将下方链接改为你的 GitHub 主页
      { icon: 'github', link: 'https://github.com/YOUR_USERNAME' },
    ],
    footer: {
      message: '基于 VitePress 构建 · 托管于 GitHub Pages',
      copyright: `Copyright © ${new Date().getFullYear()}`,
    },
    docFooter: { prev: '上一篇', next: '下一篇' },
    lastUpdated: {
      text: '最后更新于',
      formatOptions: { dateStyle: 'medium', timeStyle: 'short' },
    },
  },
})

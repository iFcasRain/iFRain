import { defineConfig } from 'vitepress'

// GitHub Pages 项目站请改为 '/仓库名/'；用户主页仓库 username.github.io 保持 '/'
const base = process.env.VITEPRESS_BASE || '/'

export default defineConfig({
  title: '浮生若梦',
  description: '前往明天以外 · 笔记、杂学与随笔',
  lang: 'zh-CN',
  base,
  cleanUrls: true,
  lastUpdated: true,
  markdown: {
    math: true,
    lineNumbers: true,
    theme: {
      light: 'github-light',
      dark: 'monokai',
    },
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
    logo: '/cat-logo.svg',
    siteTitle: '浮生若梦',
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
      { text: '杂学', link: '/interest/' },
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
          text: '操作系统',
          collapsed: false,
          items: [
            { text: '原理笔记', link: '/notes/os/overview' },
            { text: '习题库', link: '/notes/os/exercises' },
          ],
        },
        {
          text: '人工智能',
          collapsed: false,
          items: [
            { text: '课程笔记', link: '/notes/ai/overview' },
            { text: '归结原理实验', link: '/notes/ai/resolution' },
            { text: 'Python 基础', link: '/notes/ai/python/python1' },
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
      '/interest/': [
        {
          text: '杂学',
          collapsed: false,
          items: [{ text: '栏目说明', link: '/interest/' }],
        },
        {
          text: '哲学',
          collapsed: false,
          items: [{ text: '阅读索引', link: '/interest/philosophy/introduction' }],
        },
        {
          text: '心理学',
          collapsed: false,
          items: [{ text: '阅读索引', link: '/interest/psychology/introduction' }],
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
      { icon: 'github', link: 'https://github.com/iFcasRain/iFRain' },
    ],
    footer: {
      message: 'Pink-Cat-Boo 配色 · VitePress · GitHub Pages',
      copyright: `Copyright © ${new Date().getFullYear()} · 浮生若梦`,
    },
    docFooter: { prev: '上一篇', next: '下一篇' },
    lastUpdated: {
      text: '最后更新于',
      formatOptions: { dateStyle: 'medium', timeStyle: 'short' },
    },
  },
})

import DefaultTheme from 'vitepress/theme'
import { inBrowser } from 'vitepress'
import './custom.css'

/** 仅首页使用的背景图，放在 docs/public/ 下 */
const BG_IMAGE_FILE = 'bg-home.jpg'

function applyCatAssets() {
  const base = import.meta.env.BASE_URL
  document.documentElement.style.setProperty('--nest-bg-image', `url("${base}${BG_IMAGE_FILE}")`)
  document.documentElement.style.setProperty('--cat-paw-pattern', `url("${base}paw-pattern.svg")`)
}

/** 修正 Markdown/HTML 中 /assets/ 路径，适配 GitHub Pages 子路径 */
function fixPublicAssetUrls() {
  const base = import.meta.env.BASE_URL
  document.querySelectorAll<HTMLImageElement>('img[src^="/assets/"]').forEach((img) => {
    const path = img.getAttribute('src')
    if (path) img.src = `${base}${path.slice(1)}`
  })
}

export default {
  extends: DefaultTheme,
  enhanceApp({ router }) {
    if (inBrowser) {
      applyCatAssets()
      fixPublicAssetUrls()
      router.onAfterRouteChange = () => fixPublicAssetUrls()
    }
  },
}

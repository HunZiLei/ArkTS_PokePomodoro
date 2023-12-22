import web_webview from '@ohos.web.webview'
import router from '@ohos.router'
import http from '@ohos.net.http'

@Entry
@Component
struct WebPage {
  private webController: web_webview.WebviewController = new web_webview.WebviewController();
  @State params: object = router.getParams()

  build() {
    Row() {
      Web({
        src: this.params?.['url'],
        controller: this.webController
      })
        .width("100%")
        .height("100%")
        .wideViewModeAccess(true)
        .textZoomRatio(150)
    }
    .height('100%')
  }
}
import webview from '@ohos.web.webview'
import router from '@ohos.router'

@Entry
@Component
struct NewsWeb {
  private webController: WebviewController = new webview.WebviewController();
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
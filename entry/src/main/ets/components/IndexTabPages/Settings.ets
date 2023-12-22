import router from '@ohos.router';
@Component

export struct Settings {

  build() {
    Column() {
      Navigation(){
        List() {
          ListItem() {
            Row() {
              Text('关于')
                .fontSize(18)
                .fontColor(Color.White)
              Blank()
                .layoutWeight(10)
              Image($r('app.media.burry_2'))
                .size({width:60,height:60})
              Blank()
                .layoutWeight(1)
            }.margin({ left: 18 })
            .width('100%')
            .justifyContent(FlexAlign.Start)
          }
          .height(60)
          .backgroundColor('#9BDEBB')
          .borderRadius(24)
          .width('100%')

          .onClick(() => {
            router.pushUrl({
              url: "pages/About"
            }, router.RouterMode.Single, (err) => {
              if (err) {
                console.error(`Invoke pushUrl failed, code is ${err.code}, message is ${err.message}`);
              }
            })
          })
        }
        .padding({ left: 12, right: 12, bottom: 10, top: 10 })

      }
      .title('设置')
      .titleMode(NavigationTitleMode.Full)

    }.width('100%')
    .height('100%')

  }
}
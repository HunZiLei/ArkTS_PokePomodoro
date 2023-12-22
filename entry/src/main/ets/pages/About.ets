@Entry
@Component
struct About {
  @State message: string = 'Hello World'

  @Builder LongText(value: string) {
    Text(value)
      .fontSize(16)
      .margin({bottom: 10})
  }

  build() {
    Column(){
      Navigation() {
        Column() {
          Column() {
            Image($rawfile('sr_my_app_icon.png'))
              .width(80)
              .height(80)
              .margin({bottom: 20})
              .borderRadius(16)
            Text('学习清单 内测版')
              .fontSize('45vp')
              .fontColor('#B804F7')
            Text('HunZiLei')
              .fontColor('#B804F7')
              .fontSize('30vp')
          }
          Column() {
            Text('当前版本：v1.0')
              .fontSize('30vp')
          }
        }.margin({top: 20})
        .justifyContent(FlexAlign.SpaceEvenly)
        .height('80%')
      }.titleMode(NavigationTitleMode.Mini)
      .title('关于')
      .mode(NavigationMode.Stack)
    }
    .backgroundImage($r('app.media.about_background'))
    .backgroundImageSize({width:'100%',height:'100%'})
    .height('100%')
    .width('100%')
  }
}
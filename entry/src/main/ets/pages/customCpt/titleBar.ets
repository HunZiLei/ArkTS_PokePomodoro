import router from '@system.router';

@Component
export struct TitleBar {
  private title: string = ''
  private eventBack: (event?: ClickEvent) => void = () => {
    router.back()
  }

  build() {
    Column() {
      Row() {
        Image($r('app.media.ic_back'))
          .width(50)
          .padding(14)
          .margin({ left: 5 })
          .onClick(this.eventBack)

        Text(this.title)
          .textAlign(TextAlign.Center)
          .fontSize(18)
          .layoutWeight(1)

        Blank()
      }
      .width('100%')
      .height(50)
      .backgroundColor(Color.White)
    }
  }
}
import router from '@ohos.router';
@Component

@Entry
export struct Pomodoro {
  textTimerController: TextTimerController = new TextTimerController()
  format: string = 'mm:ss.SS'

  build() {
    Column() {
      Navigation(){
        Column() {
            TextTimer({ isCountDown: false, count: 300000, controller: this.textTimerController })
            .format(this.format)
            .margin({top: 25,bottom: 20,right: 200, left: 200 })
            .fontColor(Color.Black)
            .fontSize(50)
            .onTimer((utc: number, elapsedTime: number) => {
              console.info('textTimer is：' + utc + ', elapsedTime is: ' + elapsedTime)
            })

            Button("计时开始")
              .backgroundColor('#9BDEBB')
              .type(ButtonType.Normal)
              .margin({top: 20, bottom: 10})
              .borderRadius(24)
              .width(160)
              .height(60)
              .fontSize(24)
              .onClick(() => {
                this.textTimerController.start()
              })

            Button("暂停计时")
              .backgroundColor('#9BDEBB')
              .type(ButtonType.Normal)
              .borderRadius(24)
              .margin({bottom: 10})
              .width(160)
              .height(60)
              .fontSize(24)
              .onClick(() => {
                this.textTimerController.pause()
              })

            Button("重置")
              .backgroundColor('#9BDEBB')
              .type(ButtonType.Normal)
              .borderRadius(24)
              .width(160)
              .height(60)
              .fontSize(24)
              .onClick(() => {
                this.textTimerController.reset()
              })
        }
        .padding({ left: 12, right: 12, bottom: 10, top: 10 })

        Image($r('app.media.burry_1'))
          .position({x:'10%',y:'10%'})
          .size({width:'60vp',height:'60vp'})

      }
      .borderColor('#ED165B')
      .title('番茄钟')
      .titleMode(NavigationTitleMode.Full)

    }
    .width('100%')
    .height('100%')
  }
}
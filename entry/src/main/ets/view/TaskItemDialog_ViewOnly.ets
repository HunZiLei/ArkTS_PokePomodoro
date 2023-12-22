import TaskData from '../common/bean/TaskDataDefault'
import CommonConstants from '../common/constants/CommonConsts'
import Logger from '../common/utils/Logger'

@CustomDialog
export struct TaskItemDialog_ViewOnly {
  @Link taskItem: TaskData
  // @Link dialogIsAddNew: boolean
  controller: CustomDialogController
  // confirm: (dialogIsAddNew: boolean, newTask: TaskData) => void

  private taskName: string
  private taskSubject: number
  private taskDate: Date
  private taskDetailText: string

  color_column: string = '#99DBBA'
  color_back: string = '#A1E6C2'
  color_button: string = '#4BAD96'

  @State showedTaskDate: string = ''

  aboutToAppear() {
    this.taskName = this.taskItem.task_name
    this.taskSubject = this.taskItem.subject
    this.taskDetailText = this.taskItem.detail
    this.taskDate = new Date()
    Logger.debug('TaskItemDialog new date = ' + this.taskDate.toLocaleString())
    this.taskDate.setTime(this.taskItem.due_date_stamp)
    this.showedTaskDate = getTimeString(this.taskDate.getTime())
  }

  build() {
    Column() {
      Image($r('app.media.half'))
        .width(64)
        .height(24)
        .onClick(() => {
          this.controller?.close();
        })
      .margin({top: 5})
      Column() {
        Column() {
          Text('任务名称')
            .fontSize(18)
            .alignSelf(ItemAlign.Start)
            .margin({top: 12, bottom: 12})
          Text(this.taskName)
            .backgroundColor(this.color_column)
            .margin({ bottom: 10 })
            .height(50)
            .width('90%')
            .borderRadius(24)
            .padding({ left: 12, right: 12 })
          // TextInput({
          //   placeholder: '作业科目',
          //   text: this.taskSubject == 0 ? '' : this.taskSubject.toString()
          // })
          //   .backgroundColor(0xf1f2f3)
          //   .height(50)
          //   .margin({ bottom: 20 })
          //   .onChange((value: string) => {
          //     this.taskSubject = Number(value)
          //   })
          Text('详细内容')
            .fontSize(18)
            .alignSelf(ItemAlign.Start)
            .margin({top: 12, bottom: 12})
          Text(this.taskDetailText)
            .height(50 * 3)
            .width('90%')
            .borderRadius(24)
            .backgroundColor(this.color_column)
            .padding({ left: 12, right: 12, top: 12, bottom: 12 })
            .align(Alignment.TopStart)
        }.padding({ left: 16, right: 16})
        .margin({ bottom: 20})
        Text('截止日期：' + this.showedTaskDate)
          .width('80%')
          .height(50)
          .padding({ left: 12, right: 12 })
          .borderRadius(24)
          .backgroundColor(this.color_column)
          .fontColor(0x000000)
          .textAlign(TextAlign.Center)

        Progress({value: 100 - this.taskItem.getDDLPer()})
          .margin({bottom: 10, top: 10})
          .color(CommonConstants.DDL_COLOR[this.taskItem.getDDLState()])
      }
          // .margin({ bottom: 10 })
        Row() {
          // Button('取消')
          //   .margin({ right: 10 })
          //   .onClick(() => {
          //     this.controller.close()
          //   })
          Button('确定')
            .backgroundColor(this.color_button)
            .onClick(() => {
              // this.taskItem.subject = this.taskSubject
              // this.taskItem.task_name = this.taskName
              // this.taskItem.detail = this.taskDetailText
              // this.taskItem.due_date_stamp = this.taskDate.getTime()
              // Logger.debug(`TaskItemDialog due_date(stamp): ${this.taskItem.due_date_stamp}, date: ${this.taskDate.toDateString()}`)
              // this.confirm(this.dialogIsAddNew, this.taskItem)
              this.controller.close()
            })
        }.margin({ bottom: 20 })
    }
    .backgroundColor(this.color_back)
    .width('100%')
    .height('60%')
    .borderRadius(24)
    .justifyContent(FlexAlign.SpaceBetween)
  }
}

function getTimeString(date_stamp: number): string {
  let date: Date = new Date()
  date.setTime(date_stamp)
  Logger.debug(`TaskList: datestamp = ${date_stamp}, date = ${date.toLocaleDateString()}`)
  let ds: string[] = date.toLocaleDateString().split('/')
  let res: string = `${ds[2]}/${ds[0]}/${ds[1]} `
  return res + date.toLocaleTimeString()
}

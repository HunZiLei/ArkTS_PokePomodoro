import promptAction from '@ohos.promptAction'
import TaskData from '../common/bean/TaskDataDefault'
import CommonConstants from '../common/constants/CommonConsts'
import Logger from '../common/utils/Logger'

@CustomDialog
export struct TaskItemDialog {
  @Link taskItem: TaskData
  @Link dialogIsAddNew: boolean
  controller: CustomDialogController
  confirm: (dialogIsAddNew: boolean, newTask: TaskData) => void

  color_column: string = '#99DBBA'
  color_back: string = '#A1E6C2'
  color_button: string = '#4BAD96'

  private taskName: string
  private taskSubject: number
  private taskDate: Date
  private taskDetailText: string
  private taskDdlDetail: string = '0.3-0.5-0.9'

  @State showedTaskDate: string = ''
  @State showedTaskTime: string = ''
  @State showedTaskDDL: string = '正常'
  @State handlePopup: boolean = false

  @Builder DatePickerMenu() {
    Menu() {
      MenuItem() {
        DatePicker({
          start: new Date('1970-01-01'),
          selected: this.taskDate,
          end: new Date('2100-01-01')
        })
          .onChange((value: DatePickerResult) => {
            Logger.debug(`TaskItemDialog date = ${JSON.stringify(value)}`)
            this.taskDate.setFullYear(value.year, value.month, value.day)
            Logger.debug(`TaskItemDialog res = ${JSON.stringify(this.taskDate)}, str = ${this.taskDate.toLocaleString()}`)
            this.showedTaskDate = getDateString(this.taskDate.getTime())
          })
          .backgroundColor(0xffffff)
      }
    }
  }
  @Builder TimePickerMenu() {
    Menu() {
      MenuItem() {
        TimePicker({
          // start: new Date('1970-01-01'),
          selected: this.taskDate,
          // end: new Date('2100-01-01')
        })
          .onChange((value: TimePickerResult) => {
            Logger.debug(`TaskItemDialog date = ${JSON.stringify(value)}`)
            this.taskDate.setHours(value.hour, value.minute)
            Logger.debug(`TaskItemDialog res = ${JSON.stringify(this.taskDate)}, str = ${this.taskDate.toLocaleString()}`)
            this.showedTaskTime = getTimeString(this.taskDate.getTime())
          })
          .backgroundColor(0xffffff)
          .width('80%')
      }
    }
  }
  @Builder DDLDetailPickerMenu() {
    Menu() {
      ForEach(CommonConstants.DDL_DETAIL_PRESET, (preset) => {
        MenuItem({content: preset.hint})
          .onClick(() => {
            this.taskDdlDetail = preset.detail
            this.showedTaskDDL = preset.hint
          })
      })
    }
    // .fontSize(30)
  }

  aboutToAppear() {
    this.taskName = this.taskItem.task_name
    this.taskSubject = this.taskItem.subject
    this.taskDetailText = this.taskItem.detail
    this.taskDdlDetail = this.taskItem.ddl_detail
    this.taskDate = new Date()
    this.taskDate.setSeconds(0)
    Logger.debug('TaskItemDialog new date = ' + this.taskDate.toLocaleString())
    if (this.taskItem.due_date_stamp) this.taskDate.setTime(this.taskItem.due_date_stamp)
    this.showedTaskDate = getDateString(this.taskDate.getTime())
    this.showedTaskTime = getTimeString(this.taskDate.getTime())
    this.showedTaskDDL = getDDLPresetFromDetail(this.taskDdlDetail)
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
          Text((this.dialogIsAddNew ? '添加' : '修改') + '事项')
            .fontSize(20)
            .alignSelf(ItemAlign.Start)
            .margin({left: 12, bottom: 20})

          TextInput({
            placeholder: '事件名称',
            text: this.taskName
          })
            .onChange((value: string) => {
              this.taskName = value
            })
            .backgroundColor(this.color_column)
            .margin({ bottom: 10 })
            .height(50)
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
          TextArea({ placeholder: '详细信息', text: this.taskDetailText })
            .onChange((value: string) => {
              this.taskDetailText = value
            })
            .height(50 * 3)
          .margin({ bottom: 10 })
          Row(){
            // Text('自定义时间比例')
            //   .margin({right: 5})
            // TextInput({text: this.taskDdlDetail, placeholder: '默认为 0.3-0.5-0.9'})
            //   .onChange((value: string) => {
            //     this.taskDdlDetail = value
            //   })
            //   .width('60%')
            Button('任务紧急程度：' + this.showedTaskDDL)
              .bindMenu(this.DDLDetailPickerMenu)
              .width('60%')
              .margin({ right: 15 })
              .backgroundColor(this.color_column)
              .fontColor('#000000')
            Button({type: ButtonType.Circle}) {
              Image($r('app.media.ic_public_help_filled'))
                .height(25)
                .width(25)
            }
              .onClick(() => {this.handlePopup = !this.handlePopup})
              .height(25)
              .width(25)
              .backgroundColor('#ffffff')
              .bindPopup(this.handlePopup, {
                message: '任务紧急程度会决定指示颜色变化的快慢，任务紧急程度越高，指示颜色越早变红。',
                placementOnTop: true,
                primaryButton: {
                  value: '明白了',
                  action: () => {this.handlePopup = false}
                }
              })
          }
        }.padding({ left: 16, right: 16})
        .margin({ bottom: 20})

        Row() {
          Button('截止日期：' + this.showedTaskDate)
            .bindMenu(this.DatePickerMenu)
            .backgroundColor(this.color_column)
            .fontColor(0x000000)
            .margin({right: 10})

          Button(this.showedTaskTime)
            .bindMenu(this.TimePickerMenu)
            .backgroundColor(this.color_column)
            .fontColor(0x000000)
        }
      }
          // .margin({ bottom: 10 })
        Row() {
          Button('取消')
            .backgroundColor(this.color_button)
            .margin({ right: 10 })
            .onClick(() => {
              this.controller.close()
            })
          Button('保存')
            .backgroundColor(this.color_button)
            .onClick(() => {
              if (this.taskName == '') {
                promptAction.showToast({message: '任务名称不能为空'})
                return
              }
              this.taskItem.subject = this.taskSubject
              this.taskItem.task_name = this.taskName
              this.taskItem.detail = this.taskDetailText
              this.taskItem.due_date_stamp = this.taskDate.getTime()
              if (this.dialogIsAddNew) this.taskItem.start_date_stamp = new Date().getTime()
              this.taskItem.ddl_detail = this.taskDdlDetail
              Logger.debug(`TaskItemDialog ddlDetail = ${this.taskItem.ddl_detail}`)
              // Logger.debug(`TaskItemDialog due_date(stamp): ${this.taskItem.due_date_stamp}, date: ${this.taskDate.toDateString()}`)
              this.confirm(this.dialogIsAddNew, this.taskItem)
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
  Logger.debug(`TaskList: datestamp = ${date_stamp}, time = ${date.toLocaleTimeString()}`)
  return date.toLocaleTimeString()
}

function getDateString(date_stamp: number): string {
  let date: Date = new Date()
  date.setTime(date_stamp)
  Logger.debug(`TaskList: datestamp = ${date_stamp}, date = ${date.toLocaleDateString()}`)
  let ds: string[] = date.toLocaleDateString().split('/')
  let res: string = `${ds[2]}/${ds[0]}/${ds[1]}`
  return res
}

function getDDLPresetFromDetail(detail: string): string {
  for (let i = 0; i < 5; ++i) {
    Logger.debug('getDDL: ' + CommonConstants.DDL_DETAIL_PRESET[i].detail)
    if (CommonConstants.DDL_DETAIL_PRESET[i].detail == detail) return CommonConstants.DDL_DETAIL_PRESET[i].hint
  } return ''
}
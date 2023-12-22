import TaskTable from '../../common/database/TaskTable'
import TaskData from '../../common/bean/TaskDataDefault'
import router from '@ohos.router';
import Logger from '../../common/utils/Logger'
import { TaskItemDialog } from '../../view/TaskItemDialog'
import { TaskItemDialog_ViewOnly } from '../../view/TaskItemDialog_ViewOnly'
import promptAction from '@ohos.promptAction';
import CommonConstants from '../../common/constants/CommonConsts'

@Component

export struct TaskList {
  @State tasks: Array<TaskData> = []
  @State isEditing: boolean = false
  // @State isOnSearch: boolean = false
  @State dialogIsAddNew: boolean = true
  @State taskItem: TaskData = new TaskData()
  // private isDetailAdd: boolean = false
  private firstOpen: boolean = true
  private taskTable: TaskTable = new TaskTable(() => {});
  private dialogSelectedIndex: number = -1

  private deleteTarget: Array<TaskData> = []

  // UI 编辑弹窗 Dialog
  dialogController: CustomDialogController = new CustomDialogController({
    builder: TaskItemDialog({
      dialogIsAddNew: $dialogIsAddNew,
      taskItem: $taskItem,
      confirm: (dialogIsAddNew: boolean, taskItem: TaskData) => {
        if (dialogIsAddNew) {
          this.submitNewTask(taskItem)
        } else {
          this.updateExistingTask(taskItem)
        }
        dialogIsAddNew = true
      }
    }),
    alignment: DialogAlignment.Bottom,
    customStyle: true
  })
  dialogController_view: CustomDialogController = new CustomDialogController({
    builder: TaskItemDialog_ViewOnly({
      taskItem: $taskItem
    }),
    alignment: DialogAlignment.Bottom,
    customStyle: true
  })

  // UI ListItemGroup Header
  @Builder listItemGroupHead(text: string) {
    Text(text)
      .margin(10)
  }

  @Builder TaskList_ListItem(item: TaskData) {
      Row() {
        if (!this.isEditing) {
          Checkbox()
            .select(item.is_completed)
            .onChange((value: boolean) => {
              item.is_completed = value
              this.updateExistingTask(item)
            })
            .margin({ right: 10 })
        }
        Text(item.task_name)
          .textOverflow({overflow: TextOverflow.Ellipsis })
          .maxLines(1)
          .width('60%')
        Blank()
          .layoutWeight(1)
        Row() {
          Text(getTimeString(item.due_date_stamp))
            .margin({right: 10})
          if (!item.is_completed) Button({type: ButtonType.Circle, }) {
            Text(' ')
          }
            .backgroundColor(CommonConstants.DDL_COLOR[item.getDDLState()])
            .height(12)
            .width(12)
        }
        // Blank()
        //   .layoutWeight(1)
        // Text(item.subject.toString())
        if (this.isEditing) {
          Toggle({ type: ToggleType.Checkbox, isOn: false })
            .onChange((isOn: Boolean) => {
              if (isOn) this.deleteTarget.push(item)
              else {
                let this_id_index = this.deleteTarget.indexOf(item)
                this.deleteTarget.splice(this_id_index, 1)
              }
            })
        }
      }.justifyContent(FlexAlign.SpaceBetween)
      .height(56)
      .width('100%')
      .padding({ left: 12, right: 12 })
  }

  // 数据库操作封装
  submitNewTask(taskData: TaskData) {
    this.taskTable.insertData(taskData, (id: number) => {
      taskData.id = id
      taskData.setDDLState()
      this.tasks.push(taskData)
    })
  }
  updateExistingTask(taskData: TaskData) {
    this.taskTable.updateData(taskData, () => {})
    taskData.setDDLState()
    let new_task = this.tasks
    this.tasks = []
    new_task[this.dialogSelectedIndex] = taskData
    // Logger.debug(`TaskList taskData = ${JSON.stringify(taskData)}`)
    this.tasks = new_task // 触发 UI 刷新
    this.dialogSelectedIndex = -1
  }
  deleteSelectedTasks() {
    if (this.deleteTarget.length == 0) return;
    for (let i = 0; i < this.deleteTarget.length; ++i) {
      let target = this.deleteTarget[i]
      this.taskTable.deleteData(target, (ret) => {
        if (ret) {
          let targetIndex = this.tasks.indexOf(target)
          this.tasks.splice(targetIndex, 1)
        }
      })
    }
    this.deleteTarget = []
  }
  querySearchTask(searchVal: string, callback?: Function) {
    // 暂时只写了task_name
    this.taskTable.query(`%${searchVal}%`, (searchRes) => {
      this.tasks = searchRes
      for (let i = 0; i < this.tasks.length; ++i) {
        this.tasks[i].setDDLState()
      }
      Logger.debug(`TaskData = ${JSON.stringify(this.tasks)}`)
      callback()
    }, (searchVal == ''))
  }
  // 数据库操作封装 结束

  // 组件生命周期
  aboutToAppear() {
    Logger.debug(`[TaskList] aboutToAppear`)
    if (this.firstOpen) {
      this.taskTable.getRdbStore(() => {
        this.taskTable.query('', (result: TaskData[]) => {
          this.tasks = result
          for (let i = 0; i < this.tasks.length; ++i) {
            this.tasks[i].setDDLState()
          }
          Logger.debug(`TaskData = ${JSON.stringify(this.tasks)}`)
        }, true)
      })
      this.firstOpen = false
    }
  }
  // 组件生命周期 结束

  // UI
  build() {
    Stack({alignContent: Alignment.Bottom}) {
      Stack({ alignContent: (this.isEditing ? Alignment.Bottom : Alignment.BottomEnd) }) { // 主界面与悬浮按钮叠放
        Column() {
          Navigation() { // UI 标题栏
            // UI 搜索

            if (!this.isEditing) Search()
              // .onClick(() => { this.isOnSearch = true})
              .onSubmit((value: string) => {
                this.querySearchTask(value)
              })
                // .padding({ left: 12, right: 12 })
              .width('90%')

            Column() {
              // UI 待办事项界面
              Scroll() {
                Column() {
                  // UI 待办事项列表
                  Text('未办事项')
                    .fontSize(20)
                    .width('100%')
                    .margin({ bottom: 10, top: 20 })
                    .textAlign(TextAlign.Start)
                    .padding({ left: 12, right: 12 })
                  List() {
                    // 未办事项
                    ForEach(this.tasks, (item: TaskData) => {
                      if (!item.is_completed) ListItem() {
                        this.TaskList_ListItem(item)
                      }.width('100%')
                      .backgroundColor(0x9BDEBB)
                      .onClick(() => {
                        if (this.isEditing) {
                          this.taskItem = item
                          this.dialogIsAddNew = false
                          this.dialogSelectedIndex = this.tasks.indexOf(item)
                          this.dialogController.open()
                        } else {
                          this.taskItem = item
                          this.dialogController_view.open()
                        }
                      })
                    })
                  }
                  .width('100%')
                  .borderRadius(20)
                  .divider({ strokeWidth: 1 })
                  .margin({ bottom: 20 })

                  Text('已办事项')
                    .fontSize(20)
                    .width('100%')
                    .margin({ bottom: 10 })
                    .textAlign(TextAlign.Start)
                    .padding({ left: 12, right: 12 })
                  List() {
                    // 已办事项
                    ForEach(this.tasks, (item: TaskData) => {
                      if (item.is_completed) ListItem() {
                        this.TaskList_ListItem(item)
                      }.width('100%')
                      .backgroundColor(0x9BDEBB)
                      .onClick(() => {
                        if (this.isEditing) {
                          this.taskItem = item
                          this.dialogIsAddNew = false
                          this.dialogSelectedIndex = this.tasks.indexOf(item)
                          this.dialogController.open()
                        } else {
                          this.taskItem = item
                          this.dialogController_view.open()
                        }
                      })
                    })
                  }
                  .width('100%')
                  .borderRadius(24)
                  .divider({ strokeWidth: 1 })
                  Text()
                    .height(60)
                }
                .padding({ left: 12, right: 12, bottom: 10, top: 10 })
                // .height('70%')
                .justifyContent(FlexAlign.Start)
              }.edgeEffect(EdgeEffect.Spring)

            }.height('90%')
            .justifyContent(FlexAlign.SpaceBetween)
          }.titleMode(NavigationTitleMode.Full)
          .title('清单')
          .menus([{
            value: "",
            icon: this.isEditing ? '../../../resources/base/media/ic_public_edit_filled.svg' : '../../../resources/base/media/ic_public_edit.svg',
            action: () => {
              this.deleteTarget = []
              this.isEditing = !this.isEditing
            }
          }])
        }.width('100%')
        .height('100%')

        // UI 右下角的 Fab
        Button({ type: ButtonType.Circle }) {
          if (!this.isEditing)
            Image($r('app.media.addItem'))
          else {
            Image($r('app.media.ic_public_delete'))
              .height(28)
              .width(28)
          }
        }
        .backgroundColor(!this.isEditing ? '#ffffff' : '#E84026')
        .width(60)
        .height(60)
        .margin({ bottom: 20, right: (this.isEditing ? 0 : 20) })
        .onClick(() => {
          if (!this.isEditing) {
            this.dialogIsAddNew = true
            this.taskItem = new TaskData()
            this.dialogController.open()
          } else {
            if (this.deleteTarget.length != 0) {
              this.deleteSelectedTasks()
              this.isEditing = false
            }
          }
        })
      }
      // UI <临时> 提交入口（只剩刷新按钮了）
      if (!this.isEditing) Column() {
        Row() {
          Button('刷新')
            .backgroundColor('#9BDEBB')
            .onClick(() => {
              promptAction.showToast({message: '刷新中'})
              this.querySearchTask('', () => {
                promptAction.showToast({message: '刷新成功'})
              })
            })
        }.justifyContent(FlexAlign.SpaceAround)
        .margin({ top: 30 })
      }.padding({ left: 12, right: 12, bottom: 30 })
    }
  }
}

function getTimeString(date_stamp: number): string {
  let date: Date = new Date()
  date.setTime(date_stamp)
  Logger.debug(`TaskList: datestamp = ${date_stamp}, date = ${date.toLocaleDateString()}`)
  let ds: string[] = date.toLocaleDateString().split('/')
  let res: string = `${ds[2]}/${ds[0]}/${ds[1]}`
  return res
}
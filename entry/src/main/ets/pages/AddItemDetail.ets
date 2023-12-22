import router from '@ohos.router';
import TaskTable from '../common/database/TaskTable'

@Entry
@Component
struct AddItemDetail {
  @State message: string = 'Hello World'
  private add_task_name: string
  private add_task_subject: string

  build() {
    Navigation() {
      TextInput({placeholder: '任务名称'})
        .onChange((value: string) => {
          this.add_task_name = value
        })
      TextInput({placeholder: '所属科目'})
        .onChange((value: string) => {
          this.add_task_subject = value
        })
      Button('添加')
        .onClick(() => {
          router.back({
            url: 'pages/Index',
            params: {
              task_name: this.add_task_name,
              task_subject: this.add_task_subject
            }
          })
        })
    }.titleMode(NavigationTitleMode.Mini)
    .title('添加任务')
  }
}
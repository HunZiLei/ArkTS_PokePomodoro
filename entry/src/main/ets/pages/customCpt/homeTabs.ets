import { TabModel,getTabList} from '../../model/tabModel';
import display from '@ohos.display';
@Component
export struct HomeTabs {
  private listTab = getTabList()
  @State tabIndicatorWidth: number = 152
  @State tabIndex: number = 0
  private tabClick: (item: TabModel) => void

  private aboutToAppear() {
    display.getDefaultDisplay((err, data) => {
      if (!err) {
        this.tabIndicatorWidth = data.width / this.listTab.length
      }
    })
  }

  build() {
    Column(){
      Stack({ alignContent: Alignment.Bottom }) {
        Row() {
          ForEach(this.listTab, item => {
            Button() {
              Text(item.name)
                .fontSize(this.tabIndex == item.id ? 15 : 13)
                .fontColor(this.tabIndex == item.id ? $r('app.color.app_theme') : '#000000')
            }
            .layoutWeight(1)
            .height(35)
            .type(ButtonType.Normal)
            .backgroundColor(Color.White)
            .onClick(() => {
              this.tabIndex = item.id
              this.tabClick(item)
            })
          }, item => item.tabType)
        }.height(35)

        Row() {
          Divider()
            .width(`${this.tabIndicatorWidth}px`)
            .strokeWidth(3)
            .color($r('app.color.app_theme'))
            .lineCap(LineCapStyle.Round)
            .padding({ left: 10, right: 10 })
            .offset({ x: `${this.tabIndex * this.tabIndicatorWidth}px`, y: 0 })
            .animation({ duration: 300 })
        }.width('100%')
      }.backgroundColor(Color.White)
      Divider().color('#e8e8e8')
    }
  }
}
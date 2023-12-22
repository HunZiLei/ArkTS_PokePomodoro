import { Settings } from '../components/IndexTabPages/Settings'
import { TaskList } from '../components/IndexTabPages/TaskList'
import DDLState from '../components/IndexTabPages/DDLState'
import { Pomodoro } from '../components/IndexTabPages/Pomodoro'
import { GameManu } from '../components/IndexTabPages/GameMenu'

@Entry
@Component

struct Index {
  @State message: string = 'Hello World'
  @State currentIndex: number = 0

  @State colorStyle: string = 'blue'
  private controller: TabsController = new TabsController();

  //底边栏
  @Builder TabBuilder(title: Resource, targetIndex: number, selectedImg: Resource, normalImg: Resource) {
    Column() {
      Image(this.currentIndex === targetIndex ? selectedImg : normalImg)
        .size({ width: 25, height: 25 })
        .fillColor(this.currentIndex === targetIndex ? '#47DEA9' : '#6B6B6B')
      Text(title)
        .fontColor(this.currentIndex === targetIndex ? '#47DEA9' : '#6B6B6B')
        .fontSize(12)
    }
    .backgroundColor('#79AD92')
    .width('100%')
    .height(50)
    .justifyContent(FlexAlign.Center)
    .onClick(() => {
      this.currentIndex = targetIndex
      this.controller.changeIndex(targetIndex)
    })
  }
  @Builder TabBuilder_string(title: string, targetIndex: number, selectedImg: Resource, normalImg: Resource) {
    Column() {
      Image(this.currentIndex === targetIndex ? selectedImg : normalImg)
        .size({ width: 25, height: 25 })
        .fillColor(this.currentIndex === targetIndex ? '#47DEA9' : '#6B6B6B')
      Text(title)
        .fontColor(this.currentIndex === targetIndex ? '#47DEA9' : '#6B6B6B')
        .fontSize(12)
    }
    .backgroundColor('#79AD92')
    .width('100%')
    .height(50)
    .justifyContent(FlexAlign.Center)
    .onClick(() => {
      this.currentIndex = targetIndex
      this.controller.changeIndex(targetIndex)
    })
  }

  build() {
    Column() {
      Tabs({ barPosition: BarPosition.End, controller: this.controller }) {
        TabContent() {
          TaskList()
        }.tabBar(this.TabBuilder($r('app.string.tabbot_tasks'), 0, $r('app.media.ic_public_home_filled'), $r('app.media.ic_public_home')))
        TabContent() {
          DDLState()
        }.tabBar(this.TabBuilder($r('app.string.tab_title_ddl_state'), 1, $r('app.media.ic_public_time_filled'), $r('app.media.ic_public_time')))
        TabContent() {
          Settings()
        }.tabBar(this.TabBuilder($r('app.string.TabBottom_Settings'), 2, $r('app.media.ic_public_settings_filled'), $r('app.media.ic_public_settings')))
        TabContent() {
          Pomodoro()
        }.tabBar(this.TabBuilder($r("app.string.tab_title_pomodoro"), 3, $r('app.media.clockIcon'), $r('app.media.clockIcon')));
        TabContent() {
          GameManu()
        }.tabBar(this.TabBuilder_string("休息", 4, $r('app.media.gameIcon_2'), $r('app.media.gameIcon_2')));
      }.onChange((index: number) => {
        this.currentIndex = index
      })
      .scrollable(false)
      .animationDuration(100)
      // .height(50)
      // .width('100%')
    }
    .width('100%')
    .height('100%')
    .backgroundImage(this.currentIndex==4?$r('app.media.gamePage_background'):$r('app.media.miao_wa_zhong_zi'))
    .backgroundImageSize({width:'100%',height:'100%'})
  }

}
import {InfoStorage} from '../../util/InfoStorage';
import router from '@system.router';
import {MenuModel, getMenuList} from '../../model/menuModel';

@Component
export struct SideMenu {
  private listMenu: Array<MenuModel> = getMenuList()
  private closeMenu: () => void
// 头像
  @Link isLogin: boolean
// 本地存储
  private infoStorage = new InfoStorage()

  build() {
    Column() {
      Image(this.isLogin ? $r('app.media.ic_ldd_headpic') : $r('app.media.ic_default_headpic'))
        .width(80)
        .height(80)
        .borderRadius(40)
        .margin({ top: 40 })

      if (this.isLogin) {
        Text('梁迪迪')
          .fontSize(15)
          .padding(5)
      } else {
        Row() {
          Text('登录')
            .fontSize(15)
            .padding(5)
            .onClick(() => {
              router.push({
                uri: 'pages/login'
              })
              this.closeMenu()
            })
          Divider()
            .vertical(true)
            .height(15)
            .strokeWidth(1)
            .color(Color.Black)
          Text('注册')
            .fontSize(15)
            .padding(5)
        }
      }


      Divider()
        .strokeWidth(1)
        .color('#eeeeee')
        .margin({ top: 40 })

      Column() {
        ForEach(this.listMenu, (item: MenuModel) => {
          Button() {
            Row() {
              Image(item.icon)
                .width(23)
                .height(23)

              Text(item.name)
                .fontSize(16)
                .margin({ left: 15 })
            }
            .padding({ left: 40 })
            .width('100%')
          }
          .height(50)
          .type(ButtonType.Normal)
          .backgroundColor(Color.White)
        }, item => item.id.toString())
      }
      .padding({ top: 30, bottom: 30 })

      Blank()

      if(this.isLogin) {
        Button() {
          Text('退出登录')
            .width('100%')
            .textAlign(TextAlign.Center)
            .fontSize(15)
            .fontColor(Color.White)
        }.backgroundColor($r('app.color.app_theme'))
        .height(35)
        .margin({ left: 20, right: 20, bottom: 50 })
      }
    }
    .width('100%')
    .height('100%')
  }
}
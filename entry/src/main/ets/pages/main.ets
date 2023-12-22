import { InfoStorage } from '../util/InfoStorage';
import {SideMenu} from './customCpt/sideMenu';
import display from '@ohos.display';
import {HomePage} from './customCpt/home';

@Entry
@Component
  // @ts-ignore
struct MainPage {
  private listSearch = [
    '中共中央召开党外人士座谈会', '推动构建亚太命运共同体',
    '十九届六中全会精神新闻发布会', '中方邀拜登出席东奥？外交部回应',
    '大连8天215人感染：多为大学生', '胡塞武装突袭美国驻也门大使馆',
    '北交所15日开市 10家企业直接上市', '腾讯与抖音商谈对等开放',
  ]
  // 屏幕宽度
  private screenWidth = 0
  // 侧边栏的x位置
  @State sideBarX: number = -2000
  // 侧边栏背景的透明度
  @State sideBarBgopacity: number = 0
  // 侧边栏背景显示值
  @State sideBarBgVisibility: Visibility = Visibility.Hidden
  // 是否登录
  @State isLogin: boolean = false
  // 本地存储
  private infoStorage = new InfoStorage()

  // 标题栏
  @Builder CustomTitleBar() {
    Row() {
      Image(this.isLogin ? $r('app.media.ic_ldd_headpic') : $r('app.media.ic_default_headpic'))
        .width(30)
        .height(30)
        .borderRadius(15)
        .margin({ right: 10 })
        .onClick(() => {
          this.openSideMenu()
        })

      Row() {
        Image($r('app.media.ic_search'))
          .width(15).height(15)
          .margin({ left: 10 })

        Swiper() {
          ForEach(this.listSearch, item => {
            Text(item)
              .height('100%')
              .fontSize(12)
              .fontColor('#505050')
              .margin({ left: 10 })
          }, item => item)
        }
        .vertical(true)
        .autoPlay(true)
        .indicator(false)
        .interval(3000)
      }
      .layoutWeight(1)
      .height('100%')
      .backgroundColor('#F1F1F1')
      .borderRadius(15)
    }
    .width('100%')
    .height(50)
    .backgroundColor(Color.White)
    .padding({ top: 10, bottom: 10, left: 15, right: 15 })
  }

  private aboutToAppear() {
    display.getDefaultDisplay((err, data) => {
      if (!err) {
        this.screenWidth = data.width
        this.sideBarX = -this.screenWidth
      }
    })
  }

  private onPageShow(){
    this.isLogin = this.infoStorage.getUserId().length != 0
  }


  private openSideMenu() {
    this.sideBarX = 0
    this.sideBarBgopacity = 1
    this.sideBarBgVisibility = Visibility.Visible
  }

  private closeSideMenu() {
    this.sideBarX = -this.screenWidth
    this.sideBarBgopacity = 0
  }

  build() {
    Stack() {
      Column() {
        this.CustomTitleBar()
        Flex(){
          HomePage()
        }
        .zIndex(-1)
      }

      // 半透明背景
      Stack()
        .width('100%')
        .height('100%')
        .backgroundColor('#80000000')
        .opacity(this.sideBarBgopacity)
        .animation({
          duration: 300,
          onFinish:()=>{
            if(this.sideBarBgopacity == 0){
              this.sideBarBgVisibility = Visibility.Hidden
            }
          }
        })
        .visibility(this.sideBarBgVisibility)

      // 侧边栏
      Row() {
        Column() {
          SideMenu({ isLogin: $isLogin, closeMenu: () => {
            this.closeSideMenu()
          } })
        }
        .width('70%')
        .height('100%')
        .backgroundColor(Color.White)

        Blank().onClick(() => {
          this.closeSideMenu()
        })
      }
      .width('100%')
      .height('100%')
      .position({ x: `${this.sideBarX}px`, y: 0 })
      .animation({ duration: 300 })
    }
    .width('100%')
    .height('100%')
  }
}
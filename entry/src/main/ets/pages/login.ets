import { InfoStorage } from '../common/utils/InfoStorage';
import router from '@system.router';
import { LoadingDialog } from './customDialog/loadingDialog';
import {TitleBar} from './customCpt/titleBar';
import prompt from '@system.prompt';

@Entry
@Component
struct Login {
  @State account: string = ''
  @State password: string = ''
  @State isEnableLogin: boolean = false
  // 加载框
  private loadingDialog: CustomDialogController = new CustomDialogController({
    builder: LoadingDialog({hint:'登录中...'}), customStyle: true })

  // 本地存储
  private infoStorage = new InfoStorage()

  @Builder TextInputAccount() {
    TextInput({ placeholder: '请输入账号', text: this.account })
      .type(InputType.Normal)
      .placeholderColor(Color.Gray)
      .placeholderFont({ size: 16, weight: 2 })
      .height(45)
      .onChange((value: string) => {
        this.account = value
        this.isEnableLogin = this.account.length > 0 && this.password.length > 0
      })
  }

  @Builder TextInputPassword() {
    TextInput({ placeholder: '请输入密码', text: this.password })
      .type(InputType.Password)
      .placeholderColor(Color.Gray)
      .placeholderFont({ size: 16, weight: 2 })
      .height(45)
      .onChange((value: string) => {
        this.password = value
        this.isEnableLogin = this.account.length > 0 && this.password.length > 0
      })
  }

  build() {
    Column() {
      TitleBar()

      Flex() {
        Column() {
          Image($r('app.media.ic_login'))
            .width(130).height(60)
            .margin({ top: 50, bottom: 70 })

          this.TextInputAccount()
          Divider()
            .height(10)
            .color(Color.White)
          this.TextInputPassword()

          Button() {
            Text('登录')
              .textAlign(TextAlign.Center)
              .width('100%')
              .fontSize(15)
              .fontColor(Color.White)
          }.height(38)
          .margin({ top: 20 })
          .enabled(this.isEnableLogin)
          .backgroundColor(this.isEnableLogin ? '#8FCDAD' : '#F9A3A1')
          .onClick(()=>{
            this.login()
          })

          Row() {
            Text('账号注册')
              .fontSize(12)
              .padding(10)
            Blank()
            Text('忘记密码？')
              .fontSize(12)
              .padding(10)
          }.width('100%')

          Blank()

          Row() {
            Divider()
              .color('#dfdfdf')
              .layoutWeight(1)
            Text('第三方登录')
              .fontColor(Color.Gray)
              .margin({ left: 15, right: 15 })
              .fontSize(11)
            Divider()
              .color('#dfdfdf')
              .layoutWeight(1)
          }

          Row() {
            Image($r('app.media.ic_weixin'))
              .width(40)
              .height(40)
            Image($r('app.media.ic_weibo'))
              .width(40)
              .height(40)
              .margin(15)
            Image($r('app.media.ic_qq'))
              .width(40)
              .height(40)
          }.margin({ bottom: 50 })
        }
        .height('100%')
      }
      .layoutWeight(1)
      .padding({ left: 40, right: 40 })
    }
    .width('100%')
    .height('100%')
  }

  // 模拟网络登录
  login(){
    this.loadingDialog.open()
    setTimeout(()=>{
      if (this.account == 'ldd' && this.password == '123456') {
        prompt.showToast({message:'登录成功'})
        this.infoStorage.setUserId('000001')
        router.back()
      }else{
        prompt.showToast({message:'登录失败，账户或密码错误！'})
      }
      this.loadingDialog.close()
    },2000)
  }

}
import router from '@ohos.router';
import { NewsData, NewsModel, getTest, getNews, getTips } from '../../model/newsModel';
@Component

@Entry
export struct GameManu {
  swiperController: SwiperController = new SwiperController()
  textTimerController: TextTimerController = new TextTimerController()
  format: string = 'mm:ss.SS'

  newsList: NewsData[] = getNews()
  tipsList: string[] = getTips()
  questionList: string[] = [
    '    在一个国家里，居民要么总是说真话，要么总是说谎话。有两个人，甲和乙，一个是说真话的，另一个是说谎话的。甲说：“我们两个都是说谎话的。”\n请问：甲的陈述是正确的吗？',
    '    有三个箱子，但它们都被错误地标上了一个标签。你只能打开一个箱子，看到里面的物品。\n请问：如果你打开的箱子上的标签是正确的，那么其他两个箱子的标签是正确的吗？',
    '    有三个人，A、B、C，他们生活在不同的时代。A说：“B是未来的人。” B说：“C是过去的人。” C说：“A和B都是过去的人。”\n请问：这三个人的说法是否一致？'
  ]
  @State currTipsIndex: number = 1
  @State currTips: string = ''

  build() {
    Column() {
      Navigation(){
        Column(){
          Text('你知道吗？')
            .fontSize('32vp')
            .margin({bottom:'5vp'})

          Swiper(this.swiperController){
            ForEach(this.tipsList,(item: string)=>{
              Column() {
                Text(item)
                  .fontColor(Color.White)
                  .fontSize('25vp')
                  .textAlign(TextAlign.Center)
              }
              .width('90%')
              .height(160)
            })
          }
          .duration(1000)
          .interval(5020)
          .autoPlay(true)
          .loop(true)
          .cachedCount(2)
          .borderRadius(20)
          .width('95%')

          Row(){
            Image($r('app.media.burry_3'))
              .size({width:'30vp',height:'30vp'})
              .position({x:'90%',y:'35%'})
              .onClick(()=>{
                this.currTipsIndex = (this.currTipsIndex+1)%this.tipsList.length
                console.info('###Click: '+this.currTipsIndex)
              })
          }
        }
        .backgroundImage($r('app.media.gameMenu_miao_wa_zhong_zi'))
        .backgroundImageSize({width:'100%',height:'45%'})
        .size({width:'95%',height:'60%'})

        Column(){
          Text('今日新闻')
            .fontSize('32vp')
            .fontColor(Color.White)
            .margin({right:'150vp',bottom:'5vp'})
          Swiper(this.swiperController){
            ForEach(this.newsList,(item: NewsData)=>{
              Column() {
                Text(item.date)
                  .textAlign(TextAlign.Start)
                  .fontSize('20vp')
                  .fontColor('#A6EDC8')
                  .margin({bottom:'15vp'})
                Text(item.title)
                  .fontColor(Color.White)
                  .fontSize('30vp')
                  .textAlign(TextAlign.Center)
              }
              .onClick(()=>{
                router.pushUrl({
                  url: 'pages/newsWeb', // 目标url
                  params:{
                    url: item.url
                  }
                }, router.RouterMode.Single, (err) => {
                  if (err) {
                    console.error(`###Invoke pushUrl failed, code is ${err.code}, message is ${err.message}`);
                    return;
                  }
                  console.info('###Invoke pushUrl succeeded.');
                });
              })
              .width('90%')
              .height(160)
            })
          }
          .duration(1000)
          .interval(4000)
          .autoPlay(true)
          .loop(true)
          .cachedCount(2)
          .borderRadius(20)
          .width('95%')
        }
        .backgroundImage($r('app.media.gameMenu_newsBackground'))
        .backgroundImageSize({width:'100%',height:'100%'})
        .markAnchor({x:'50%'})
        .position({x:'50%',y:'30%'})

        Column(){
          Swiper(this.swiperController){
            ForEach(this.questionList,(item: string)=>{
              Text(item)
                .fontColor(Color.White)
                .fontSize('20vp')
            })
          }
          .duration(1000)
          .indicator(false)
          .loop(true)
          .cachedCount(2)
          .borderRadius(20)
          .width('95%')
          .height('80%')
          Row(){
            Button({type:ButtonType.Circle}){
              Text('√')
                .fontSize('15vp')
                .fontColor(Color.White)
            }
            .size({width:'40vp',height:'40vp'})
            .backgroundColor(Color.Green)
            .margin({left:'20vp',top:'0vp'})
            .markAnchor({x:'50%'})

            Button({type:ButtonType.Circle}){
              Text('X')
                .fontSize('15vp')
                .fontColor(Color.White)
            }
            .margin({left:'20vp',top:'00vp'})
            .markAnchor({x:'50%'})
            .size({width:'40vp',height:'40vp'})
            .backgroundColor(Color.Red)
          }

        }
        .size({width:'95%',height:'34%'})
        .backgroundImage($r('app.media.gameMenu_gengar'))
        .backgroundImageSize({width:'100%',height:'100%'})
        .markAnchor({x:'50%'})
        .position({x:'50%',y:'64%'})
      }
      .borderColor('#ED165B')
      .title('休息一下')
      .titleMode(NavigationTitleMode.Full)
    }
    .width('100%')
    .height('100%')
  }
}
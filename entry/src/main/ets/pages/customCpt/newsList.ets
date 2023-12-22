import { NewsData } from '../../model/newsModel';

@Component
export struct NewsList {
  // 新闻列表数据
  @Link listNews: Array<NewsData>

  // 单个图片样式
  @Builder ItemSinglePic(item: NewsData){
    Row() {
      Column() {
        Text(item.title)
          .fontSize(14)
          .maxLines(2)
          .textOverflow({ overflow: TextOverflow.Ellipsis })

        Blank()

        Row({ space: 10 }) {
          Text(item.author_name)
            .fontSize(12)
            .fontColor(Color.Gray)

          Text(item.date)
            .fontSize(12)
            .fontColor(Color.Gray)
        }
      }
      .alignItems(HorizontalAlign.Start)
      .layoutWeight(1)
      .height(80)
      .padding({ top: 3, bottom: 3, right: 5 })

      Image(item.thumbnail_pic_s)
        .width(110)
        .height(80)
        .padding('1px')
        .borderRadius(5)
        .borderWidth(1)
        .borderColor('#e6e6e6')
    }
  }

  // 多个图片样式
  @Builder ItemMorePic(item: NewsData){
    Column() {
      Text(item.title)
        .fontSize(14)
        .maxLines(2)
        .textOverflow({ overflow: TextOverflow.Ellipsis })

      Row({ space: 2 }) {
        Image(item.thumbnail_pic_s)
          .width(110)
          .height(80)
          .padding('1px')
          .borderRadius(5)
          .borderWidth(1)
          .borderColor('#e6e6e6')

        if (item.thumbnail_pic_s02 != undefined) {
          Image(item.thumbnail_pic_s02)
            .width(110)
            .height(80)
            .padding('1px')
            .borderRadius(5)
            .borderWidth(1)
            .borderColor('#e6e6e6')
        }

        if (item.thumbnail_pic_s03 != undefined) {
          Image(item.thumbnail_pic_s03)
            .width(110)
            .height(80)
            .padding('1px')
            .borderRadius(5)
            .borderWidth(1)
            .borderColor('#e6e6e6')
        }
      }
      .margin({top:3})

      Row({ space: 10 }) {
        Text(item.author_name)
          .fontSize(12)
          .fontColor(Color.Gray)

        Text(item.date)
          .fontSize(12)
          .fontColor(Color.Gray)
      }.margin({top:3})
    }.alignItems(HorizontalAlign.Start)
    .width('100%')
  }

  build() {
    Column() {
      List() {
        ForEach(this.listNews, (item: NewsData) => {
          ListItem() {
            Column(){
              if (item.thumbnail_pic_s02 == undefined) {
                this.ItemSinglePic(item)
              } else {
                this.ItemMorePic(item)
              }
            }.width('100%')
          }.padding(10)
        }, item => item.uniquekey)
      }
      .divider({ strokeWidth: 1, color: '#f5f5f5' })
      .onAppear(() => {
      })
    }
    .width('100%')
    .height('100%')
  }

}



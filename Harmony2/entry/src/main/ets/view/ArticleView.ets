import mainViewModel from '../viewmodel/MainViewModel';
import ItemData from '../viewmodel/ItemData';
import HeritageHeader from './HeritageDetailView'
import {Article} from '../viewmodel/ArticleData'
@Component
export default struct ArticleView {
  @State message: string = 'Hello World'
  @State isLike: Boolean = false
  private scroller:Scroller = new Scroller()
  @Prop articleId: string
  private introText: string
  @Prop articleType: number
  @State article: Article = null
  aboutToAppear(){
    if(this.articleType===0){
        this.introText = '美食介绍'
    }else if(this.articleType===4){
      this.introText = '文化介绍'
    }
    else if(this.articleType===8){
      this.introText = '酒店介绍'
    }
    //this.article = mainViewModel.getArticleById(this.articleId)
    this.article = {
      id: "5b45bc90787749f7870306752982814c",
      title: "火灯节",
      content: "<p>啊单位我单位发热反而反而</p>",
      contentUrl: 'https://qiniu.cdn.zhiliaotang.cn/0bc55cb7418e46adabaf6896e0060dd7.jpg',
      type: 4,
      status: 0,
      readNum: 0,
      collNum: 0,
      shareNum: 0,
      likeNum: 0,
      popular: 0,
      popType: null,
      touType: null,
      createUser: null,
      createDate: "2023-12-16T10:39:39",
      modifyUser: null,
      modifyDate: "2023-12-16T11:47:01",
      hotelId: null,
      levelStar: null,
      artSort: null,
      subtitle: null,
      openTime: "10:39:39-10:39:39",
      position: "洋渡村12号",
      posDes: "105.59,30.56",
      reserTell: null,
      hotelLabels: null,
      foodType: null,
      specialProduct: null,
      specialPrice: null,
      reserType: null,
      heritageType: "1",
      heritageTime: "每年四月",
      notice: null,
      tips: null,
      tickets: null,
      belongType: null,
      recAddr: null,
      specFrom: null,
      madeBy: null,
      national: '1',
      activityUrl: null,
      activitySkip: null
    }
    console.log(JSON.stringify(this.article.national))
  }
  build() {
    Column(){
      Scroll() {
        Column() {
          Row(){
            Image($r('app.media.left'))
              .width(30)
              .margin(10)
          }
          .width('100%')
          //.backgroundColor(Color.Gray)
          .backgroundImage($r('app.media.test'))
          .backgroundImageSize(ImageSize.Cover)
          .height(200)
          .alignItems(VerticalAlign.Top)
          .justifyContent(FlexAlign.Start)

          Column() {
            Row() {
              if(this.articleType===4){
                HeritageHeader({title:this.article.title, national:this.article.national, pos:this.article.position})
              }

            }
            .width('95%')
            .height(100)
            .backgroundColor(0xf5f3f3)
            .opacity(0.9)
            .backgroundBlurStyle(BlurStyle.Thin )
            .backdropBlur(10)
            .justifyContent(FlexAlign.Start)
            .borderRadius(8)
            .alignItems(VerticalAlign.Top)
            .margin({top: -20})
          }
          Row() {
            Image($r('app.media.hot'))
              .width('25vp')

            Text(this.introText)
              .fontSize('20%')
              .fontWeight(FontWeight.Bold)
          }
          .alignItems(VerticalAlign.Center)
          .width('100%')
          .margin({top:10})
          Row(){
            //RichText('<p>这是文章<p>') 这个语句无法preview
            Text('这是文章')
          }.width('100%')

          Row() {
            Image($r('app.media.hot'))
              .width('25vp')

            Text('推荐')
              .fontSize('20%')
              .fontWeight(FontWeight.Bold)
              .margin({ top: $r('app.float.home_text_margin') })
          }
          .width('100%')
          List() {
            ForEach(mainViewModel.getSecondGridData(), (item: ItemData) => {
              ListItem() {
                Column() {
                  Image(item.img)
                    .width('100%')
                    .height('90%')
                  Text(item.title)
                    .fontSize($r('app.float.little_text_size'))
                    .margin({ top: $r('app.float.home_homeCell_margin') })
                }
              }
              .height('200vp')
            }, (item: ItemData) => JSON.stringify(item))
          }
          .lanes(2)
          //.columnsTemplate('1fr 1fr')
          //.columnsGap($r('app.float.home_grid_columnsGap'))
          //.rowsGap('12vp')
          //.height('50%')
          // .padding({ top: $r('app.float.home_grid_padding'), bottom: $r('app.float.home_grid_padding') })
          .backgroundColor(Color.White)
          //.borderRadius($r('app.float.home_grid_borderRadius'))


        }
        .width('100%')
        //.height('100%')
      }
      .height('95%')
      Row(){
        Row(){
          Image(this.isLike? $r('app.media.star_selected') :$r('app.media.star_normal'))
            .width('20')
            .onClick(()=>{
              this.isLike = !this.isLike
              console.log(this.isLike ?'1':'2')
            })
          Text('1')
        }.height('100%')
        .justifyContent(FlexAlign.Start)
        .margin({left:20})
        Row(){
          Image($r('app.media.share'))
            .width('20')
            .objectFit(ImageFit.Auto)
        }.height('100%')
        .margin({right:20})
      }
      .justifyContent(FlexAlign.SpaceBetween)
      .height('5%')
      .width('100%')
    }

  }
}

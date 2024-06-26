import mainViewModel from '../viewmodel/MainViewModel';
import ItemData from '../viewmodel/ItemData';
import HeritageHeader from './HeritageDetailView'
import FoodHeader from './FoodDetailView'


import ArticleViewModel from '../viewmodel/ArticleViewModel'
import {Article} from '../viewmodel/ArticleData'
import router from '@ohos.router'

@Component
export default struct ArticleView {
  @State message: string = 'Hello World'
  @State isLike: number = 0 // 这里如果使用boolean 出现不刷新的bug
  @State likeNum: number = 0
  private scroller:Scroller = new Scroller()
  @Prop articleId: string
  private introText: string
  @Prop articleType: number
  @State article: Article = null
  @State isLoading: boolean = true
  aboutToAppear(){
    if(this.articleType===0){
        this.introText = '美食介绍'
    }else if(this.articleType===4){
      this.introText = '文化介绍'
    }
    else if(this.articleType===8){
      this.introText = '酒店介绍'
    }
    this.getArticle()


  }
  async getArticle(){
    this.article = await ArticleViewModel.getArticleById(this.articleId)
    if (this.article == null){
      this.isLoading = true
    }
    this.isLoading = false
    this.likeNum = this.article.likeNum
  }
  async likeArticle(){
    if(this.isLike===0){
      this.isLike = 1
      this.likeNum +=1
      await ArticleViewModel.addArticleLike(this.articleId,1)
    }else{
      this.isLike = 0
      this.likeNum -=1
      await ArticleViewModel.addArticleLike(this.articleId,-1)
    }
  }
  build() {
    Column(){
      Scroll() {
        Column() {
          if(this.isLoading){
            Row(){
              Image($r('app.media.left'))
                .width(30)
                .margin(10)
                .onClick(()=>{
                  router.back()
                })
            }
            .width('100%')
            .backgroundColor(Color.White)
            // .backgroundImage($r('app.media.test'))
            // .backgroundImageSize(ImageSize.Cover)
            .height(200)
            .alignItems(VerticalAlign.Top)
            .justifyContent(FlexAlign.Start)
          }else{
            Row(){
              Image($r('app.media.left'))
                .width(30)
                .margin(10)
                .onClick(()=>{
                  router.back()
                })
            }.width('100%')
            //.backgroundColor(Color.Gray)
            .backgroundImage(this.article.contentUrl)
            .backgroundImageSize(ImageSize.Cover)
            .height(200)
            .alignItems(VerticalAlign.Top)
            .justifyContent(FlexAlign.Start)
          }


          Column() {
            Row() {
              if(!this.isLoading){
                if(this.articleType===4){
                  HeritageHeader({title:this.article.title, national:this.article.national?'1':'2', pos:this.article.position?this.article.position:'1'})
                }else if(this.articleType===0){
                  FoodHeader({title:this.article.title, recAddr:this.article.recAddr?this.article.recAddr:' '})
                }
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
            if(!this.isLoading){
              RichText(this.article.content.toString())
            }

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
      // 定义一个Row组件，用于展示文章的点赞和分享功能
      Row(){
        // 展示点赞图标和数量
        Row(){
          // 根据isLike的状态，选择显示不同的点赞图标
          Image(this.isLike? $r('app.media.star_selected') :$r('app.media.star_normal'))
            .width('20')
              // 点击图片时，触发likeArticle方法
            .onClick(()=>{
              this.likeArticle()
            })
          // 显示当前文章的点赞数
          Text(this.isLoading?'1':this.likeNum.toString())
        }
        // 设置行的高度和内容对齐方式
        .height('100%')
        .justifyContent(FlexAlign.Start)
        .margin({left:20})
        // 展示分享图标
        Row(){
          Image($r('app.media.share'))
            .width('20')
              // 设置图片自适应
            .objectFit(ImageFit.Auto)
        }
        // 设置行的高度和右侧边距
        .height('100%')
        .margin({right:20})
      }
      // 设置行内元素的水平分布方式，设置行的高度和宽度
      .justifyContent(FlexAlign.SpaceBetween)
      .height('5%')
      .width('100%')

    }

  }
}

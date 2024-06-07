@Component
export default struct Home {
  private swiperController: SwiperController = new SwiperController();
  @Builder
  imageButton(src: Resource) {
    Button({ type: ButtonType.Circle, stateEffect: true }) {
      Image(src)
    }
    .height($r('app.float.other_login_image_size'))
    .width($r('app.float.other_login_image_size'))
    .backgroundColor(Color.White)
  }
  @Builder
  homeCell(src: Resource, title: string) {
    Column() {
      Image(src)
        .width($r('app.float.home_homeCell_size'))
        .height($r('app.float.home_homeCell_size'))
      Text(title)
        .fontSize($r('app.float.little_text_size'))
        .margin({ top: $r('app.float.home_homeCell_margin') })
    }
    .justifyContent(FlexAlign.Center)
    .height($r('app.float.home_homeCell_height'))
  }
  build(){
    Scroll(){
      Column() {
        // 开头图片
        Image($r('app.media.fig2'))
          .margin({top: 10})
          //.height('30%')
          .width('100%')
          .margin({top:20})
        // 宫格
        Grid() {
          GridItem(){
            this.homeCell($r('app.media.found'), '123')
          }
          GridItem(){
            this.homeCell($r('app.media.found'), '123')
          }
          GridItem(){
            this.homeCell($r('app.media.found'), '123')
          }
        }
        .columnsTemplate('1fr 1fr 1fr 1fr')
        .rowsTemplate('1fr 1fr')
        .columnsGap($r('app.float.home_grid_columnsGap'))
        .rowsGap($r('app.float.home_grid_rowGap'))
        .padding({ top: $r('app.float.home_grid_padding'), bottom: $r('app.float.home_grid_padding') })
        .height($r('app.float.home_grid_height'))
        .backgroundColor(Color.White)
        .borderRadius($r('app.float.home_grid_borderRadius'))

        // 热门活动
        Row(){
            Row(){
              Image($r('app.media.hot'))
                .height('20')
              Text('热门活动')
                .fontColor(Color.Black)
                .fontSize('15')
            }.justifyContent(FlexAlign.Start)

            Row(){
              Text('更多')
                .fontColor(Color.Black)
                .fontSize('15')
              Image($r('app.media.right_grey'))
                .height('20')
            }.justifyContent(FlexAlign.End)
        }
        .height('30')
        .width('100%')
        .backgroundColor('Color.White')
        .justifyContent(FlexAlign.SpaceBetween)

        // 轮播图
        Swiper(this.swiperController) {
          Image($r('app.media.fig3'))
          Image($r('app.media.fig3'))
          Image($r('app.media.fig3'))
        }.margin({ top: $r('app.float.home_swiper_margin') })
        //.height('20%')
        .width('100%')
        .autoPlay(true)
        .borderRadius($r('app.float.home_grid_borderRadius'))

        // 游玩咨询
        Row(){
          Row(){
            Image($r('app.media.play'))
              .height('20')
            Text('游玩咨询')
              .fontColor(Color.Black)
              .fontSize('15')
              .margin({left: 1})
          }.justifyContent(FlexAlign.Start)
        }
        .height('30')
        .width('100%')
        .margin({top: 20})
        .backgroundColor('Color.White')
        .justifyContent(FlexAlign.SpaceBetween)

        // 视频
        Image($r('app.media.fig2'))
          .margin({top: 10})
          .width('100%')
          //.height('20%')
        // 宣传图
        Image($r('app.media.fig2'))
          .margin({top: 10})
          .width('100%')
          //.height('20%')

        // 图文栏
        Column({space:20}){
          Row({space: 10}){
            Column(){
              Row(){
                Text('这是图标')
              }
              .alignItems(VerticalAlign.Bottom)
              .justifyContent(FlexAlign.End)
              .backgroundImage($r('app.media.mountain'))
              .backgroundImageSize(ImageSize.Cover)
              .width('100%')
              .height('30%')
              Text('这是文字')
            }
            .justifyContent(FlexAlign.Center)
            .width('50%')

            Column(){
              Row(){
                Text('这是图标')
              }
              .alignItems(VerticalAlign.Bottom)
              .justifyContent(FlexAlign.End)
              .backgroundImage($r('app.media.mountain'))
              .backgroundImageSize(ImageSize.Cover)
              .width('100%')
              .height('30%')
              Text('这是文字')
            }
            .width('50%')
          }
          .justifyContent(FlexAlign.SpaceBetween)
          .width('100%')

          Row({space: 10}){
            Column(){
              Row(){
                Text('这是图标')
              }
              .alignItems(VerticalAlign.Bottom)
              .justifyContent(FlexAlign.End)
              .backgroundImage($r('app.media.mountain'))
              .backgroundImageSize(ImageSize.Cover)
              .width('100%')
              .height('30%')
              Text('这是文字')
            }
            .width('50%')

            Column(){
              Row(){
                Text('这是图标')
              }
              .alignItems(VerticalAlign.Bottom)
              .justifyContent(FlexAlign.End)
              .backgroundImage($r('app.media.mountain'))
              .backgroundImageSize(ImageSize.Cover)
              .width('100%')
              .height('30%')
              Text('这是文字')
            }
            .width('50%')
          }
          .justifyContent(FlexAlign.SpaceBetween)
          .width('100%')
        }
        .margin({top: 30})
      }
      .backgroundColor(Color.White)
      .height('auto')
      .alignItems(HorizontalAlign.Start)
    }
    .height('100%')
  }
}
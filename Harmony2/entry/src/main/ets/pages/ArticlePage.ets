@Entry
@Component
struct ArticlePage {
  @State message: string = 'Hello World'

  build() {
    Row() {
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
            Text('标题')
              .fontSize(20)
              .fontColor(Color.Black)
              .fontWeight(FontWeight.Bold)
              .margin({ left: 10,top:20 })
          }
          .width('95%')
          .height(100)
          //.backgroundColor(Color.White)
          //.backgroundBlurStyle(BlurStyle.Thin )
          .backdropBlur(20)
          .justifyContent(FlexAlign.Start)
          .borderRadius(8)
          .alignItems(VerticalAlign.Top)
          .margin({top: -20})
        }
      }
      .width('100%')
      .height('100%')
    }
    .justifyContent(FlexAlign.Start)
    .height('100%')
  }
}
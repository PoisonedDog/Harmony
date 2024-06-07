class itemdata{
  img:Resource;
  title:string;
  type:string
}

@Component
export default struct FoodList {
  @State message: string = 'Hello World'

  build() {
    Scroll(){


      Column(){
        Column() {
          Row(){
              Image($r("app.media.test"))
                .height(150)
                .width('100%')
            }

          Row(){
              Text("中国烧饼")
                .width("90%")
                .fontSize(20)
                .fontWeight(FontWeight.Bold)
                .margin({top:10})
                .backgroundColor("#FFFFFF")
            }
        }
        .clip(true)
        .borderRadius(20)
        .shadow({
          radius: 10,
          color: `rgba(0,0,0,0.3)`,
          offsetY:10,
          offsetX:10
        })
        .margin({top:30})
        .height(200)
        .width("90%")

        Column() {
          Row(){
            Image($r("app.media.test"))
              .height(150)
              .width('100%')
          }

          Row(){
            Text("中国烧饼")
              .width("90%")
              .fontSize(20)
              .fontWeight(FontWeight.Bold)
              .margin({top:10})
              .backgroundColor("#FFFFFF")
          }
        }
        .clip(true)
        .borderRadius(20)
        .shadow({
          radius: 10,
          color: `rgba(0,0,0,0.3)`,
          offsetY:10,
          offsetX:10
        })
        .margin({top:30})
        .height(200)
        .width("90%")

        Column() {
          Row(){
            Image($r("app.media.test"))
              .height(150)
              .width('100%')
          }

          Row(){
            Text("中国烧饼")
              .width("90%")
              .fontSize(20)
              .fontWeight(FontWeight.Bold)
              .margin({top:10})
              .backgroundColor("#FFFFFF")
          }
        }
        .clip(true)
        .borderRadius(20)
        .shadow({
          radius: 10,
          color: `rgba(0,0,0,0.3)`,
          offsetY:10,
          offsetX:10
        })
        .margin({top:30})
        .height(200)
        .width("90%")

        Column() {
          Row(){
            Image($r("app.media.test"))
              .height(150)
              .width('100%')
          }

          Row(){
            Text("中国烧饼")
              .width("90%")
              .fontSize(20)
              .fontWeight(FontWeight.Bold)
              .margin({top:10})
              .backgroundColor("#FFFFFF")
          }
        }
        .clip(true)
        .borderRadius(20)
        .shadow({
          radius: 10,
          color: `rgba(0,0,0,0.3)`,
          offsetY:10,
          offsetX:10
        })
        .margin({top:30})
        .height(200)
        .width("90%")




      }.width('100%')

    }
    .height("100%")

  }
}
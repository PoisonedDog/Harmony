import FoodList from "../pages/FoodList"

@Entry
@Component
struct Index {
  @State currentIndex: number = 0
  @State fontColor: string = '#182431'
  @State selectedFontColor: string = '#007DFF'
  private controller: TabsController = new TabsController()

  @Builder TabBuilder(index: number, name: string) {
    Column() {
      Text(name)
        .fontColor(this.currentIndex === index ? this.selectedFontColor : this.fontColor)
        .fontSize(14)
        .fontWeight(this.currentIndex === index ? 500 : 400)
        .lineHeight(0)
        .margin({ top: 15, bottom: 0 })
      Divider()
        .strokeWidth(2)
        .color('#007DFF')
        .opacity(this.currentIndex === index ? 1 : 0)
    }.width('100%')
  }


  build() {
    Column(){
      Column(){
        Text("地道美食")
          .margin({top:20,right:250})
          .fontColor(Color.White)
          .fontWeight(FontWeight.Normal)
      }
      .backgroundColor('#00CB87')
      .width("100%")
      .height(50)
      Row(){
        TextInput({ placeholder: '搜索'})
          .placeholderColor(Color.Grey)
          .placeholderFont({ size: 14, weight: 400 })
          .caretColor(Color.Blue)
          .borderRadius(1)
          .width(400)
          .height(40)
          .margin(10)
          .fontSize(14)
          .fontColor(Color.Black)
          .width("70%")
        Button("搜索",{type:ButtonType.Normal})
          .borderRadius(7)
          .width(60)
          .height(35)
          .backgroundColor('#00CB87')
      }
      Scroll(){
        Tabs({ barPosition: BarPosition.Start, controller: this.controller }) {
          TabContent() {
            FoodList()
          }.tabBar(this.TabBuilder(0, '全部'))

          TabContent() {
            Column().width('100%').height('100%').backgroundColor('#007DFF')
          }.tabBar(this.TabBuilder(1, '遂宁必吃榜单'))

          TabContent() {
            Column().width('100%').height('100%').backgroundColor('#FFBF00')
          }.tabBar(this.TabBuilder(2, '天府旅游美食'))

        }
        .vertical(false)
        .barMode(BarMode.Fixed)
        .barWidth("100%")
        .barHeight(40)
        .animationDuration(400)
        .onChange((index: number) => {
          this.currentIndex = index
        })
        .width("100%")
        .height("80%")
        .margin({ top: 0 })
        // .backgroundColor('#F1F3F5')
      }
    }.height("100%")

  }
}
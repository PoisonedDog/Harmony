import FoodList from "../view/FoodView"

@Entry
@Component
struct FoodPage {
  @State message: string = ''
  currentIndex:number =0
  private scroller: Scroller = new Scroller()
  @Provide('searchText') searchText: string = ''
  build() {
    Column() {
      Column() {
        Row(){
          Row(){
            Image($r('app.media.left'))
              .height('50%')
              .alignSelf(ItemAlign.Center)
          }.width('10%')
          Row(){
            Text('地道美食')
              .fontSize(20)
              .fontColor(Color.White)
              .margin({left:'-10%'})
          }.width('90%').justifyContent(FlexAlign.Center)

            //.alignSelf(ItemAlign.Center)
        }
        .width('100%')
        .height('50')
        .backgroundColor(0x00CB87)
        //.justifyContent(FlexAlign.SpaceBetween)
        //.alignItems(VerticalAlign.Center)
        // 搜索框
        Row({space: 20}){
          Row(){
            Image($r("app.media.search"))
              .width('25')
              .margin({left: 10})
            TextInput()
              .backgroundColor(0xe6e6e6)
              .borderRadius(7)
              .onChange((value: string) => {
                this.message = value
              })
          }
          .backgroundColor(0xe6e6e6)
          .borderRadius(7)
          .width("65%")
          .margin({left: 10})
          Button('搜索',{type: ButtonType.Normal, stateEffect: true})
            .borderRadius(10)
            .margin({right:10})
            .backgroundColor(0x8bdabd)
            .onClick(()=>{
              this.searchText =this.message
            })
        }
        .width('100%')
        .backgroundColor(0xeef7f2)
        .justifyContent(FlexAlign.SpaceBetween)
        .margin({top: 10})

        // 组件4

        FoodView()
        //Cul_venue()
      }
      .width('100%')
      .flexGrow(1)
    }
    .width('100%')
    .height('100%')
  }
}

@Component
struct FoodView {
  private tabsController: TabsController = new TabsController();
  @State currentTabIndex: number = 0;
  @State fontColor: string = '#182431'
  @State selectedFontColor: string = '#007DFF'
  private controller: TabsController = new TabsController()

  @Builder TabBuilder(index: number, name: string) {
    Column() {
      Text(name)
        //.fontColor(this.currentIndex === index ? this.selectedFontColor : this.fontColor)
        .fontSize(14)
        .fontWeight(this.currentTabIndex === index ? 800 : 400)
        .lineHeight(0)
        .margin({ top: 15, bottom: 0 })
      Divider()
        .strokeWidth(2)
        .color('#00CB87')
        .opacity(this.currentTabIndex === index ? 1 : 0)
    }.width('100%')
  }
  build(){
    Scroll(){
      Tabs({ barPosition: BarPosition.Start, controller: this.controller }) {
        TabContent() {
          FoodList({type:0, currentTabIndex:this.currentTabIndex})
            .height('100%')
        }.tabBar(this.TabBuilder(0, '全部'))

        TabContent() {
          FoodList({type:1, currentTabIndex:this.currentTabIndex})
            .height('100%')
        }.tabBar(this.TabBuilder(1, '遂宁必吃榜单'))

        TabContent() {
          FoodList({type:2, currentTabIndex:this.currentTabIndex,})
            .height('100%')
        }.tabBar(this.TabBuilder(2, '天府旅游美食'))

      }
      .vertical(false)
      .barMode(BarMode.Fixed)
      .barWidth("100%")
      .barHeight(40)
      .animationDuration(400)
      .onChange((index: number) => {
        this.currentTabIndex = index
      })
      .width("100%")
      .height("80%")
      .margin({ top: 0 })
      // .backgroundColor('#F1F3F5')
    }

        //.height('100%')

  }
}


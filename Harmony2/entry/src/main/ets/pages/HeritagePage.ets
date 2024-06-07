import HeritageList from "../view/HeritageView"

@Entry
@Component
struct HeritagePage {
  @State message: string = 'Hello World'
  currentIndex:number =0
  private scroller: Scroller = new Scroller()

  build() {
    Column() {
      Column() {
        Row(){
          Image($r('app.media.left'))
            .height('50%')
            .alignSelf(ItemAlign.Center)
          Text('文化遗产')
            .fontSize(20)
            .fontColor(Color.White)
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
          }
          .backgroundColor(0xe6e6e6)
          .borderRadius(7)
          .width("65%")
          .margin({left: 10})
          Button('搜索',{type: ButtonType.Normal, stateEffect: true})
            .borderRadius(10)
            .margin({right:10})
            .backgroundColor(0x8bdabd)
        }
        .width('100%')
        .backgroundColor(0xeef7f2)
        .justifyContent(FlexAlign.SpaceBetween)
        .margin({top: 10})

        // 组件4

        HeritageView()
        //Cul_venue()
      }
      .width('100%')
      .flexGrow(1)
    }
    .height('100%')
  }
}

@Component
struct HeritageView {
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
          HeritageList({type:0, currentTabIndex:this.currentTabIndex})
            .height('100%')
        }.tabBar(this.TabBuilder(0, '全部'))

        TabContent() {
          HeritageList({type:1, currentTabIndex:this.currentTabIndex})
            .height('100%')
        }.tabBar(this.TabBuilder(1, '国保文物'))

        TabContent() {
          HeritageList({type:2, currentTabIndex:this.currentTabIndex})
            .height('100%')
        }.tabBar(this.TabBuilder(2, '非遗项目'))

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


import Home from '../view/Home'
@Entry
@Component
struct MainPage {
  @State message: string = 'Hello World'
  @State currentIndex: number = 0;
  private tabsController: TabsController = new TabsController();

  @Builder TabBuilder(title: string, index: number, selectedImg: Resource, normalImg: Resource) {
    Column() {
      Image(this.currentIndex === index ? selectedImg : normalImg)
        .width($r('app.float.mainPage_baseTab_size'))
        .height($r('app.float.mainPage_baseTab_size'))
      Text(title)
        .margin({ top: $r('app.float.mainPage_baseTab_top') })
        .fontSize($r('app.float.main_tab_fontSize'))
        .fontColor(this.currentIndex === index ? Color.Black : Color.Grey)
    }
    .justifyContent(FlexAlign.Center)
    .height($r('app.float.mainPage_barHeight'))
    .width('100%')
    .onClick(() => {
      this.currentIndex = index;
      this.tabsController.changeIndex(this.currentIndex);
    })
  }
  build() {
    Tabs({
      barPosition: BarPosition.End,
      controller: this.tabsController
    }) {
      TabContent() {
        Home()
      }
      .padding({left: 10, right: 10 })
      .backgroundColor($r('app.color.mainPage_backgroundColor'))
      .tabBar(this.TabBuilder('首页',0,$r('app.media.home_selected'), $r('app.media.home_normal')))

      TabContent() {
        Text("商城")
      }
      .padding({left: 10, right: 10 })
      .backgroundColor($r('app.color.mainPage_backgroundColor'))
      .tabBar(this.TabBuilder('商城',1,$r('app.media.mail_selected'), $r('app.media.mail_normal')))

      TabContent() {
        Text("我的")
      }
      .padding({left: 10, right: 10 })
      .backgroundColor($r('app.color.mainPage_backgroundColor'))
      .tabBar(this.TabBuilder('我的',2,$r('app.media.mine_selected'), $r('app.media.mine_normal')))
    }
    .height('100%')

  }
}
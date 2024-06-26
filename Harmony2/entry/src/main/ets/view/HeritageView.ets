import  HeritageViewModel,{Heritage}  from '../viewmodel/HeritageViewModel'
import router from '@ohos.router';
@Component
export default struct HeritageList {
  @State heritageList: Array<Heritage> = []
  //@State visibleMask: Array<number> = []
  @State isLoading: boolean = true
  private scroller: Scroller = new Scroller();
  private currentOffsetY: number = 0;
  private timer: number = 0;
  @State refreshStatus: boolean = false;
  @State upRefreshStatus: boolean = false;
  @Prop type:number
  @Consume('searchText') @Watch('OnSearch')
  searchText: string
  @Prop @Watch('OnRefresh')
  currentTabIndex: number
  async OnRefresh() {
    if(this.currentTabIndex === this.type)
    try {
      const data = await HeritageViewModel.getHeritageByType(this.type);
      this.heritageList = data;
    } catch (error) {
      console.error('Error fetching data:', error);
    } finally {
      console.log('Data fetched')
      this.isLoading = false;
      //this.visibleMask = this.visibleMask.length==0 ? new Array(this.heritageList.length).fill(0): this.visibleMask.fill(0)
      this.OnSearch()
    }
  }
  OnSearch() {
    //console.log(this.searchText)
    for(let i = 0;i<this.heritageList.length;i++){
      let heritage = this.heritageList[i]
      if(heritage.name.includes(this.searchText)){
        heritage.status = heritage.status==1? 1 : 0
        this.heritageList.splice(i,1,heritage)
      }else{
        heritage.status = heritage.status==1? 1 : 2
        this.heritageList.splice(i,1,heritage)
      }
    }
  }
  aboutToAppear(){
    this.OnRefresh()
    this.timer = null
  }

  putDownRefresh(event?: TouchEvent): void {
    if (event === undefined) {
      return;
    }
    console.log(JSON.stringify(event.type))
    switch (event.type) {
      case TouchType.Down:
        this.currentOffsetY = event.touches[0].y;
        break;
      case TouchType.Move:
        if (this.scroller.currentOffset().yOffset < 50) {
          this.refreshStatus = event.touches[0].y - this.currentOffsetY > 50;
        }
        this.upRefreshStatus = event.touches[0].y - this.currentOffsetY < -50;
        break;
      case TouchType.Cancel:
        break;
      case TouchType.Up:
      // Only simulation effect, no data request
        this.timer = setTimeout(() => {
          if (this.upRefreshStatus) {
            this.scroller.scrollTo({ // 调用scrollTo滚动到具体位置
              xOffset: 0, // 竖直方向滚动，该值不起作用
              yOffset: 680, // 滚动到底部
              animation: { // 滚动动画
                duration: 1500,
                curve: Curve.EaseOut
              }
            })
          }
          this.refreshStatus = false;
          this.upRefreshStatus = false;
        }, 1500);
        break;
    }
    if(this.refreshStatus){
      this.OnRefresh()
    }
    if(this.upRefreshStatus){
     //加载更多
    }
  }

  @Builder upDownRefreshBuilder(text: string, state: string) {
    Row() {
      Image($r('app.media.refresh'))
        .width(32)
        .height(32)
      Text(text).fontSize(16)
    }
    .justifyContent(FlexAlign.Center)
    .alignItems(VerticalAlign.Top)
    .width('94%')
    .height('8%')
  }

  build() {

      Column({ space: 15 }) {
        if (this.isLoading) {
          Text('加载中...');
        } else {

          List({scroller:this.scroller}){
            if(this.refreshStatus) {
              this.upDownRefreshBuilder('正在刷新', 'down')
            }
            ForEach(this.heritageList, (heritage) => {
              if(heritage.status==0){
                ListItem(){
                  Column(){
                    HeritageItem({
                      heritage_id: heritage.id,
                      name: heritage.name,
                      national: heritage.national,
                      pos: heritage.pos,
                      imageURL: heritage.imageURL
                    })
                      .margin({ bottom: 10 })
                    Divider().strokeWidth(2).color('#F1F3F5').margin({ top: -5 })
                  }
                }
              }


            });

            if(this.upRefreshStatus) {
              this.upDownRefreshBuilder('正在加载', 'up')
            }
          }
          .onTouch((event: TouchEvent) => {
            this.putDownRefresh(event)
          })
          .edgeEffect(EdgeEffect.Spring)


          }


      }

    }


}

@Component
struct HeritageItem{
  @Prop heritage_id:string;
  @Prop national: string;
  @Prop name: string;
  @Prop pos: string;
  @Prop imageURL: string;

  toPage(){
    console.log('heritage_id: ' + this.heritage_id)
    // 路由
    router.pushUrl({
      url: 'pages/HeritageDetailPage',
      params: {
        heritage_id: this.heritage_id
      }
    })
  }
  build(){
      Row({ space: 15 }) {
        Column() {
          Image(this.imageURL)
            .width('30%')
            .margin({ left: 10})
            .borderRadius(5)
            .onClick(()=>{
              this.toPage()
            })
        }
        Column({ space: 10 }) {
          Text(this.name)
            .fontSize(18)
            .fontWeight(FontWeight.Bold)
            .margin(2)
            .onClick(()=>{
              this.toPage()
            })
          Row() {
            Text(`归属地: ${this.pos}`)
              .fontSize(14)
              .fontColor(Color.Grey)

            Image($r('app.media.location'))
              .height('20')
          }

          Text(`级别: ${this.national == '1' ? '国家级' : '省级'}`)
            .fontSize(14)
            .fontColor(Color.Grey)
            .margin(2)
        }
        .alignItems(HorizontalAlign.Start)
        .justifyContent(FlexAlign.Start)
      }
      .width('100%')
      //.margin({bottom: 10})
    //.height('150')
  }
}
import  FoodViewModel,{Food}  from '../viewmodel/FoodViewModel'
import router from '@ohos.router';
@Component
export default struct FoodList {
  @State foodList: Array<Food> = []
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
      const data = await FoodViewModel.getFoodByType(this.type);
      this.foodList = data;
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
    for(let i = 0;i<this.foodList.length;i++){
      let food = this.foodList[i]
      if(food.name.includes(this.searchText)){
        food.status = food.status==1? 1 : 0
        this.foodList.splice(i,1,food)
      }else{
        food.status = food.status==1? 1 : 2
        this.foodList.splice(i,1,food)
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
          // if (this.upRefreshStatus) {
          //   this.scroller.scrollTo({ // 调用scrollTo滚动到具体位置
          //     xOffset: 0, // 竖直方向滚动，该值不起作用
          //     yOffset: 680, // 滚动到底部
          //     animation: { // 滚动动画
          //       duration: 1500,
          //       curve: Curve.EaseOut
          //     }
          //   })
          // }
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
            ForEach(this.foodList, (food) => {
              if(food.status==0){
                ListItem(){
                  Column(){
                    FoodItem({
                      food_id: food.id,
                      name: food.name,
                      imageURL: food.imageURL,
                      recAddr: food.recAddr
                    })
                      .margin({ bottom: 10 })
                    //Divider().strokeWidth(2).color('#F1F3F5').margin({ top: -5 })
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
struct FoodItem{
  @Prop food_id:string;
  @Prop name: string;
  @Prop imageURL: string;
  @Prop recAddr: string;

  toPage(){
    console.log('food_id: ' + this.food_id)
    // 路由
    router.pushUrl({
      url: 'pages/FoodDetailPage',
      params: {
        food_id: this.food_id
      }
    })
  }
  build(){
      Column({ space: 15 }) {

        Column() {
          Row(){
            Image(this.imageURL)
              .height(150)
              .width('100%')
          }

          Row(){
            Text(this.name)
              .width("90%")
              .height(35)
              .fontSize(20)
              .fontWeight(FontWeight.Bold)
              .margin({top:5})
              .backgroundColor("#FFFFFF")
              .maxLines(1)
              .textOverflow({overflow:TextOverflow.Ellipsis})
          }
        }
        .clip(true)
        .borderRadius(15)
        .shadow({
          radius: 20,
          color: `rgba(0,0,0,0.3)`,
          offsetY:0,
          offsetX:0
        })
        .margin({top:10})
        .height(185)
        .width("90%")
        .onClick(() => {
          this.toPage()
        })

      }
      .width('100%')
      //.margin({bottom: 10})
    //.height('150')
  }
}
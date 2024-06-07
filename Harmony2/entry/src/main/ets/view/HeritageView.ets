import  HeritageViewModel,{Heritage}  from '../viewmodel/HeritageViewModel'
import router from '@ohos.router';
@Component
export default struct HeritageList {
  @State message: string = 'Hello World'
  @State heritageList: Array<Heritage> = []
  @State isLoading: boolean = true
  @Prop type:number
  @Prop @Watch('OnRefresh')
  currentTabIndex: number
  async OnRefresh() {
    if(this.currentTabIndex === this.type)
    try {
      console.log('componentDidMount')
      const data = await HeritageViewModel.getHeritageByType(this.type);
      this.heritageList = data;
    } catch (error) {
      console.error('Error fetching data:', error);
    } finally {
      console.log('Data fetched')
      this.isLoading = false;
    }
  }
  aboutToAppear(){
    this.OnRefresh()
  }

  build() {
    Scroll() {
      Column({ space: 15 }) {

        if (this.isLoading) {
          Text('加载中...');
        } else {
        ForEach(this.heritageList, (heritage) => {
              HeritageItem({
                heritage_id: heritage.id,
                name: heritage.name,
                national: heritage.national,
                pos: heritage.pos,
                imageURL: heritage.imageURL
              })
                .margin({ bottom: 10 })
              Divider().strokeWidth(2).color('#F1F3F5').margin({ top: -5 })
            });
          HeritageItem({
            heritage_id: '0',
            name: '加载中...',
            national: '1',
            pos: '加载中...',
            imageURL: 'https://i1.hdslb.com/bfs/archive/5a973475a48cc33676776449c317e5044ab0ae80.jpg@672w_378h_1c_!web-home-common-cover.avif'
          })
          }


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
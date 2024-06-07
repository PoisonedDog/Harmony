@Component
export default  struct HeritageHeader{
  @Prop title: string
  @Prop national: string
  @Prop pos: string
  build(){
    Column(){
      Row(){
        Text(this.title)
          .fontWeight(FontWeight.Bold)
          .fontSize(18)
          .margin(10)
      }
      .width('100%')
      .justifyContent(FlexAlign.SpaceBetween)
      Row(){
        Text('级别:  ')
          .fontColor(0x63d4af)
        Text(`${this.national == '1' ? '国家级' : '省级'}`)
      }
      .width('100%')
      .margin(2)
      .justifyContent(FlexAlign.Start)
      Row(){
        Text('归属地:  ')
          .fontColor(0x63d4af)
        Text(`${this.pos}`)
        Image($r('app.media.location'))
          .height('20')
      }
      .width('100%')
      .margin(2)
      .justifyContent(FlexAlign.Start)
    }
  }
}
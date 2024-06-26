@Component
export default  struct FoodHeader{
  @Prop title: string
  @Prop recAddr: string
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
        Text('好店推荐:  ')
          .fontColor(0xfabf14)
        Text(`${this.recAddr}`)
      }
      .width('100%')
      .margin(2)
      .justifyContent(FlexAlign.Start)
    }
  }
}
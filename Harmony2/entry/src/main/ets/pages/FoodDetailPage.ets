import ArticleView from '../view/ArticleView'
import router from '@ohos.router'
@Entry
@Component
struct HeritageDetailPage {
  @State message: string = 'Hello World'
  @State paramsFromUrl: object = router.getParams()

  build() {
    Column(){
      ArticleView({articleId:this.paramsFromUrl?.['food_id'],articleType:0})
    }

  }
}
import ArticleView from '../view/ArticleView'

@Entry
@Component
struct HeritageDetailPage {
  @State message: string = 'Hello World'

  build() {
    Column(){
      ArticleView({articleId:'0',articleType:4})
    }

  }
}


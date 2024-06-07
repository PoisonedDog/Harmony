import {Article} from './ArticleData'
import {getArticleById} from "../Utils/API"

export class ArticleViewModel {
  async getArticleById(articleId:string): Promise<Article> {
    let article: Article = new Article();
    try {
      const res= await getArticleById({id:articleId})
      article =res.data.data
      article.contentUrl = JSON.parse(article.contentUrl)[0].url
      console.log(JSON.stringify(article.position))
      console.log('123')
    } catch (error) {
    console.error('Error fetching article data:', error);
    }
    return article;
  }
}
export default new ArticleViewModel();
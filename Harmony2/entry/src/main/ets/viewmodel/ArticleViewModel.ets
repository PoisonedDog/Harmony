import {Article} from './ArticleData'
import {getArticleById,addArticleLike} from "../Utils/API"

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
  async addArticleLike(articleId: string, value: number): Promise<boolean> {
    try {
      const res = await addArticleLike({ id: articleId, value: value });
      if (res.data.code === 'SUCCESS') {
        return true;
      } else {
        throw new Error('操作失败');
      }
    } catch (error) {
      console.error('Error adding article like:', error);
      return false;
    }
  }
}
export default new ArticleViewModel();
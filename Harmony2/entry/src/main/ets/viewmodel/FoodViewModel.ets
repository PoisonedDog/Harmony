import {getFoodAll,getFoodByType} from "../Utils/API"
import {Article} from './ArticleData'
export class Food{
  id:number;
  name:string;
  national:string;
  pos:string;
  imageURL:string;
  status:number
  constructor(id:number,name:string,national:string,pos:string,imageURL:string,status:number){
    this.id = id;
    this.name = name;
    this.national = national;
    this.pos = pos;
    this.imageURL = imageURL;
    this.status = status;
  }
}

export class FoodViewModel {
  async getFoodByType(type:number): Promise<Array<Food>> { //type: 0 全部, 1 国保文物, 2 非遗项目
    let foods: Array<Food> = [];
    try {
      const res = await getFoodByType(type)
      let articles:Array<Article> = res.data.data.records;

      for (let i = 0; i < articles.length; i++) {
        const record = res.data.data.records[i];
        const id = record.id;
        const name = record.title;
        const national = record.national ? '1' : '2';
        const pos = record.position;
        const imageURL = JSON.parse(record.contentUrl)[0].url;
        const food = new Food(id, name, national, pos, imageURL, record.status);
        console.log(JSON.stringify(record.foodType));
        console.log(JSON.stringify(record.title))
        foods.push(food);
      }
    } catch (error) {
      console.error('Error fetching food data:', error);
    }

    return foods;
  }

}

export default new FoodViewModel();
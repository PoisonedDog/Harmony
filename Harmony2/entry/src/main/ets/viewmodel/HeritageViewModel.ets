import {getHeritageAll,getHeritageByType} from "../Utils/API"
import {Article} from './ArticleData'
export class Heritage{
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

export class HeritageViewModel {
  async getHeritageByType(type:number): Promise<Array<Heritage>> { //type: 0 全部, 1 国保文物, 2 非遗项目
    let heritages: Array<Heritage> = [];
    try {
      const res = await getHeritageByType(type)
      let articles:Array<Article> = res.data.data.records;

      for (let i = 0; i < articles.length; i++) {
        const record = res.data.data.records[i];
        const id = record.id;
        const name = record.title;
        const national = record.national ? '1' : '2';
        const pos = record.position;
        const imageURL = JSON.parse(record.contentUrl)[0].url;
        const heritage = new Heritage(id, name, national, pos, imageURL, record.status);
        console.log(JSON.stringify(record.heritageType));
        console.log(JSON.stringify(record.title))
        heritages.push(heritage);
      }
    } catch (error) {
      console.error('Error fetching heritage data:', error);
    }

    return heritages;
  }

}

export default new HeritageViewModel();
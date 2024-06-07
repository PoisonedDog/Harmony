import {getHeritageAll,getHeritageByType} from "../Utils/API"
import {Article} from './ArticleData'
export class Heritage{
  id:number;
  name:string;
  national:string;
  pos:string;
  imageURL:string;
  constructor(id:number,name:string,national:string,pos:string,imageURL:string){
    this.id = id;
    this.name = name;
    this.national = national;
    this.pos = pos;
    this.imageURL = imageURL;
  }
}

export class HeritageViewModel {
  async getHeritageByType(type:number): Promise<Array<Heritage>> { //type: 0 全部, 1 国保文物, 2 非遗项目
    let heritages: Array<Heritage> = [];
    try {
      const res = type==0 ? await getHeritageAll() : await getHeritageByType(type)
      console.log('1223')
      let articles:Array<Article> = res.data.data.records;
      console.log(JSON.stringify(articles))
      for (let i = 0; i < articles.length; i++) {
        const record = res.data.data.records[i];
        const id = record.id;
        const name = record.title;
        const national = record.national ? '1' : '2';
        const pos = record.position;
        const imageURL = JSON.parse(record.contentUrl)[0].url;
        const heritage = new Heritage(id, name, national, pos, imageURL);
        console.log(JSON.stringify(heritage));
        heritages.push(heritage);
      }
    } catch (error) {
      console.error('Error fetching heritage data:', error);
    }
    console.log(JSON.stringify(heritages))
    return heritages;
  }

}

export default new HeritageViewModel();
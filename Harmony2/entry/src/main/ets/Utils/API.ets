import { httpObj } from './AxiosUtils'

function getArticleAll(value: {
  type: number,
  page?: number,
  size?: number,
  popular?: number,
  popType?: number,
  touType?: string,
  foodType?: string,
  heritageType?: number,
  belongType?: string
}){
  const params: any = { type: value.type };

  // 遍历 value 对象，将非 undefined 的属性添加到 params 中
  for (const key in value) {
    if (value.hasOwnProperty(key) && value[key] !== undefined) {
      params[key] = value[key];
    }
  }

  return httpObj.get('/article', { params });
}
export function getHeritageAll(page?:number,size?:number){
  return getArticleAll({type:4})
}

export function getHeritageByType(type:number){
  if(type===0){
    console.log("get all")
    return getHeritageAll()
  }else{
    console.log("get"+type.toString())
    return getArticleAll({type:4, heritageType:type})
  }

}

export function getArticleById(value:{
  id: string
}){
  return httpObj.get(`/article/${value.id}`)
}

export function addArticleLike(value:{
  id: string,
  value: number,
}){
  return httpObj.post(`/article/addOneNum`,{add:value.value,id:value.id,type:'like'})
}

export function getFoodAll(page?:number,size?:number){
  return getArticleAll({type:0})
}

export function getFoodByType(type:number){
  if(type===0){
    console.log("get all")
    return getFoodAll()
  }else{
    console.log("get"+type.toString())
    //将type转为string格式
    let foodType = type.toString()
    return getArticleAll({type:0, foodType:foodType})
  }

}
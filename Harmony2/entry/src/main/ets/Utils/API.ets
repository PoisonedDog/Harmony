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
  return httpObj.get('/article',{params:{type:value.type}})
}
export function getHeritageAll(page?:number,size?:number){
  return getArticleAll({type:4})
}

export function getHeritageByType(type:number){
  return getArticleAll({type:4, heritageType:type})
}

export function getArticleById(value:{
  id: string
}){
  return httpObj.get(`/article/${value.id}`)
}
// src/http/index.js
import myaxios from "../MyAxios"
import baseurl from '../BaseUrl'
const BMDURL=baseurl.BMDURL
const directorApi={   //封装http接口


  /**
   * 
   * @param {Object} params 请求参数  {name:关键字}
   * @returns  Promise
   */
  querydirectorsByName(params){
    let url=BMDURL+"/movie-directors/name"
    return myaxios.post(url,params)
  },

   //查询所有导演
  queryAlldirectors(){  
    let url=BMDURL+'/movie-directors'
    return myaxios.get(url,{page:1,pagesize:100})
  },
  /* 删除导演 */
  delete(params){
    let url=BMDURL+'/movie-director/del'
    return myaxios.post(url,params)
  }

}

export default directorApi
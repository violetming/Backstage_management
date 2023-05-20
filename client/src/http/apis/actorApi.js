// src/http/index.js
import myaxios from "../MyAxios"
import baseurl from '../BaseUrl'
const BMDURL=baseurl.BMDURL

const actorApi={   //封装http接口
  /**
   * 
   * @param {Object} params 请求参数  {name:关键字}
   * @returns  Promise
   */
  queryActorsByName(params){
    let url=BMDURL+"/movie-actors/name"
    return myaxios.post(url,params)
  },

   //查询所有演员
  queryAllActors(){  
    let url=BMDURL+"/movie-actors"
    return myaxios.get(url,{page:1,pagesize:100})
  },
  /* 删除演员 */
  delete(params){
    let url=BMDURL+'/movie-actor/del'
    return myaxios.post(url,params)
  },

  /**
   * @param {Object}params 演员对象
   *         {actorName:xx,actorAvatar:xx}
   */

  add(params){
    let url=BMDURL+"/movie-actor/add"
    return myaxios.post(url,params)
  }
}

export default actorApi
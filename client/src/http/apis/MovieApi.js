// src/http/index.js
import myaxios from "../MyAxios"
import baseurl from '../BaseUrl'
const BMDURL=baseurl.BMDURL

const movieApi={   //封装http接口
  update(params){
    let url=BMDURL+'/movie-info/update'
    return myaxios.post(url,params)
  },
  queryById(params){
    let url=BMDURL+'/movie-info/query'
    return myaxios.get(url,params)
  },

  add(params){
    let url=BMDURL+'/movie-info/add'
    return myaxios.post(url,params)
  },

  /**查询所有电影类型 */
  queryAllTypes(){
    let url=BMDURL+'/movie-types'
    return myaxios.get(url)
  },

  /**
   * 分页查询电影列表数据
   * @param {Object} params {pageL:1 , pagesize:3}
   * @returns  Promise
   */
  query(params){
    let url=BMDURL+"/movie-infos"
    return myaxios.get(url,params)
  },
  /**
   * 通过关键字模糊查询电影列表数据
   * @param {Object} params {page:1,pagesize:3,name:关键字}
   */
  queryByNameLike(params){
    let url=BMDURL+'/movie-infos/name'
    return myaxios.post(url,params)
  },
  delete(params){
    let url = BMDURL+'/movie-info/del'
    return myaxios.post(url,params)
  },


}

export default movieApi
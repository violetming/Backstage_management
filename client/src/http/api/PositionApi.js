import myaxios from "../MyAxios"
import baseurl from '../BaseUrl'
const BMDURL=baseurl.BMDURL

const positionApi={
/* 多条件查询职位 */
  queryall(params){
    let url=BMDURL+'/positions/queryall'
    return myaxios.post(url,params)
  },
  /* 模糊查询职位 */
  queryposition(params){
    let url=BMDURL+'/positions/queryposition'
    return myaxios.post(url,params)
  },
  /* 通过id跳转到职位详情 */
  queryid(params){
    let url=BMDURL+'/positions/queryid'
    return myaxios.post(url,params)
  },
  /* 新政招聘条件 */
  queryadd(params){
    let url=BMDURL+'/positions/queradd'
    return myaxios.post(url,params)
  },
  /* 删除招聘 */
  queryadd(params){
    let url=BMDURL+'/positions/querydel'
    return myaxios.post(url,params)
  },
  queryupdate(params){
    let url=BMDURL+'/positions/queryupdate'
    return myaxios.post(url,params)
  }

}
export default positionApi
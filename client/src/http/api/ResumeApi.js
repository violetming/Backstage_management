import myaxios from "../MyAxios"
import baseurl from '../BaseUrl'
const BMDURL=baseurl.BMDURL

const resueApi={
  /* 查询所有人才 */
  queryall(){
    let url=BMDURL+'/resume/queryall'
    return myaxios.get(url)
  },
  /* 通过手机号码查询 */
  queryphone(params){
    let url=BMDURL+'/resume/queryphone'
    return myaxios.post(url,params)
  },
  /* 通过姓名查询 */
  queryname(params){
    let url=BMDURL+'/resume/queryname'
    return myaxios.post(url,params)
  },
  /* 通过id删除人才 */
  del(params){
    let url =BMDURL+'/resume/del'
    return myaxios.post(url,params)
  },
  /* 新建人才 */
  add(params){
    let url=BMDURL+'/resume/add'
    return myaxios.post(url,params)
  },
  /* 通过id查询人才 */
  queryid(params){
    let url=BMDURL+'/resume/queryid'
    return myaxios.get(url,params)
  },
  /* 修改人才表 */
  update(params){
    let url=BMDURL+'/resume/update'
    return myaxios.post(url,params)
  }

}
export default resueApi
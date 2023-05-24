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
  }


}
export default resueApi
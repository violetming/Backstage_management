import myaxios from "../MyAxios"
import baseurl from '../BaseUrl'
const BMDURL=baseurl.BMDURL

const resueApi={
  queryall(){
    let url=BMDURL+'/resume/queryall'
    return myaxios.get(url)
  }
}
export default resueApi
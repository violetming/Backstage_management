import myaxios from "../MyAxios"
import baseurl from '../BaseUrl'
const BMDURL=baseurl.BMDURL

const LoginApi={
  login(params){
    let url=BMDURL+'/user/login'
    return myaxios.post(url,params)
  }
}
export default LoginApi
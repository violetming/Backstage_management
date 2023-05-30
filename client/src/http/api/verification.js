import myaxios from "../MyAxios"
import baseurl from '../BaseUrl'
const BMDURL=baseurl.BMDURL
const verificationApi={
  // 获取验证码
  captcha(){
    let url=BMDURL+'/verification/captcha'
    return myaxios.get(url)
  },
// 验证验证码
  verify(params){
    let url=BMDURL+'/verification/verify'
    return myaxios.post(url,params)
  }
}
export default verificationApi
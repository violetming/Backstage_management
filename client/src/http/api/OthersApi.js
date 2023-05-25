import myaxios from "../MyAxios"
import baseurl from '../BaseUrl'
const BMDURL=baseurl.BMDURL

const othersApi={
  /* 查询学历表 */
  education(){
    let url=BMDURL+'/others/education'
    return myaxios.get(url)
  },
    /* 查询工作年限 */
    limit(){
      let url=BMDURL+'/others/limit'
      return myaxios.get(url)
    },
      /* 职位表 */
    station(){
    let url=BMDURL+'/others/station'
    return myaxios.get(url)
  },
    /* 地区表 */
    region(){
      let url=BMDURL+'/others/region'
      return myaxios.get(url)
    },

}
export default othersApi
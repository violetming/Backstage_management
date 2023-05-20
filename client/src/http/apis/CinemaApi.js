import myaxios from "../MyAxios"
import baseurl from '../BaseUrl'
const BMDURL=baseurl.BMDURL


const cinemaapi={

  queryAllTags(){
    let url=BMDURL+'/cinema/tags'
    return myaxios.get(url)
  },
  add(params){
    let url=BMDURL+'/cinema/add'
    return myaxios.post(url,params)
  },
  query(){
    let url=BMDURL+'/cinemas'
    return myaxios.get(url)
  },
  quwey1(params){
    let url=BMDURL+'/cinema/query'
    return myaxios.get(url,params)
  },
  update(params){
    let url=BMDURL+'/cinema/update'
    return myaxios.post(url,params)
  }
  
}
export default cinemaapi
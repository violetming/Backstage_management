/* src/utils/Storage.js  
 * 提供WebStorage的数据存储与读取功能的工具模块 */

/** 此处管理项目中所有需要存储的KEY */
export const KEYS = {
  USER_INFO : 'USER_INFO',
  CITY_NAME : 'CITY_NAME',
  TOKEN:'TOKEN',
}

/** 将传入的key与data配对，存入sessionStorage */
export const set = (key, data)=>{
  sessionStorage.setItem(key, JSON.stringify(data))
}

/** 通过Key从sessionStorage找到对应value */
export const get = (key)=>{
  let data = sessionStorage.getItem(key)
  if(data) {
    return JSON.parse(data)
  }else {
    return null
  }
}


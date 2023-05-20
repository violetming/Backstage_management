const BASEURL_ENV={   //封装基础路径的前缀对象
  //封装开发环境下的所有URL资源前缀
  DEV:{
    BMDURL:"http://localhost:3010",
    UPLOADURL:"http://localhost:9000"
  },
  // 封装生产环境下的所有URL资源前缀
  PRO:{
    BMDURL:'https://web.codeboy.com/bmdapi',
    UPLOADURL:'https://web.codeboy.com/bmduploadapi'
  }

}
// 在此处选择一个URL环境导出即可
export default BASEURL_ENV.DEV
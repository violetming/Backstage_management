// 引入express模块
const express=require('express')
// 创建服务
const app=express()

// token
const jwt = require("jsonwebtoken");
const JWT_SECRET_KEY = "JWT_SECRET_KEY";
const Response = require("./utils/Response.js");


// 引入路由
const resume=require('./router/Resume')
const positions=require('./router/Positions')
const user=require('./router/Admin')
const qualification=require('./router/Qualification')
const enterprise=require('./router/Enterprise')
const others=require('./router/Others')
const verification=require('./router/verification.js')



// 配置跨域
const cors = require("cors");
app.use(
  cors({
    origin: "*",
  })
);


// 解析post请求参数
app.use(express.urlencoded());

// 自定义token全局验证中间件
const tokenTools = function (req, resp, next) {
  // 若请求路径是 /user/login 则不拦截，直接向后执行即可
  if(req.path=='/user/login'){
      next();
      return;
  }

  // 测试环境中，不做token拦截，直接执行后续业务
 if(1==1){
   next();
   return;
 }


  // 执行token验证
  let token = req.headers["authorization"];
  try {
    let payload = jwt.verify(token, JWT_SECRET_KEY);
    req.tokenPayload = payload  // 将token中存储的数据，直接复制给req，这样在后续业务中就可以使用req.tokenPayload获取这些信息
  } catch (error) {
    resp.send(Response.error(401, '用户验证失败，请重新登录'))
    return;
  }
  next(); // 继续后续业务的执行
};
app.use(tokenTools);


//服务端口号
const port =3000    

app.listen(port, () => {
  console.log("背带裤一号机启动!!!!!!");
});

app.get('/',(req,res)=>{
  res.send('小黑子还来')
})


app.use('/resume',resume)
app.use('/positions',positions)
app.use('/user',user)
app.use('/qualification',qualification)
app.use('/enterprise',enterprise)
app.use('/others',others)
app.use('/verification',verification)



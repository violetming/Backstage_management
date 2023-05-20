// 引入express
const express=require("express")
// 创建路由
const router=express.Router();
const Joi = require("joi");
// 引入mysql连接池
const pool = require('../utils/db.js')
// 引入响应
const Response=require('../utils/Response.js')

/**新增招聘详情表 */
router.post('/add',(req,res)=>{
  let {id,content,welfare,company,location}=req.body
  let schema=Joi.object({
    id:Joi.string().required(),
    content:Joi.string().required(),
    welfare:Joi.string().required(),
    company:Joi.string().required(),
    location:Joi.string().required()
  })
  let{error,value}=schema.validate(req.body);
  if(error){
    res.send(Response.error(400,error))
  }
  let sql=`
  insert into qualification(id,content,welfare,company,location)values(?,?,?,?,?)`;
  pool.query(sql,[id,content,welfare,company,location],(error,result)=>{
    if(error){
      res.send(Response.error(500,error));
      throw error;
    }
    res.send(Response.ok())
  })
})


/**通过id删除招聘详情表 */
router.post('/del',(req,res)=>{
  let {id}=req.body;
  let schema=Joi.object({
    id:Joi.string().required()
  })
    let{error,value}=schema.validate(req.body);
  if(error){
    res.send(Response.error(400,error))
  }
  let sql=`delete from qualification where id=?`
  pool.query(sql,[id],(error,result)=>{
    if(error){
      res.send(Response.error(500,error));
      throw error;
    }
    res.send(Response.ok())
  })
})

/**修改招聘详情表 */
router.post('/update',(req,res)=>{
  let {id,content,welfare,company,location}=req.body
  let schema=Joi.object({
    id:Joi.string().required(),
    content:Joi.string().required(),
    welfare:Joi.string().required(),
    company:Joi.string().required(),
    location:Joi.string().required()
  })
  let{error,value}=schema.validate(req.body);
  if(error){
    res.send(Response.error(400,error))
  }
  let sql=`
    update qualification set
    content=?,
    welfare=?,
    company=?,
    location=?
    where id=?
    `;
  pool.query(sql,[content,welfare,company,location,id],(error,result)=>{
    if(error){
      res.send(Response.error(500,error));
      throw error;
    }
    res.send(Response.ok())
  })
})


/**查询招聘详情表 */
router.get('/queryall',(req,res)=>{
  let sql=`select * from qualification`
    // 调用 mysql 连接池 query 方法执行查询操作
  pool.query(sql,(error,result)=>{
    if(error){
      // 如果发生错误，则返回 HTTP 状态码为 500 的错误响应
      res.send(Response.error(500,error))
      throw error
    }
        // 成功查询到数据后，返回 HTTP 状态码为 200 的成功响应，并将查询结果作为响应数据返回
    res.send(Response.ok(result))
  })
})





// 将router对象导出
module.exports=router
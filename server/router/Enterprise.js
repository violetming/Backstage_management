// 引入express
const express=require("express")
// 创建路由
const router=express.Router();
const Joi = require("joi");
// 引入mysql连接池
const pool = require('../utils/db.js')
// 引入响应
const Response=require('../utils/Response.js')

/**
 * 新增公司信息表
 * @param:
 *   id...email
 * @return:
 * {code:200,msg:'ok',data:[{}]}
 */
router.post('/add',(req,res)=>{
  let {id,username,pwd,phone,email,register,company,people,region,nature,company_progile}=req.body;
  let schema=Joi.object({
    id:Joi.string().required(),
    username:Joi.string().required(),
    pwd:Joi.string().required(),
    phone:Joi.string().required(),
    email:Joi.string().required(),
    register:Joi.string().required(),
    company:Joi.string().required(),
    people:Joi.string().required(),
    region:Joi.string().required(),
    nature:Joi.string().required(),
    company_progile:Joi.string().required()
  })
  let{error,value}=schema.validate(req.body);
  if(error){
    res.send(Response.error(400,error))
  }
  let sql=`insert into enterprise(
    id,
    username,
    pwd,
    phone,
    email,
    register,
    company,
    people,
    region,
    nature,
    company_progile
  )values(?,?,?,?,?,?,?,?,?,?,?)`;
      // 调用 mysql 连接池 query 方法执行查询操作
  pool.query(sql,[id,username,pwd,phone,email,register,company,people,region,nature,company_progile],(error,result)=>{
      if(error){
        res.send(Response.error(500,error));
        throw error;
      }
      res.send(Response.ok())
    })
})
/**
 * 利用id删除对应公司
 * @param:
 * id: 公司信息表id
 * @return:
 * {code:200,msg:'ok',data:[{}]}
 */

router.post('/del',(req,res)=>{
  let {id}=req.body;
  let schema=Joi.object({
    id:Joi.string().required()
  })
    let{error,value}=schema.validate(req.body);
  if(error){
    res.send(Response.error(400,error))
  }
  let sql=`delete from enterprise where id=?`
  pool.query(sql,[id],(error,result)=>{
    if(error){
      res.send(Response.error(500,error));
      throw error;
    }
    res.send(Response.ok())
  })
})

/**
 * 修改公司信息表
 * @param:
 * id~email
 * @return:
 * {code:200,msg:'ok',data:[{}]}
 */

router.post('/update',(req,res)=>{
  let {id,username,pwd,phone,email,register,company,people,region,nature,company_progile}=req.body;
  let schema=Joi.object({
    id:Joi.string().required(),
    username:Joi.string().required(),
    pwd:Joi.string().required(),
    phone:Joi.string().required(),
    email:Joi.string().required(),
    register:Joi.string().required(),
    company:Joi.string().required(),
    people:Joi.string().required(),
    region:Joi.string().required(),
    nature:Joi.string().required(),
    company_progile:Joi.string().required()
  })
  let{error,value}=schema.validate(req.body);
  if(error){
    res.send(Response.error(400,error))
  }
  let sql=`update enterprise set
  username=?,
  pwd=?,
  phone=?,
  email=?,
  register=?,
  company=?,
  people=?,
  region=?,
  nature=?,
  company_progile=?
  where id=?`
  pool.query(sql,[username,pwd,phone,email,register,company,people,region,nature,company_progile,id],(error,result)=>{
    if (error) {
      // 发生错误时返回错误响应
      res.send(Response.error(500, error));
      throw error;
    }
    // 返回成功响应
    res.send(Response.ok())
  })
})

/**
 * 查询所有公司信息表
 * @param:
 * 无
 * @return:
 * {code:200,msg:'ok',data:[{}]}
 */
router.get('/queryall',(req,res)=>{
  let sql=`select * from enterprise`
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

/**
 * 通过id查询
 * @param
 * id 
 * @return
 * {code:200,msg:'ok',data:[{}]}
 */
router.post('/queryid',(req,res)=>{
  let {id}=req.body
  let schema=Joi.object({
    id:Joi.string().required()
  })
  let{error,value}=schema.validate(req.body);
  if(error){
    res.send(Response.error(400,error))
  }
  let sql=`select * from enterprise where id=?`
  pool.query(sql,[id],(error,result)=>{
    if(error){
      res.send(Response.error(500,error))
      throw error
    }
    res.send(Response.ok(result))
  })
  
})

/**
 * 通过手机号查询
 * @param
 * id 
 * @return
 * {code:200,msg:'ok',data:[{}]}
 */
router.post('/queryphone',(req,res)=>{
  let {phone}=req.body
  let schema=Joi.object({
    phone:Joi.string().required()
  })
  let{error,value}=schema.validate(req.body);
  if(error){
    res.send(Response.error(400,error))
  }
  let sql=`select * from enterprise where phone=?`
  pool.query(sql,[phone],(error,result)=>{
    if(error){
      res.send(Response.error(500,error))
      throw error
    }
    res.send(Response.ok(result))
  })
})



// 将router对象导出
module.exports=router;
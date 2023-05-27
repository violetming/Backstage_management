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
 * 新增人才简历表
 * @param:
 *   id...email
 * @return:
 * {code:200,msg:'ok',data:[{}]}
 */
router.post('/add',(req,res)=>{
  let {name,sex,irthday,major,education,experience,native,post,monthly,through,phone,email}=req.body;
  let schema=Joi.object({
    name:Joi.string().required(),
    sex:Joi.string().required(),
    irthday:Joi.date().required(),
    major:Joi.string().required(),
    education:Joi.string().required(),
    experience:Joi.string().required(),
    native:Joi.string().required(),
    post:Joi.string().required(),
    monthly:Joi.string().required(),
    through:Joi.string().required(),
    phone:Joi.number().required(),
    email:Joi.string().required()
  })
  let{error,value}=schema.validate(req.body);
  if(error){
    res.send(Response.error(400,error))
  }
  let sql=`insert into resume(
    name,
    sex,
    irthday,
    major,
    education,
    experience,
    native,
    post,
    monthly,
    through,
    phone,
    email
  )values(?,?,?,?,?,?,?,?,?,?,?,?)`;
      // 调用 mysql 连接池 query 方法执行查询操作
  pool.query(sql,[name,sex,irthday,major,education,experience,native,post,monthly,through,phone,email],(error,result)=>{
      if(error){
        res.send(Response.error(500,error));
        throw error;
      }
      res.send(Response.ok())
    })
})
/**
 * 利用id删除对应人才
 * @param:
 * id: 人才简历表id
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
  let sql=`delete from resume where id=?`
  pool.query(sql,[id],(error,result)=>{
    if(error){
      res.send(Response.error(500,error));
      throw error;
    }
    res.send(Response.ok())
  })
})

/**
 * 修改人才简历表
 * @param:
 * id~email
 * @return:
 * {code:200,msg:'ok',data:[{}]}
 */

router.post('/update',(req,res)=>{
  let {id,name,sex,irthday,major,education,experience,native,post,monthly,through,phone,email}=req.body;
  let schema=Joi.object({
    id:Joi.string().required(),
    name:Joi.string().required(),
    sex:Joi.string().required(),
    irthday:Joi.date().required(),
    major:Joi.string().required(),
    education:Joi.string().required(),
    experience:Joi.string().required(),
    native:Joi.string().required(),
    post:Joi.string().required(),
    monthly:Joi.string().required(),
    through:Joi.string().required(),
    phone:Joi.number().required(),
    email:Joi.string().required(),
  })
  let{error,value}=schema.validate(req.body);
  if(error){
    res.send(Response.error(400,error))
  }
  let sql=`update resume set
  name=?,
  sex=?,
  irthday=?,
  major=?,
  education=?,
  experience=?,
  native=?,
  post=?,
  monthly=?,
  through=?,
  phone=?,
  email=?
  where id=?`
  pool.query(sql,[name,sex,irthday,major,education,experience,native,post,monthly,through,phone,email,id],(error,result)=>{
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
 * 查询所有人才简历表
 * @param:
 * 无
 * @return:
 * {code:200,msg:'ok',data:[{}]}
 */
router.get('/queryall',(req,res)=>{
  let sql=`select * from resume`
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
router.get('/queryid',(req,res)=>{
  let {id}=req.query
  let schema=Joi.object({
    id:Joi.string().required()
  })
  let{error,value}=schema.validate(req.query);
  if(error){
    res.send(Response.error(400,error))
  }
  let sql=`select * from resume where id=?`
  pool.query(sql,[id],(error,result)=>{
    if (error) {
      res.send(Response.error(500, error));
      throw error;
    }
    if (result && result.length == 0) {
      // 没查到
      res.send(Response.ok(null));
    } else {
      res.send(Response.ok(result[0]));
    }
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
  let sql=`select * from resume where phone=?`
  pool.query(sql,[phone],(error,result)=>{
    if(error){
      res.send(Response.error(500,error))
      throw error
    }
    res.send(Response.ok(result))
  })
})

/**
 * 通过工作年限查询
 * @param
 * id 
 * @return
 * {code:200,msg:'ok',data:[{}]}
 */
router.post('/queryname', (req, res) => {
  let {name} = req.body
  let schema = Joi.object({
    name: Joi.string().required()
  })
  let { error, value } = schema.validate(req.body);
  if (error) {
    res.send(Response.error(400, error))
    return;
  }
  let sql = `SELECT * FROM resume WHERE name = ? `
  pool.query(sql, [name], (error, result) => {
    if (error) {
      res.send(Response.error(500, error))
      throw error
    }
    res.send(Response.ok(result))
  })
})



// 将router对象导出
module.exports=router;
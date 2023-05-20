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
 * 查询企业招聘要求表
 * @param:monthly_pay月薪 limit_age工作年限  eduvation学历 nature公司性质 region 工作地区
 *   id...email
 * @return:
 * {code:200,msg:'ok',data:[{}]}
 */
router.post('/queryall', (req, res) => {
  const monthly_pay = req.body.monthly_pay;
  const limit_age = req.body.limit_age;
  const eduvation = req.body.eduvation || '';
  const nature = req.body.nature || '';
  const region = req.body.region || '';

  let sql = 'SELECT * FROM positions WHERE';
  let conditions = [];

  if (monthly_pay != null && monthly_pay !== undefined) {
    conditions.push(`${(monthly_pay*1)+2000} >=monthly_pay and monthly_pay>=${(monthly_pay)-2000} `);
  }

  if (limit_age != null && limit_age !== undefined) {
    conditions.push(`${(limit_age*1)+1} >= limit_age and limit_age>=${(limit_age)-1}`);
  }

  if (eduvation != null && eduvation !== undefined && eduvation !== '') {
    conditions.push(`eduvation = "${eduvation}"`);
  } 

  if (nature != null && nature !== undefined && nature !== '') {
    conditions.push(`nature = "${nature}"`);
  }

  if (region != null && region !== undefined && region !== '') {
    conditions.push(`region="${region}"`);
  }
  if (conditions.length == 0) {
    sql = 'SELECT * FROM positions';
  } else {
    sql += ' ' + conditions.join(' AND ');
  }
console.log('SQL@@@@@@',sql);
  pool.query(sql, (error, result) => {
    if (error) {
      res.send(Response.error(500, error));
      throw error;
    }
    res.send(Response.ok(result));
  });
});

/**
 * 按照职位模糊查询企业招聘要求表
 * @param:
 *   positions 职位名称
 * @return:
 * {code:200,msg:'ok',data:[{}]}
 */
router.post('/querypositions', (req, res) => {
  let positions = req.body.positions;
  let schema = Joi.object({
    positions: Joi.string().required()
  });
  let { error, value } = schema.validate(req.body);
  if (error) {
    res.send(Response.error(400, error));
  }
  let sql = `SELECT * FROM positions WHERE positions LIKE '%${positions}%'`;
  pool.query(sql, (error, result) => {
    if (error) {
      res.send(Response.error(500, error));
      throw error;
    }
    res.send(Response.ok(result));
  });
});
/**
 * 按照id跳转到职位详情
 * @param:
 *   positions 职位名称
 * @return:
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
  let sql=`select * from qualification where id=?`
  pool.query(sql,[id],(error,result)=>{
    if(error){
      res.send(Response.error(500,error))
      throw error
    }
    res.send(Response.ok(result))
  })
})
/**
 * 新增招聘信息
 * @param:
 *   
 * @return:
 * {code:200,msg:'ok',data:[{}]}
 */
router.post('/queryadd',(req,res)=>{
  let{
    id,
    enterprise_id,
    positions,
    type,
    region,
    people,
    monthly_pay,
    major,
    station,
    eduvation,
    limit_age,
    contact_number,
    nature,
    name,
    company_name
    }=req.body
    let schema=Joi.object({
      id:Joi.string().required(),
enterprise_id:Joi.string().required(),
positions:Joi.string().required(),
type:Joi.string().required(),
region:Joi.string().required(),
people:Joi.string().required(),
monthly_pay:Joi.string().required(),
major:Joi.string().required(),
station:Joi.string().required(),
eduvation:Joi.string().required(),
limit_age:Joi.string().required(),
contact_number:Joi.string().required(),
nature:Joi.string().required(),
name:Joi.string().required(),
company_name:Joi.string().required()
    })
    let{error,value}=schema.validate(req.body);
  if(error){
    res.send(Response.error(400,error))
  }
  let sql=`insert into positions(
  id,
  enterprise_id,
  positions,
  type,
  region,
  people,
  monthly_pay,
  major,
  station,
  eduvation,
  limit_age,
  contact_number,
  nature,
  name,
  company_name
  )values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)`;
  pool.query(sql,[id,enterprise_id,positions,type,region,people,monthly_pay,major,station,eduvation,limit_age,contact_number,nature,name,company_name],(error,result)=>{
    if(error){
      res.send(Response.error(500,error));
      throw error;
    }
    res.send(Response.ok())
  })
})

/**根据id删除招聘信息 */
router.post('/querydel',(req,res)=>{
  let id=req.body.id
  let schema=Joi.object({
    id:Joi.string().required()
  })
  let{error,value}=schema.validate(req.body)
  if(error){
    res.send(Response.error(400,error))
  }
  let sql=`delete from positions where id=?`
  pool.query(sql,[id],(error,result)=>{
    if(error){
      res.send(Response.error(500,error))
      throw error;
    }
    throw error
  })
  res.send(Response.ok())

})
/**修改招聘信息 */
router.post('/queryupdate',(req,res)=>{
  let{
    id,
    enterprise_id,
    positions,
    type,
    region,
    people,
    monthly_pay,
    major,
    station,
    eduvation,
    limit_age,
    contact_number,
    nature,
    name,
    company_name
    }=req.body
    let schema=Joi.object({
      id:Joi.string().required(),
enterprise_id:Joi.string().required(),
positions:Joi.string().required(),
type:Joi.string().required(),
region:Joi.string().required(),
people:Joi.string().required(),
monthly_pay:Joi.string().required(),
major:Joi.string().required(),
station:Joi.string().required(),
eduvation:Joi.string().required(),
limit_age:Joi.string().required(),
contact_number:Joi.string().required(),
nature:Joi.string().required(),
name:Joi.string().required(),
company_name:Joi.string().required()
    })
    let{error,value}=schema.validate(req.body);
  if(error){
    res.send(Response.error(400,error))
  }
  let sql=`update positions set
  enterprise_id=?,
  positions=?,
  type=?,
  region=?,
  people=?,
  monthly_pay=?,
  major=?,
  station=?,
  eduvation=?,
  limit_age=?,
  contact_number=?,
  nature=?,
  name=?,
  company_name=?
  where id=?
  `;
  pool.query(sql,[enterprise_id,positions,type,region,people,monthly_pay,major,station,eduvation,limit_age,contact_number,nature,name,company_name,id],(error,result)=>{
    if(error){
      res.send(Response.error(500,error));
      throw error;
    }
    res.send(Response.ok())
  })
})


// 将router对象导出
module.exports=router;
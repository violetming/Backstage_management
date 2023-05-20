/**  定义电影演员相关的接口 */
const express = require("express");
const router = express.Router();
const Joi = require("joi");
const Response = require("../utils/Response.js");

// 引入mysql连接池
const pool = require("../utils/db.js");
/**学历表 */
router.get('/education',(req,res)=>{
  let sql="select * from education"
  pool.query(sql,(error,result)=>{
    if (error) {
      res.send(Response.error(500, error));
      throw error;
    }
    res.send(Response.ok(result));
  })
})

/**工作年限 */

router.get('/limit',(req,res)=>{
  let sql="select * from limit_s"
  pool.query(sql,(error,result)=>{
    if (error) {
      res.send(Response.error(500, error));
      throw error;
    }
    res.send(Response.ok(result));
  })
})

/**职位表 */

router.get('/station',(req,res)=>{
  let sql="select * from station"
  pool.query(sql,(error,result)=>{
    if (error) {
      res.send(Response.error(500, error));
      throw error;
    }
    res.send(Response.ok(result));
  })
})
/**地区表 */

router.get('/region',(req,res)=>{
  let sql="select * from region"
  pool.query(sql,(error,result)=>{
    if (error) {
      res.send(Response.error(500, error));
      throw error;
    }
    res.send(Response.ok(result));
  })
})


module.exports=router;
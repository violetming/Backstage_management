// 验证码
const express = require('express');
const router=express.Router();
const db = require('../utils/db.js')

// 生成验证码API
router.get('/captcha', (req, res) => {
  // 生成六位随机数字字符串
  const code = Math.floor(Math.random() * 900000 + 100000).toString();

  // 计算过期时间（10分钟后）
  const now = new Date();
  const expire = new Date(now.getTime() + 10 * 60 * 1000);

  // 在数据库中保存验证码和过期时间
  db.query(
    'INSERT INTO captchas (code, expire) VALUES (?, ?)',
    [code, expire],
    (err, result) => {
      if (err) {
        console.error(err);
        res.sendStatus(500);
      } else {
        // 返回生成的验证码和验证码过期时间
        res.json({ code, expire });
      }
    }
  );
});

// 验证验证码API
router.post('/verify', (req, res) => {
  const { code } = req.body;

  // 从数据库中查询最近一条未过期的验证码记录
  db.query(
    'SELECT * FROM captchas WHERE code=? AND expire>NOW() ORDER BY id DESC LIMIT 1',
    [code],
    (err, results) => {
      if (err) {
        console.error(err);
        res.sendStatus(500);
      } else if (results.length === 0) {
        // 没有符合条件的验证码记录，验证失败
        res.json({ success: false });
      } else {
        // 找到符合条件的验证码记录，验证成功
        db.query(
          'DELETE FROM captchas WHERE id=?',
          [results[0].id],
          (err, result) => {
            if (err) {
              console.error(err);
              res.sendStatus(500);
            } else {
              res.json({ success: true });
            }
          }
        )
      }
    }
  );
});

module.exports=router;
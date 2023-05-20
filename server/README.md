

个人注册表

人才简历表与简历详情表

教育程度表

工作年限表

地区表

岗位类别表

部门表

企业用户注册表

企业职位表

admin权限表（?）





### 个人注册表personage

|    名    |  类型   | 长度 |  键  |   备注   |
| :------: | :-----: | :--: | :--: | :------: |
|    id    |   int   |  9   | true | 编号自增 |
| username | varchar |  20  |      |  用户名  |
|   pwd    | varchar |  20  |      |   密码   |
|  phone   | varchar |  11  |      |  手机号  |
|  email   | varchar |  30  |      |   邮箱   |
| register |  date   |  4   |      | 注册时间 |

### ***人才简历表与详情表resume***

|     名     |  类型   | 长度 |  键  |          备注          |
| :--------: | :-----: | :--: | :--: | :--------------------: |
|     id     |   int   |  9   |      | 需要关联个人注册表的id |
|    name    | varchar |  20  |      |          姓名          |
|    sex     | varchar |  1   |      |    性别 0-女，1-男     |
|  birthday  |  date   |  4   |      |        出生日期        |
|   major    | varchar |  20  |      |        所学专业        |
| education  | varchar |  20  |      |        最高学历        |
| experience | varchar |  4   |      |        工作年限        |
|   native   | varchar |  4   |      |          籍贯          |
|    post    | varchar |  10  |      |        求职岗位        |
|  monthly   | varchar |  5   |      |        期望薪资        |
|  through   | varchar | 255  |      |        工作经验        |
|   phont    |   int   |  11  |      |         手机号         |
|   email    | varchar |  20  |      |          邮箱          |
|            |         |      |      |                        |

### ***教育程度表education***

|    名     |  类型   | 长度 |  键  | 备注 |
| :-------: | :-----: | :--: | :--: | :--: |
|    id     |   int   |  5   | true |      |
| eduvation | varchar |  10  |      | 学历 |

### ***工作年限表limit***

|  名   | 类型 | 长度 |  键  |   备注   |
| :---: | :--: | :--: | :--: | :------: |
|  id   | int  |  5   | true |          |
| limit | char |  10  |      | 工作年限 |



### ***地区表region***

|   名   | 类型 | 长度 |  键  | 备注 |
| :----: | :--: | :--: | :--: | :--: |
|   id   | int  |  5   | true |      |
| region | char |  10  |      | 地区 |

### ***岗位类别station***

|      名      |  类型   | 长度 |  键  |   备注   |
| :----------: | :-----: | :--: | :--: | :------: |
|      id      |   int   |  5   | true |          |
| station_type | varchar |  10  |      | 岗位类别 |

### ***部门表department***

|     名     |  类型   | 长度 |  键  | 备注 |
| :--------: | :-----: | :--: | :--: | :--: |
|     id     |   int   |  5   | true |      |
| department | varchar |  10  |      | 部门 |

### ***企业用户注册表enterprise***

|       名        |  类型   | 长度 |  键  |   备注   |
| :-------------: | :-----: | :--: | :--: | :------: |
|       id        |   int   |  10  | true |   编号   |
|    username     | varchar |  20  |      |  用户名  |
|       pwd       | varchar |  20  |      |   密码   |
|      phone      |   int   |  11  |      |  手机号  |
|      email      | varchar |  20  |      |  邮箱号  |
|    register     |  date   |  4   |      | 注册时间 |
|     company     | varchar |  10  |      | 公司名称 |
|     people      |   int   |  5   |      | 员工数量 |
|     region      | varchar |  5   |      | 所在地区 |
|     nature      | varchar |  5   |      | 公司性质 |
| company_progile | varchar | 255  |      | 公司简介 |
|                 |         |      |      |          |
|                 |         |      |      |          |
|                 |         |      |      |          |

### ***企业职位表position***

|       名       |  类型   | 长度 |  键  |   备注   |
| :------------: | :-----: | :--: | :--: | :------: |
|       id       |   int   |  10  | true |          |
|    position    | varchar |  10  |      | 招聘职位 |
|      type      | varchar |  10  |      | 职位类别 |
|     region     | varchar |  10  |      | 工作地区 |
|     people     |   int   |  5   |      | 招聘人数 |
|  monthly_pay   |   int   |  10  |      |   月薪   |
|     major      | varchar |  10  |      | 专业要求 |
|    station     | varchar | 255  |      | 岗位介绍 |
|   eduvation    | varchar |  5   |      |   学历   |
|     limit      | varchar |  5   |      | 工作年限 |
| contact_number |   int   |  11  |      | 联系电话 |

### ***职位简历关联表relevance***

|     名      |  类型   | 长度 |  键  |  备注  |
| :---------: | :-----: | :--: | :--: | :----: |
|     id      |   int   |  5   | true |        |
| position_id | varchar |  10  |      | 职位id |
|  resume_id  | varchar |  10  |      | 简历id |



### 接口

https://console-docs.apipost.cn/preview/d1ea861daa00b5b2/0ebbe7f8f8e7c19d





初始化node文件

```bash
npm i
```

启动命令

```bash
node index.js
```








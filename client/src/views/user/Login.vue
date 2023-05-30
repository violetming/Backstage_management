<template>
  <div>
    <p>账号xm001</p>
    <p>123456</p>
    <div class="back">
    <el-form
    class="form"
    label-position="left"
    :model="form"
    :rules="rules"
    ref="form"
    >
      <p class="title">招聘后台管理系统</p>
      <el-form-item
      prop='username'
      >
        <el-input
        v-model="form.username"
         placeholder='请输入管理员账号'></el-input>
      </el-form-item>
        <el-form-item
        prop='password'
        >
        <el-input
        v-model="form.password"
        type="password"
         placeholder='请输入管理员密码'></el-input>
      </el-form-item>
      <el-form-item
      prop='vercion'
      >
        <div class="validation">
          <el-input 
          @blur='handleBlur'
          v-model="form.vercion"
          style="width:180px" placeholder='输入验证码'></el-input>
          <div ref="qwe" style="width:100px;heidth:40px"></div>
        </div>
      </el-form-item>
      <el-form-item class="btn">
        <el-button type="primary" @click="onSubmit()" style="width:100px">登陆</el-button>
        <el-button type="primary" style="width:100px">注册</el-button>
      </el-form-item>
    </el-form>
    {{cion}}
    </div>
  </div>
</template>

<script>
import httpApi from '@/http';
import {KEYS,set} from '@/utils/Storage';
  export default {
    data() {
      return {
        form: {
          username:'',
          password:'',
          vercion:'',
        },
        judge:true,
        cion:0,
        
        rules: {
        username: [
          { required: true, message: "请填写用户名", trigger: "blur" },
          {
            pattern: /^\w{3,15}$/,
            message: "3~15位字符，可以包含：数字、字母、下划线",
            trigger: "blur",
          },
        ],
        password: [
          { required: true, message: "请填写用户名", trigger: "blur" },
          {
            pattern: /^\w{6,15}$/,
            message: "6~15位字符，可以包含：数字、字母、下划线",
            trigger: "blur",
          },
        ],
        vercion:[
          { required: true, message: "请填验证码", trigger: "blur" },
          {
            pattern: /^\w{6}$/,
            message: "6位数字",
            trigger: "blur",
          },
        ]
      },
      }
    },
    methods:{

      handleBlur(){
        let code=this.form.vercion
        httpApi.verificationApi.verify({code}).then(res=>{
          console.log(res.data.success);
          this.judge= res.data.success
        })
      },
      onSubmit(){
        console.log(this.judge);
        this.$refs['form'].validate((valid)=>{
          if(valid){
        let params={
          username:this.form.username,
          password:this.form.password
        }
      if(this.judge){
      httpApi.LoginApi.login(params).then(res=>{
        console.log(res);
        if(res.data.code==200){
          // 存储vuex
          this.$store.commit('updateUser',res.data.data.user)
          this.$store.commit('saveToken',res.data.data.token)
          // 存入sesssionStorage
          set(KEYS.USER_INFO,res.data.data.user)
          set(KEYS.TOKEN,res.data.data.token)
          this.$router.replace('/home/index')
          this.$message({
            message:'成功',
            type:'success'
          })
        }else{
          this.$message({
            message:res.data.msg,
            type:'error'
          })
        }
      })
}else{
            this.$message({
            message:'验证码错误',
            type:'error'
          })
}
          }
        })
      },
      verification(){
        const canvas = document.createElement('canvas');
        const ctx = canvas.getContext('2d');
        const width = 100;
        const height = 40;

        // 设置 canvas 宽度和高度
        canvas.width = width;
        canvas.height = height;

        // 随机背景填充色
        ctx.fillStyle = `rgb(${getRandomColor()}, ${getRandomColor()}, ${getRandomColor()})`;
        ctx.fillRect(0, 0, width, height);

        // 绘制干扰线条
        for(let i=0; i<8; i++) {
          ctx.beginPath();
          ctx.moveTo(Math.random()*width, Math.random()*height);
          ctx.lineTo(Math.random()*width, Math.random()*height);
          ctx.strokeStyle = `rgb(${getRandomColor()}, ${getRandomColor()}, ${getRandomColor()})`;
          ctx.stroke();
        }

        // 生成随机数字
        const captchaText = this.cion

        // 在 canvas 上绘制文本
        ctx.font = "bold 24px sans-serif";
        ctx.textAlign = "center";
        ctx.textBaseline = "middle";
        for(let i=0; i<captchaText.length; i++) {
          ctx.save();
          ctx.fillStyle = `rgb(${getRandomColor()}, ${getRandomColor()}, ${getRandomColor()})`;
          ctx.fillText(captchaText.charAt(i), 15+i*15, 20);
          ctx.restore();
        }

        // 打包成图片
        const captchaImg = new Image();
        captchaImg.src = canvas.toDataURL();

        // 将图片添加到 HTML 中
        this.$refs.qwe.appendChild(captchaImg);

        // 获取随机颜色
        function getRandomColor() {
          return Math.floor(Math.random() * 256);
        }
      }
      
    }, 
    // 生命周期函数
    async mounted(){
      await httpApi.verificationApi.captcha().then(res=>{
        this.cion=res.data.code
      })
       this.verification()
    }
  }
</script>

<style lang="scss" scoped>


.form {
  display: block;
  width: 300px;
  position: absolute;
  top: 30%;
  left: 40%;
  .title{
  text-align: center;
  padding-bottom: 5px;
  font-size: 20px;
  font-weight: bold;
}
.btn{
  display: flex;
  justify-content: center;
  align-content: center;
}
.validation{
display: flex;
justify-content: space-between
}
}
</style>
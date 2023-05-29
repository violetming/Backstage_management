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
      <el-form-item class="btn">
        <el-button type="primary" @click="onSubmit()" style="width:100px">登陆</el-button>
        <el-button type="primary" style="width:100px">注册</el-button>
      </el-form-item>
    </el-form>
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
          password:''
        },
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
      },
      }
    },
    methods:{
      onSubmit(){
        console.log(this.form.username);
        let params={
          username:this.form.username,
          password:this.form.password
        }
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
      }
      
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
}
</style>
<template>
  <div>
    <div class="back">
    <el-form
    class="form"
    label-position="left"
    :model="form"
    >
      <p class="title">招聘后台管理系统</p>
      <el-form-item>
        <el-input
        v-model="form.username"
         placeholder='请输入管理员账号'></el-input>
      </el-form-item>
        <el-form-item>
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
  export default {
    data() {
      return {
        form: {
          username:'',
          password:''
        }
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
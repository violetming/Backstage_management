<template>
  <div class="qwe">
<el-form size='small' style="width:500px" ref="form" :model="form" label-width="80px">
  <el-form-item label="姓名">
    <el-input v-model="form.name"></el-input>
  </el-form-item>
    <el-form-item label="性别">
      <el-radio v-model="form.sex" label="1">男</el-radio>
      <el-radio v-model="form.sex" label="0">女</el-radio>
  </el-form-item>
    <el-form-item label="出生日期">
        <el-date-picker
      v-model="form.irthday"
      type="date"
      placeholder="选择日期">
    </el-date-picker>
  </el-form-item>
  <el-form-item label="手机号">
    <el-input v-model="form.phone"></el-input>
  </el-form-item>
      <el-form-item label="邮箱">
    <el-input v-model="form.email"></el-input>
  </el-form-item>
    <el-form-item label="专业">
    <el-input v-model="form.major"></el-input>
  </el-form-item>
    <el-form-item label="学历">
      <el-select v-model="form.education" placeholder="请选择">
    <el-option
      v-for="item in options"
      :key="item.id"
      :label="item.eduvation"
      :value="item.eduvation">
    </el-option>
  </el-select>
  </el-form-item>
    <el-form-item label="工作年限">
    <el-select v-model="form.experience" placeholder="请选择">
    <el-option
      v-for="item in limitOptions"
      :key="item.id"
      :label="item.limit"
      :value="item.limit">
    </el-option>
  </el-select>
  </el-form-item>
    <el-form-item label="籍贯">
        <el-select v-model="form.native" placeholder="请选择">
    <el-option
      v-for="item in regionOptions"
      :key="item.id"
      :label="item.region"
      :value="item.region">
    </el-option>
  </el-select>
  </el-form-item>
    <el-form-item label="求职岗位">
    <el-input v-model="form.post"></el-input>
  </el-form-item>
    <el-form-item label="期望薪资">
    <el-input v-model="form.monthly"></el-input>
  </el-form-item>
      <el-form-item label="工作经验">
    <el-input v-model="form.through"></el-input>
  </el-form-item>

  <el-form-item>
    <el-button type="primary" @click="onSubmit">立即创建</el-button>
    <el-button>取消</el-button>
  </el-form-item>
</el-form>
  </div>
</template>

<script>
import httpApi from '@/http';
  export default {
    data() {
      return {
        form: {
          id:this.$route.params.id,
          name: '',
          sex:'',
          irthday:"",
          major:'',
          education:'',
          experience:'',
          native:'',
          post:'',
          monthly:'',
          through:'',
          phone:'',
          email:''
        },
        options:[],
        limitOptions:[],
        regionOptions:[],
      }
    },
    methods: {
      onSubmit() {
        httpApi.resumApi.update(this.form).then(res=>{
          if(res.data.code==200){ // 添加成功
              this.$router.push('/home/resumelist')
            }else {
              this.$message({
                message: '修改失败',
                type: 'error'
              })
              // this.$refs['form'].resetFields()
            }
        })
      }
    },
    mounted(){
      let id=this.form.id
      httpApi.resumApi.queryid({id}).then(res=>{
        console.log(res.data.data);
        this.form=res.data.data
      })
      httpApi.othersApi.education().then(res=>{
        this.options=res.data.data
      }),
      httpApi.othersApi.limit().then(res=>{
        this.limitOptions=res.data.data
      }),
      httpApi.othersApi.region().then(res=>{
        this.regionOptions=res.data.data
      })
    }
  }
</script>

<style lang="scss" scoped>
.qwe{
  display: flex;
  justify-content: center;
  margin-top: 20px;
}
</style>
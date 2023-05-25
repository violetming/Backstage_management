<template>
  <div>
    <div style="margin-top: 15px;width:500px;">
      <el-input placeholder="请输入内容" v-model="inputsearch" class="input-with-select">
        <el-select v-model="select" slot="prepend" placeholder="请选择">
          <el-option label="姓名" value="1"></el-option>
          <el-option label="电话号码" value="2"></el-option>
        </el-select>
        <el-button @click="handleClick" slot="append" icon="el-icon-search"></el-button>
      </el-input>
    </div>
    <div>
      <el-table
      :data="tableData"
      style="width: 100%"
      >
        <el-table-column
        
        width="100px"
        prop='name'
        label="姓名">
        </el-table-column>
        
        <el-table-column
         width="150px"
        prop="phone"
        label="手机号">
        </el-table-column>
        
        <el-table-column
        width="150px"
        prop="major"
        label="专业">
        </el-table-column>
        
        <el-table-column
        width="100px"
        prop="education"
        label="学历">
        </el-table-column>
        
        <el-table-column
        prop="post"
        label="求职岗位">
        </el-table-column>
        
        <el-table-column
        prop="email"
        label="邮箱">
        </el-table-column>

        <el-table-column label="操作">
          <template slot-scope="scope">
            <el-button
              size="mini"
              @click="handleEdit(scope.row.id)">编辑</el-button>
            <el-button
              size="mini"
              type="danger"
              @click="handleDelete(scope.row.id)">删除</el-button>
          </template>
        </el-table-column>
      </el-table>
    </div>
  </div>
</template>

<script>
import httpApi from '@/http';

  export default {
    data(){
      return{
        select:'',
        inputsearch:'',
        tableData:[],
      }
    },
    //方法
    methods:{
      handleClick(){
        let qwe=this.inputsearch
        if(!this.select){
          this.enablement()
        }else if(this.select==1){
          httpApi.resumApi.queryname({name:qwe}).then(res=>{
          this.tableData=res.data.data
            this.inputsearch=''
          })
        }else if(this.select==2){
          httpApi.resumApi.queryphone({phone:qwe}).then(res=>{
          this.tableData=res.data.data
            this.inputsearch=''
          })
        }
      },
      enablement(){
        httpApi.resumApi.queryall().then(res=>{
          console.log(res.data.data);
          this.tableData=res.data.data
        })
      },
        handleEdit(row) {
        console.log(row);

      },
      handleDelete(row) {
        console.log(row);
      }
    },
    // 生命周期函数
    mounted(){
      this.enablement()
    }
  }
</script>

<style lang="scss">
  .el-select .el-input {
    width: 130px;
  }
</style>
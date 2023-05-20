<template>
  <div>
        <el-form :inline="true" @submit.native.prevent>
      <el-form-item label="姓名:">
        <el-input 
        placeholder="请输入演员姓名关键字" 
        @keyup.native.enter='search'
        v-model="name"></el-input>
      </el-form-item>
      <el-form-item>
        <el-button type='primary' @click="search">查询</el-button>
      </el-form-item>
    </el-form>
        <el-divider content-position='left'>演员列表</el-divider>
        <person
        @delete="deleteActor(item.id,$event)"
     v-for="item in actors" 
     :key="item.id" 
     :name="item.director_name" 
     :avatar="item.director_avatar">
        </person>
  </div>
</template>

<script>
import Person from '@/components/Person.vue';
import httpApi from '@/http/index'
  export default {
    components:{ Person },
    data() {
      return {
        name:'',
        actors:[]
      }
    },
    methods: {
          deleteActor(id,e){
            this.$confirm('此操作将永久删除该文件, 是否继续?', '提示', {
            confirmButtonText: '确定',
            cancelButtonText: '取消',
            type: 'warning'
        }).then(()=>{
/*           let url='http://localhost:3010/movie-actor/del'
          myaxios.post(url,{id}).then(res=>{
            console.log('删除演员结果',res);
            if(res.data.code==200){
              this.search()
            }
          }) */
          httpApi.directorApi.delete({id}).then((res)=>{
            console.log(res);
            if(res.data.code==200){
              this.search()
            }
          })
        }).catch(()=>{
          this.$message({
            type:'info',
            message:'已取消删除'
          })
        })
    },
      search() {
        if(this.name.trim()){ //有关键字执行模糊查询
        this.listActorsByName()
      }else{
        this.listDirector()
      }
      },
      listDirector(){
        httpApi.directorApi.queryAlldirectors().then((res)=>{
          console.log(res.data.data);
          this.actors=res.data.data
        })
      },
          listActorsByName(){
/*       let url='http://localhost:3010/movie-actors/name'
      myaxios.post(url,{name:this.name}).then(res=>{
        console.log('模糊查询',res);
        this.actors=res.data.data
      }) */
      httpApi.directorApi.querydirectorsByName({name:this.name}).then(res=>{
        this.actors=res.data.data
      })
    },
    },
    mounted(){
      this.listDirector()
    }
  }
</script>

<style lang="scss" scoped>

</style>
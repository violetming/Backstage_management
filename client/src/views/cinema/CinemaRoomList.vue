<template>
  <div>
    <!-- 放映厅页面 -->
    <el-button
      @click="dialogFormVisible = true"
     type='primary' plain>新增放映厅</el-button>
    <el-divider content-position='left'>放映厅列表</el-divider>
    <!-- 放映厅表格数据 -->
    <el-table :data='rooms'>
      <el-table-column prop="room_name" label="放映厅名称"></el-table-column>
      <el-table-column prop="room_type" label="放映厅类型"></el-table-column>
      <el-table-column prop="date" label="放映厅座位">
        <template>
          [暂未分配作为模板]
        </template>
      </el-table-column>
      <el-table-column prop="date" label="操作">
        <template slot-scope="scope">
          <el-button size="small" type="success" icon="el-icon-view" circle></el-button>
          <el-button size="small" type="primary" icon="el-icon-plus"  @click="$router.push(`/home/showingon-plan-Add/${scope.row.id}`)" circle></el-button>
          <el-button size="small" type="warning" icon="el-icon-s-grid" circle></el-button>
          <el-button size="small" type="danger" icon="el-icon-delete" circle @click='qwe(scope.row.id)'></el-button>
        </template>
      </el-table-column>
    </el-table>

<!-- 自定义新增放映厅的对话框 -->
    <el-dialog title="新增放映厅" :visible.sync="dialogFormVisible">
  <el-form
   :rules="rules" ref="for"
   :model="form">
    <el-form-item label="放映厅名称" :label-width="formLabelWidth" prop="room_name">
      <el-input v-model="form.room_name" autocomplete="off"></el-input>
    </el-form-item>
    <el-form-item label="放映厅类型" :label-width="formLabelWidth">
      <el-select v-model="form.room_type" placeholder="请选择放映厅类型" prop="room_type">
        <el-option
         v-for="item in types" :key="item.id"
         :label="item.type_name" :value="item.type_name"></el-option>
      </el-select>
    </el-form-item>
  </el-form>
  <div slot="footer" class="dialog-footer">
    <el-button @click="dialogFormVisible = false">取 消</el-button>
    <el-button type="primary" @click="submit">确 定</el-button>
  </div>
    </el-dialog>

  </div>
</template>

<script>
import httpApi from '@/http';
  export default {
    data() {
      return {
        dialogFormVisible: false,
        form: {
          room_name: '',
          room_type:'',
          movie_cinema_id:this.$route.params.id,
        },
        rules: {
          room_name:[
            {required:true,message:'必填项',trigger:'blur'}
          ],
          room_type:[
            {required:true,message:'必填项',trigger:'blur'}
          ],
          movie_cinema_id:[
            {required:true,message:'必填项',trigger:'blur'}
          ],
        },
        types:[],
        rooms:[],
        formLabelWidth: '120px'
      }
    },
    mounted(){
      // 加载类型列表
      this.listqwe()
      // 加载放映厅列表
      this.listRooms()
    },
    methods: {
      listRooms(){
        let params={cinema_id:this.form.movie_cinema_id}
        httpApi.cinemaRoomApi.list(params).then(res=>{
          console.log(res);
          this.rooms=res.data.data
        })
      },
      submit(){
        this.$refs['for'].validate((valid)=>{
          if(valid){
            console.log(this.form);
            httpApi.cinemaRoomApi.add(this.form).then(res=>{
              if(res.data.code==200){
                this.$message({
                  message:'添加成功',
                  type:"success"
                })
              }else{
                this.$message.error('错了哦');
              }
            })
            this.dialogFormVisible = false
            this.listRooms()
            }
        })

      },
      listqwe(){
        httpApi.cinemaRoomApi.queryAllTypes().then(res=>{
        console.log(res);
        this.types =res.data.data
      })
      },
      qwe(id){
        console.log(id);
        let params={id}
        httpApi.cinemaRoomApi.delete(params).then(res=>{
          if(res.data.code==200){
            this.$message({
              message:'删除成功',
              type:"success"
            })
          }else{
            this.$message.error('错了哦');
          }
        })
        this.listRooms()
      }
    },
    
  }
</script>

<style lang="scss" scoped>

</style>
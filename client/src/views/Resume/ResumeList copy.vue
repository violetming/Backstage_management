<template>
  <div class="space-top">
    <b>人才筛选</b>
    <a-space direction="vertical">
    <a-input-search
      v-model:value="value"
      placeholder="输入需要"
      style="width: 200px"
      @search="onSearch"
    />
  </a-space>
  </div>

  <div class="table">
    <a-table :columns="columns" :data-source="data"></a-table>
  </div>
</template>

<script setup>
import { onMounted } from 'vue';
import httpApi from '@/http';
import {ref,reactive} from 'vue';

const value = ref('');
const onSearch = () => {
      console.log(value.value);
      httpApi
    };
    
    const asd=ref([])
    onMounted(()=>{
      httpApi.resumApi.queryall().then(res=>{
        console.log(res.data.data);
        let movies=res.data.data
        console.log(movies);
        asd.value=movies
      })
    })
console.log('@@@@@',asd);


const data = ref([
  {
    name: 'John Brown',
    sex: 1,
    major: 32,
    education: 'New York No. 1 Lake Park',
    post:'fawe',
    phone:'dqw',
    email:'fwe'
  },
]);
const columns = ref([
  {
    title: '姓名',
    dataIndex: 'name',
    key: 'name',
  },
  {
    title: '性别',
    dataIndex: 'sex',
    key: 'sex',
  },
  {
    title: '专业',
    dataIndex: 'major',
    key: 'major',
  },
  {
    title: '学历',
    dataIndex: 'education',
    key: 'education',
  },
  {
    title: '求职岗位',
    dataIndex: 'post',
    key: 'post',
  },
  {
    title: '手机号码',
    dataIndex: 'phone',
    key: 'phone',
  },
  {
    title: '邮箱',
    dataIndex: 'email',
    key: 'email',
  },
]);

</script>

<style lang="scss" scoped>
.space-top{
  background-color: #dfe6e9;
  display: flex;
  flex-direction: column;
  margin-left: 20px;
  padding: 10px 5px;
  border-radius: 5px;
  box-shadow: 0 0 1px #000000;
  >b{
    margin-bottom: 5px;
  }
}
.table{
  margin: 15px;

}
</style>
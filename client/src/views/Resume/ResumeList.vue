<template>
  <div>
    <h1>这是人才简历查询页面</h1>
  </div>
</template>

<script setup>
import { onMounted } from 'vue';
import httpApi from '@/http';


onMounted(()=>{

  httpApi.resumApi.queryall().then(res=>{
    console.log(res);
  })

})

</script>

<style lang="scss" scoped>

</style>
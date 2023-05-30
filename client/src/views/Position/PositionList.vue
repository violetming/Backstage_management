<template>
  <div>
    
  </div>
</template>

<script>
import httpApi from '@/http'
  export default {
    data() {
      return {
        
      }
    },
    mounted(){
      httpApi.positionApi.queryall({}).then(res=>{
        console.log(res);
      })
    }
  }
</script>

<style lang="scss" scoped>

</style>
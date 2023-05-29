<template>
  <div >
    <el-container
    >
      <el-aside 
      class="aside"
      style="width:200px"
      >
        <el-menu 
        router
        :default-active="$route.path" 
        :style="{ height: '100vh' }"
        class="el-menu-vertical-demo">
          <el-menu-item class="menuitem-top">
            <img width="30px" src="../assets/logo.svg" alt="" />
            <template slot="title">
              <span style="font-size: 1.2em; color:#636e72; font-weight: bold">
                &nbsp;招聘</span>
            </template>
          </el-menu-item>
          <el-menu-item index="/home/index">
            <i class="el-icon-message"></i>
            <template slot="title"> 首页 </template>
          </el-menu-item>

          <el-submenu index="1">
            <template slot="title">
              <i class="el-icon-location"></i>
              <span slot="title">人才管理</span>
            </template>
            <el-menu-item index="/home/resumelist">
              <i class="el-icon-notebook-2"></i>
              <span slot="title">人才列表</span>
            </el-menu-item>
            <el-menu-item index="/home/resumeadd">
              <i class="el-icon-plus"></i>
              <span slot="title">新增人才</span>
            </el-menu-item>
          </el-submenu>

          <el-submenu index="3">
            <template slot="title">
              <i class="el-icon-location"></i>
              <span slot="title">企业管理</span>
            </template>
            <el-menu-item index="/home/movie-list">
              <i class="el-icon-notebook-2"></i>
              <span slot="title">企业列表</span>
            </el-menu-item>
            <el-menu-item index="/home/movie-add">
              <i class="el-icon-plus"></i>
              <span slot="title">企业信息</span>
            </el-menu-item>
            <el-menu-item index="/home/movie-add">
              <i class="el-icon-plus"></i>
              <span slot="title">新增企业</span>
            </el-menu-item>
          </el-submenu>


        </el-menu>
      </el-aside>
      <el-container>
        <el-header class="header">
          <!-- 面包屑导航 -->
          <el-breadcrumb separator-class="el-icon-arrow-right">
            <el-breadcrumb-item 
            v-for="item in $route.meta.breadcrumbs" :key="item"
            >
            {{item}}
            </el-breadcrumb-item>
          </el-breadcrumb>
          <div>
            <i class="el-icon-user-solid"></i>
            <span>{{user.name}}</span> |
            <span>{{user.username}}</span> |
            <i class="el-icon-phone"></i>
            <span>{{user.phone}}</span>
          </div>

        </el-header>
        <el-main>

          <!-- 二级路由占位符 -->
          <router-view/>
        </el-main>
      </el-container>
    </el-container>
  </div>
</template>

<script>
import store from '@/store'
export default {
  data() {
    return {
      
    };
  },
  methods: {

  },
  computed:{
    user(){
      return store.state.user
    }
  }
};
</script>

<style>
.el-menu-vertical-demo:not(.el-menu--collapse) {
  width: 200px;
  min-height: 400px;
}
.aside::-webkit-scrollbar {
  display: none;
}
.el-menu-vertical-demo:not(.el-menu--collapse) {
  width: 240px;
  min-height: 400px;
}
.menuitem-top{
  margin: 0 30px;
}
.aside{
  box-shadow: 1px 0 3px 2px  #ccc;
  margin-right: 5px;
}
.header {
  display: flex;
  align-items: center;
  justify-content: space-between;
  border-bottom: 1px solid #ccc;
  box-shadow: 1px 0 3px 2px  #ccc;
}
</style>

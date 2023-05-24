<template>
  <div>
    <el-container>
      <el-aside 
      class="aside"
      style="width:200px"
      >
        <el-menu 
        router
        default-active="2" 
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
            <el-menu-item index="/home/resumeupdate">
              <i class="el-icon-plus"></i>
              <span slot="title">新增人才</span>
            </el-menu-item>
          </el-submenu>

<!--           <el-submenu index="3">
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
          </el-submenu> -->

<!-- 
          <el-submenu index="4">
            <template slot="title">
              <i class="el-icon-location"></i>
              <span slot="title">电影院管理</span>
            </template>
            <el-menu-item index="/home/cinema-list">
              <i class="el-icon-notebook-2"></i>
              <span slot="title">电影院列表</span>
            </el-menu-item>
            <el-menu-item index="/home/cinema-add">
              <i class="el-icon-plus"></i>
              <span slot="title">新增电影院</span>
            </el-menu-item>
          </el-submenu> -->

        </el-menu>
      </el-aside>
      <el-container>
        <el-header class="header">
          <el-breadcrumb separator-class="el-icon-arrow-right">
            <el-breadcrumb-item :to="{ path: '/' }">首页</el-breadcrumb-item>
            <el-breadcrumb-item>活动管理</el-breadcrumb-item>
            <el-breadcrumb-item>活动列表</el-breadcrumb-item>
            <el-breadcrumb-item>活动详情</el-breadcrumb-item>
          </el-breadcrumb>
          <span>未登录</span>
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
export default {
  data() {
    return {
      
    };
  },
  methods: {

  },
};
</script>

<style>
.el-menu-vertical-demo:not(.el-menu--collapse) {
  width: 200px;
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

<template>
  <a-layout>
    <!-- 左边菜单栏 -->
    <a-layout-sider theme="light">
  <div>
    <div style="margin: 0 20px;">
      <img width="64" src="../assets/logo.svg" alt="">
    <span style="font-size: 20px;">
      后台管理
    </span>
    </div>
    <a-menu
    mode="inline"
    router
    >
    <a-menu-item>首页</a-menu-item>
      <a-sub-menu>
        <template #icon>
          <user-outlined />
        </template>
        <template #title>人才</template>
        <a-menu-item key="1">人才管理</a-menu-item>
        <a-menu-item key="2">人才简历</a-menu-item>
        <a-menu-item key="3">简历详情</a-menu-item>
      </a-sub-menu>
      <a-sub-menu>
        <template #icon></template>
        <template #title>
          <AppstoreOutlined />
          企业
        </template>
        <a-menu-item key="5">企业管理列表</a-menu-item>
        <a-menu-item key="6">企业信息</a-menu-item>
      </a-sub-menu>
      <a-sub-menu>
        <template #icon>
          <SettingOutlined />
        </template>
        <template #title>权限</template>
        <a-menu-item key="9">权限列表</a-menu-item>
        <a-menu-item key="10">Option 10</a-menu-item>
        <a-menu-item key="11">Option 11</a-menu-item>
        <a-menu-item key="12">Option 12</a-menu-item>
      </a-sub-menu>
      <a-sub-menu>
        <template #icon>
          <SettingOutlined />
        </template>
        <template #title>账号</template>
        <a-menu-item key="9">账号详情</a-menu-item>
        <a-menu-item key="10">修改账号信息</a-menu-item>
        <a-menu-item key="11">修改密码</a-menu-item>
        <a-menu-item key="12">Option 12</a-menu-item>
      </a-sub-menu>
    </a-menu>
  </div>
    </a-layout-sider>
    <a-layout>
      <!-- 顶部区域 -->
      <a-layout-header
      style="background-color: antiquewhite;"
      >
        <span>用户名</span>
        <span>账号</span>
        <span>头像</span>
      </a-layout-header>

      <!-- 内容区域 -->
      <a-layout-content>

        <router-view></router-view>

      </a-layout-content>
    </a-layout>
  </a-layout>
</template>

<script setup>

import {AppstoreOutlined, SettingOutlined,UserOutlined } from '@ant-design/icons-vue';  /* 这几个映入是图标 */

</script>

<style>
.ant-layout-sider-children{
  height: 100vh;
}
.ant-layout-header{
  text-align: end;
}

</style>
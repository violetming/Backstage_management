import Vue from 'vue'
import VueRouter from 'vue-router'

Vue.use(VueRouter)

const routes = [
  {
    path: '/',
    redirect:'/home/index'
  },
  {
    path: '/home',
    name: 'home',
    component:()=>import('../views/HomeView.vue'),
    children:[
      {
      path:'index',
      name:'/home/index',
      component:()=>import('../views/Index.vue'),
      meta:{
        breadcrumbs:['首页']
      }
    },
    {
      path:'resumelist',
      name:'/home/resumelist',
      component:()=>import('../views/Resume/ResumeList.vue'),
      meta:{
        breadcrumbs:['首页','人才管理','人才列表']
      }
    },
    {
      path:'resumeadd',
      name:'/home/resumeadd',
      component:()=>import('../views/Resume/ResumeAdd.vue'),
      meta:{
        breadcrumbs:['首页','人才管理','新增人才']
      }
    },
    {
      path:'resumeupdate/:id',
      name:'/home/resumeupdate/id',
      component:()=>import('../views/Resume/ResumeUpdate.vue'),
      meta:{
        breadcrumbs:['首页','人才管理','修改人才']
      }
    }
  ]
  },
  {
    path: '/login',
    name: '/login',
    component: () => import('../views/user/Login.vue'),
  },
]

const router = new VueRouter({
  mode: 'history',
  base: process.env.BASE_URL,
  routes
})



export default router

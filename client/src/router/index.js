import { createRouter, createWebHistory } from 'vue-router'

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
      component:()=>import('../views/Index.vue')
    },
    {
      path:'resumelist',
      name:'/home/resumelist',
      component:()=>import('../views/Resume/ResumeList.vue')
    },
    {
      path:'resumeadd',
      name:'/home/resumeadd',
      component:()=>import('../views/Resume/ResumeAdd.vue')
    }
  ]
  },
] 

const router = createRouter({
  history: createWebHistory(),
  routes
})

export default router

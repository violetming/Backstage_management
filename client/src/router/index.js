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
    },
    {
      path:'resumeupdate/:id',
      name:'/home/resumeupdate/id',
      component:()=>import('../views/Resume/ResumeUpdate.vue')
    }
  ]
  },
]

const router = new VueRouter({
  mode: 'history',
  base: process.env.BASE_URL,
  routes
})

export default router

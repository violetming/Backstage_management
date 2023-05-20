import Vue from 'vue'
import VueRouter from 'vue-router'
import HomeView from '../views/HomeView.vue'

Vue.use(VueRouter)

const routes = [
  {
    path:'/',
    redirect:'/home/index'
  },
  {
    path: '/home',
    name: 'home',
    component: HomeView,
    children:[{
      path:'index',
      name:'/home/index',
      component:()=>import('../views/Index.vue')
    },
    /* 演员 */
    {
      path:'actor-list',
      name:'/home/actor-list',
      component:()=>import('../views/actor/ActorList.vue'),
      meta: {
        breadcrumbs: ['演员管理', '演员列表']
      }
    },
    {
      path:'actor-add',      
      name:'/home/actor-add',
      component:()=>import('../views/actor/ActorAdd.vue'),
      meta: {
        breadcrumbs: ['演员管理', '新增演员']
      }
    },
    /* 导演 */
    {
      path:'director-add',      
      name:'/home/actor-add',
      component:()=>import('../views/director/directoAdd.vue'),
      meta: {
        breadcrumbs: ['导演管理', '新增导演']
      }
    },
    {
      path:'director-list',      
      name:'/home/actor-list',
      component:()=>import('../views/director/directorList.vue'),
      meta: {
        breadcrumbs: ['导演管理', '导演列表']
      }
    },
    /* 电影 */
    {
      path:'movie-list',      
      name:'/home/movie-list',
      component:()=>import('../views/movie/MovieList.vue'),
      meta:{
        // 记录当前路由对应的面包屑导航列表
        breadcrumbs:['电影管理','电影列表']
      }
    },
    {
      path:'movie-list/:page',      
      name:'/home/movie-list/page',
      component:()=>import('../views/movie/MovieList.vue'),
      meta:{
        // 记录当前路由对应的面包屑导航列表
        breadcrumbs:['电影管理','电影列表']
      }
    },
    {
      path:'movie-add',
      name:'/home/movie-add',
      component:()=>import("../views/movie/MovieAdd.vue"),
      meta: {
        breadcrumbs: ['电影管理', '新增电影']
      }
    },
    {
      path:'movie-update/:id',
      name:'/home/movie-update/id',
      component:()=>import("../views/movie/MovieUpdate.vue"),
      meta: {
        breadcrumbs: ['电影管理', '电影列表', '修改电影信息']
      }
    },
    /* 电影院 */
    {
      path: 'cinema-list',
      name: 'cinema-list',
      component: () => import('../views/cinema/CinemaList.vue'),
      meta: {
        breadcrumbs: ['电影院管理', '电影院列表']
      }
    },
    {
      path: 'cinema-add',
      name: 'cinema-add',
      component: () => import('../views/cinema/CinemaAdd.vue'),
      meta: {
        breadcrumbs: ['电影院管理', '新增电影院']
      }
    },
    {
      path: 'cinema-room-list/:id',
      name: 'cinema-room-list',
      component: () => import('../views/cinema/CinemaRoomList.vue'),
      meta: {
        breadcrumbs: ['电影院管理', '电影院列表','放映厅列表']
      }
    },
    {
      path: 'showingon-plan-Add/:roomId',
      name: 'showingonPlanAdd',
      component: () => import('../views/cinema/showingonPlanAdd.vue'),
      meta: {
        breadcrumbs: ['电影院管理', '放映厅计划']
      }
    },
    {
      path: 'cinemaupdate/:id',
      name: 'showingonPlanAdd',
      component: () => import('../views/cinema/CinemaUpdate.vue'),
      meta: {
        breadcrumbs: ['电影院管理', '放映厅计划']
      }
    },
  ]
  },
  {
    path: '/about',
    name: 'about',
    // route level code-splitting
    // this generates a separate chunk (about.[hash].js) for this route
    // which is lazy-loaded when the route is visited.
    component: () => import(/* webpackChunkName: "about" */ '../views/AboutView.vue')
  }
]

const router = new VueRouter({
  mode: 'history',
  base: process.env.BASE_URL,
  routes
})

export default router

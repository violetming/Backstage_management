import Vue from 'vue'
import Vuex from 'vuex'
import {KEYS,get} from '@/utils/Storage'
Vue.use(Vuex)

export default new Vuex.Store({
  state: {
    user:get(KEYS.USER_INFO),
    token:get(KEYS.TOKEN)
  },
  getters: {
  },
  mutations: {
    updateUser(state,payload){
      state.user=payload
    },
    saveToken(state,token){
      state.token=token
    }
  },
  actions: {
  },
  modules: {
  }
})

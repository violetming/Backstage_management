import Vue from 'vue'
import App from './App.vue'
import router from './router'
import store from './store'
import ElementUI from 'element-ui';
import 'element-ui/lib/theme-chalk/index.css';
Vue.use(ElementUI);

// 声明全局变量UPLOADURL，保存上传文件的url前缀
window._AMapSecurityConfig = {
  securityJsCode:'8f75dcea46fc19e25999ca258ec363cd',
}

import BaseUrl from './http/BaseUrl'

Vue.prototype.UPLOADURL=BaseUrl.UPLOADURL;

Vue.config.productionTip = false



new Vue({
  router,
  store,
  render: h => h(App)
}).$mount('#app')

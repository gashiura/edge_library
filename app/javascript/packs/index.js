import Vue from 'vue';
import Router from '../routes/router';
import Store from '../store/store';
import App from '../app.vue';

import PaginationNav from 'bootstrap-vue/es/components/pagination-nav';
Vue.use(PaginationNav);

const vm = new Vue({
  el: '#app',
  router: Router,
  store: Store,
  render: h => h(App)
});

window.vm = vm;

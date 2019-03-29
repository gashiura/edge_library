import Vue from 'vue';
import VueRouter from 'vue-router';
import Login from '../components/login.vue';
import Home from '../components/home/home.vue';
import Books from '../components/books/books.vue';
import Book from '../components/books/book.vue';
import store from '../store/store';

Vue.use(VueRouter);

const router = new VueRouter({
  mode: 'hash',
  routes: [
    { path: '/login', component: Login },
    { path: '/', component: Home, meta: { requiresAuth: true } },
    { path: '/books', component: Books, meta: { requiresAuth: true } },
    { path: '/book/:id', component: Book, meta: { requiresAuth: true } }
  ]
});

router.beforeEach((to, from, next) => {
  if (to.matched.some(record => record.meta.requiresAuth) && store.getters.loggedIn === false) {
    next({ path: '/login' });
  } else {
    next();
  }
});

export default router;

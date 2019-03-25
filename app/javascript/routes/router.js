import Vue from 'vue';
import VueRouter from 'vue-router';
import Login from '../components/login.vue';
import Home from '../components/home/home.vue';
import Books from '../components/books/books.vue';
import Book from '../components/books/book.vue';

Vue.use(VueRouter);

const router = new VueRouter({
  mode: 'hash',
  routes: [
    { path: '/login', component: Login },
    { path: '/', component: Home },
    { path: '/books', component: Books },
    { path: '/book/:id', component: Book }
  ]
});

router.beforeEach((to, from, next) => {
  if (to.matched.some(record => record.meta.requiresAuth) && !Auth.loggedIn) {
    next({ path: '/login', query: { redirect: to.fullPath } });
  } else {
    next();
  }
});

export default router;

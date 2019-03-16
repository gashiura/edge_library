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
    { path: '/', component: Login },
    { path: '/home', component: Home },
    { path: '/books', component: Books },
    { path: '/book/:id', component: Book }
  ]
});

export default router;

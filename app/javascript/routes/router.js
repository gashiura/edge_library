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
    {
      path: '/login',
      name: 'login',
      component: Login
    },
    {
      path: '/',
      name: 'home',
      meta: {
        requiresAuth: true,
        breadclumbs: [
          {
            pageName: 'ホーム',
            routeName: 'home'
          }
        ]
      },
      component: Home
    },
    {
      path: '/books/:searchString',
      name: 'books',
      component: Books,
      meta: {
        requiresAuth: true,
        breadclumbs: [
          {
            pageName: 'ホーム',
            routeName: 'home'
          },
          {
            pageName: '書籍一覧',
            routeName: 'books'
          }
        ]
      }
    },
    {
      path: '/book/:id',
      name: 'book',
      component: Book,
      meta: {
        requiresAuth: true,
        breadclumbs: [
          {
            pageName: 'ホーム',
            routeName: 'home'
          },
          {
            pageName: '書籍一覧',
            routeName: 'books'
          },
          {
            pageName: '書籍詳細',
            routeName: 'book'
          },
        ]
      }
    }
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

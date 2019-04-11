import Vue from 'vue';
import Vuex from 'vuex';
import home from './home';

Vue.use(Vuex);

export default new Vuex.Store({
  state: {
    title: 'EdgeLibrary',
    user: {},
    loggedIn: false,
    enableNavBar: false
  },
  getters: {
    title(state) {
      return state.title;
    },
    user(state) {
      return state.user;
    },
    loggedIn(state) {
      return state.loggedIn;
    },
    enableNavBar(state) {
      return state.enableNavBar;
    }
  },
  mutations: {
    setUser(state, payload) {
      state.user = payload;
    },
    login(state) {
      state.loggedIn = true;
    },
    logout(state) {
      state.loggedIn = false;
      state.user = {};
    },
    toggleNavBar(state) {
      state.enableNavBar = !state.enableNavBar;
    }
  },
  actions: {
    setUser({ commit }, payload) {
      commit('setUser', payload);
    },
    login({ commit }) {
      commit('login');
    },
    logout({ commit }) {
      commit('logout');
    },
    toggleNavBar({ commit }) {
      commit('toggleNavBar');
    }
  },
  modules: {
    home
  }
});

import Vue from 'vue';
import Vuex from 'vuex';

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
    logIn(state) {
      state.loggedIn = true;
    },
    logOut(state) {
      state.loggedIn = false;
    },
    toggleNavBar(state) {
      state.enableNavBar = !state.enableNavBar;
    }
  },
  actions: {
    setUser({ commit }, payload) {
      commit('setUser', payload);
    },
    logIn({ commit }) {
      commit('logIn');
    },
    logOut({ commit }) {
      commit('logOut');
    },
    toggleNavBar({ commit }) {
      commit('toggleNavBar');
    }
  }
});

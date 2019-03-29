import Vue from 'vue';
import Vuex from 'vuex';

Vue.use(Vuex);

export default new Vuex.Store({
  state: {
    title: 'EdgeLibrary',
    user: {},
    loggedIn: false,
    breadclumbList: [],
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
    breadclumbList(state) {
      return state.breadclumbList;
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
    changeBreadclumbList(state, payload) {
      state.breadclumbList = payload;
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
    changeBreadclumbList({ commit }, payload) {
      commit('changeBreadclumbList', payload);
    },
    toggleNavBar({ commit }) {
      commit('toggleNavBar');
    }
  }
});

import Vue from 'vue';
import Vuex from 'vuex';

Vue.use(Vuex);

export default new Vuex.Store({
  state: {
    title: 'EdgeLibrary',
    user: {},
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
    changeBreadclumbList({ commit }, payload) {
      commit('changeBreadclumbList', payload);
    },
    toggleNavBar({ commit }) {
      commit('toggleNavBar');
    }
  }
});

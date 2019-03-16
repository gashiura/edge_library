import Vue from 'vue';
import Vuex from 'vuex';

Vue.use(Vuex);

export default new Vuex.Store({
  state: {
    title: 'EdgeLibrary',
    breadclumbList: [],
    enableNavBar: false
  },
  getters: {
    title(state) {
      return state.title;
    },
    breadclumbList(state) {
      return state.breadclumbList
    },
    enableNavBar(state) {
      return state.enableNavBar;
    }
  },
  mutations: {
    changeBreadclumbList(state, payload) {
      state.breadclumbList = payload;
    },
    toggleNavBar(state) {
      state.enableNavBar = !state.enableNavBar;
    }
  },
  actions: {
    changeBreadclumbList({ commit }, payload) {
      commit('changeBreadclumbList', payload);
    },
    toggleNavBar({ commit }) {
      commit('toggleNavBar');
    }
  }
})

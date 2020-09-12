import http from '../api/axios';

const state = {
  book: {},
  showModal: false
};

const mutations = {
  getBook(state, payload) {
    state.book = payload;
  },
  toggleModal(state, payload) {
    state.showModal = payload;
  }
};

const getters = {
  book(state) {
    return state.book;
  },
  showModal(state) {
    return state.showModal;
  },
};

const actions = {
  getBook({ commit }, payload) {
    const bookId = payload;
    http.get(`/api/books/${bookId}`).then(response => {
      commit('getBook', response.data.book);
    });

  },
  toggleModal({ commit }, payload) {
    commit('toggleModal', payload);
  }
};

export default {
  namespaced: true,
  state,
  mutations,
  getters,
  actions
};

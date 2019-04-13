import http from '../api/axios';

const state = {
  showModal: false,
  rentalBook: {}
};

const mutations = {
  toggleModal(state, payload) {
    state.showModal = payload;
  },
  getRentalBook(state, payload) {
    http.get(`/api/rentals/show/${payload}`).then(response => (state.rentalBook = response.data.rental));
  }
};

const getters = {
  showModal(state) {
    return state.showModal;
  },
  rentalBook(state) {
    return state.rentalBook;
  }
};

const actions = {
  toggleModal({ commit }, payload) {
    commit('toggleModal', payload);
  },
  getRentalBook({ commit }, payload) {
    commit('getRentalBook', payload);
  }
};

export default {
  namespaced: true,
  state,
  mutations,
  getters,
  actions
};

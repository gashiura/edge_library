import http from '../api/axios';

const state = {
  showModal: false,
  rentals: [],
  rentalBook: {}
};

const mutations = {
  toggleModal(state, payload) {
    state.showModal = payload;
  },
  getRentals(state, payload) {
    const userId = payload;
    http.get(`/api/rentals/${userId}`).then(response => (state.rentals = response.data.rentals));
  },
  getRentalBook(state, payload) {
    http.get(`/api/rentals/show/${payload}`).then(response => (state.rentalBook = response.data.rental));
  }
};

const getters = {
  showModal(state) {
    return state.showModal;
  },
  rentals(state) {
    return state.rentals;
  },
  rentalBook(state) {
    return state.rentalBook;
  }
};

const actions = {
  toggleModal({ commit }, payload) {
    commit('toggleModal', payload);
  },
  getRentals({ commit }, payload) {
    commit('getRentals', payload);
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

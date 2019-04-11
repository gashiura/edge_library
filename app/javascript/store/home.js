const state = {
  showModal: false
};

const mutations = {
  toggleModal(state, payload) {
    state.showModal = payload;
  }
};

const getters = {
  showModal(state) {
    return state.showModal;
  }
};

const actions = {
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

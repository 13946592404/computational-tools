import Vue from 'vue';
import Vuex from 'vuex';

Vue.use(Vuex);

const store = new Vuex.Store({
  state: {
    version: 'v0.0.0',
  },
});

export function useStore() {
  return store;
}

export default store;

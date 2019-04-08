<template>
  <div class="wrapper">
    <header-bar v-if="notLoginPath"></header-bar>
    <nav-bar v-if="shownNavBar"></nav-bar>
    <breadclumb-list v-if="notLoginPath"></breadclumb-list>
    <search-bar v-if="notLoginPath"></search-bar>
    <router-view></router-view>
    <footer-bar></footer-bar>
  </div>
</template>

<script>
import { mapGetters } from 'vuex';
import HeaderBar from './components/share/header.vue';
import FooterBar from './components/share/footerbar.vue';
import NavBar from './components/share/navbar.vue';
import BreadclumbList from './components/share/breadclumb_list.vue';
import SearchBar from './components/share/searchbar.vue';

export default {
  components: {
    HeaderBar,
    FooterBar,
    NavBar,
    BreadclumbList,
    SearchBar
  },
  computed: {
    ...mapGetters(['enableNavBar']),
    notLoginPath() {
      return this.$route.path !== '/login';
    },
    shownNavBar() {
      return this.notLoginPath && this.enableNavBar;
    }
  }
};
</script>

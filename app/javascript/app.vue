<template>
  <div id="wrapper">
    <header-bar v-if="notRootPath"></header-bar>
    <nav-bar v-if="shownNavBar"></nav-bar>
    <breadclumb-list></breadclumb-list>
    <search-bar v-if="notRootPath"></search-bar>
    <router-view></router-view>
    <footer-bar></footer-bar>
  </div>
</template>

<script>
import { mapGetters } from 'vuex';
import HeaderBar from './components/header.vue';
import FooterBar from './components/footerbar.vue';
import NavBar from './components/navbar.vue';
import BreadclumbList from './components/breadclumb_list.vue';
import SearchBar from './components/searchbar.vue';

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
    notRootPath() {
      return this.$route.path !== '/';
    },
    shownNavBar() {
      return this.notRootPath && this.enableNavBar;
    }
  }
};
</script>

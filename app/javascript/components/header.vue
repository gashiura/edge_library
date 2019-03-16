<template>
<header>
  <router-link to="/home" id="title">{{ title }}</router-link>
  <div id="btn-gnavi" @click="toggleNavBar">
    <span></span>
    <span></span>
    <span></span>
  </div>
  <hr>
</header>
</template>

<script>
import { mapGetters, mapActions } from 'vuex';

export default {
  computed: {
    ...mapGetters(['title'])
  },
  methods: {
    ...mapActions(['toggleNavBar'])
  }
}
</script>

<style lang="scss">
header {
   a {
    text-decoration: none;
    &:visited { color: black; }
  }
  #title {
    font-family: 'Caveat', cursive;
    font-size: 30px;
    padding-left: 20px;
  }
  #btn-gnavi {
    float: right;
    top: 15px;
    padding-right: 20px;
    width: 30px;
    height: 30px;
    cursor: pointer;
    z-index: 2;
    -webkit-transition: all 400ms;
    transition: all 400ms;

    span {
      position: absolute;
      width: 30px;
      height: 4px;
      border-radius: 10px;
      background: black;
      -webkit-transition: all 400ms;
      transition: all 400ms;

      &:nth-child(1) { top: 15px; }
      &:nth-child(2) { top: 25px; }
      &:nth-child(3) { top: 35px; }
    }
  }
}
</style>

<template>
<div id="gnavi-wrapper" @click="toggleNavBar">
  <nav id="gnavi">
    <div id="del-navi" @click="toggleNavBar">
      <span></span>
      <span></span>
    </div>
    <ul id="menu">
      <li><router-link to="/home">ホーム</router-link></li>
      <li><router-link to="/books">書籍検索</router-link></li>
      <li><router-link to="/home">アカウント設定</router-link></li>
      <li><router-link to="/home">ログアウト</router-link></li>
    </ul>
  </nav>
  <div id="gnavi-out"></div>
</div>
</template>

<script>
import { mapActions } from 'vuex'

export default {
  methods: {
    ...mapActions(['toggleNavBar'])
  }
}
</script>

<style lang="scss" scoped>
#gnavi-wrapper {
  #gnavi-out {
    position: absolute;
    top: 0px;
    left: 0px;
    width: 100%;
    height: 100%;
    z-index: 3;
  }

  #gnavi {
    position: absolute;
    top: 0px;
    right: 0px;
    width: 300px;
    height: 100%;
    padding-top: 50px;
    background: rgba(33,33,33,.9);
    z-index: 4;

    #del-navi {
      position: absolute;
      top: 15px;
      right: 20px;
      width: 30px;
      height: 30px;
      cursor: pointer;
      z-index: 5;

      span {
        position: absolute;
        top: 15px;
        width: 30px;
        height: 4px;
        border-radius: 10px;
        background:white;

        &:nth-child(1) { transform: rotate(45deg); }
        &:nth-child(2) { transform: rotate(-45deg); }
      }
    }

    ul {
      font-size: 20px;
      padding-left: 15px;
      color: white;

      li {
        padding: 20px 28px;

        a {
          color: white;
          text-decoration: none;
          &:visited { color: white; }
          &:hover { color: gold; }
        }
      }
    }
  }
}
</style>

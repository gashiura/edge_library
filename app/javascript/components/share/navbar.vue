<template>
  <div id="gnavi-wrapper">
    <nav id="gnavi">
      <div
        id="del-navi"
        @click="toggleNavBar"
      >
        <span />
        <span />
      </div>
      <ul id="menu">
        <li>
          <router-link
            to="/"
            @click.native="toggleNavBar"
          >
            ホーム
          </router-link>
        </li>
        <li>
          <router-link
            to="/books"
            @click.native="toggleNavBar"
          >
            書籍一覧
          </router-link>
        </li>
        <li>
          <router-link
            to="/home"
            @click.native="toggleNavBar"
          >
            アカウント設定
          </router-link>
        </li>
        <li><a @click="checkLogout">ログアウト</a></li>
      </ul>
    </nav>
    <div
      id="gnavi-out"
      @click="toggleNavBar"
    />
  </div>
</template>

<script>
import { mapActions } from 'vuex';
import http from '../../api/axios';

export default {
  methods: {
    ...mapActions(['toggleNavBar', 'logout']),
    checkLogout: function() {
      if(confirm('ログアウトしますか？')) {
        http.delete('/api/logout').then(() => {
          this.toggleNavBar();
          this.logout();
          this.$router.push({ name: 'login' });
        }).catch(() => {
          alert('ログアウトに失敗しました。');
        });
      }
    }
  }
};
</script>

<style lang="scss" scoped>
#gnavi-wrapper {
  #gnavi-out {
    position: fixed;
    top: 0px;
    left: 0px;
    width: 100%;
    height: 100%;
    z-index: 3;
  }

  #gnavi {
    position: fixed;
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
          &:hover {
            color: gold;
            cursor: pointer;
          }
        }
      }
    }
  }
}
</style>

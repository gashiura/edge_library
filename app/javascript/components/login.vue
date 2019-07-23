<template>
  <div id="login-container">
    <label id="title">EdgeLibrary</label>
    <div
      id="input-container"
      @keyup.enter="authenticate"
    >
      <div class="form-item">
        <div id="item-label">
          Eメール
        </div>
        <input
          v-model="email"
          type="text"
          class="basic-input"
        >
      </div>
      <div class="form-item">
        <div id="item-label">
          パスワード
        </div>
        <input
          v-model="password"
          type="password"
          class="basic-input"
        >
      </div>
      <button
        id="login-button"
        class="basic-button"
        @click="authenticate"
      >
        ログイン
      </button>
    </div>
  </div>
</template>

<script>
import { mapActions } from 'vuex';
import http from '../api/axios';
import JSSHA from 'jssha';

export default {
  data() {
    return {
      email: '',
      password: ''
    };
  },
  methods: {
    ...mapActions(['setUser', 'login']),
    authenticate() {
      if (this.validate()) {
        const shaObj = new JSSHA('SHA-256', 'TEXT');
        shaObj.update(this.password);
        const encryptedPassword = shaObj.getHash('HEX');
        http.post('/authenticate', { email: this.email, password: encryptedPassword }).then(response => {
          let user = response.data.user;
          if(response.data.result) {
            this.login();
            this.setUser({
              id: user.id,
              name: user.name,
              email: user.email,
              authority: user.authority
            });
            this.$router.push('/');
          } else {
            alert('Eメールまたはパスワードに誤りがあります。');
            return;
          }
        });
      }
    },
    validate() {
      if(this.email === '') {
        alert('Eメールを入力して下さい。');
        return false;
      }
      if(this.password === '') {
        alert('パスワードを入力して下さい。');
        return false;
      }
      return true;
    }
  }
};
</script>

<style lang="scss" scoped>
#login-container {
  padding-top: 30px;
  text-align: center;

  #title {
    font-family: 'Caveat', cursive;
    font-size: 40px;
  }

  #input-container {
    padding-top: 70px;

    .form-item {
      margin-bottom: 30px;

      #item-label {
        display: inline-block;
        width: 100px;
        text-align: center;
      }
    }

    #login-button {
      height: 50px;
      padding: 10px;
      margin: 30px 0px;
      border-radius: 10px;
    }
  }
}
</style>

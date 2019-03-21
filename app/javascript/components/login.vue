<template>
  <div id="login-container">
    <label id="title">EdgeLibrary</label>
    <div id="input-container">
      <div class="form-item">
        <div id="item-label">Eメール</div>
        <input type="text" class="login-input" v-model="email">
      </div>
      <div class="form-item">
        <div id="item-label">パスワード</div>
        <input type="text" class="login-input" v-model="password">
      </div>
      <button id="login-button" @click="validate">ログイン</button>
    </div>
  </div>
</template>

<script>
import http from '../api/axios';

export default {
  data() {
    return {
      email: '',
      password: ''
    };
  },
  methods: {
    validate() {
      if(this.email === '') {
        alert('Eメールを入力して下さい。');
        return;
      }
      if(this.password === '') {
        alert('パスワードを入力して下さい。');
        return;
      }
      http.post('/auth', { email: this.email, password: this.password }).then(response => (this.info = response));
      this.$router.push('/home');
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

      #login-input {
        display: block;
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

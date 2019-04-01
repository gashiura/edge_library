<template>
  <div id="search-area">
    <input id="search-input" v-model="searchString" placeholder="検索したい書籍名を入力して下さい。">
    <button id="search-button" @click="search">検索</button>
  </div>
</template>

<script>
export default {
  data() {
    return {
      searchString: ''
    };
  },
  methods: {
    search: function() {
      this.$router.push({ name: 'books', params: { searchString: this.searchString }});
    }
  }
}
</script>

<style lang="scss" scoped>
#search-area {
  text-align: center;
  margin-top: 10px;

  #search-input {
    width: 300px;
  }

  #search-button {
    width: 100px;
  }
}
</style>

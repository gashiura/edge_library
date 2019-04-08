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
  watch: {
    '$route' (to, from) {
      if(to.name === 'books' && Object.keys(to.query).length) { return }
      this.searchString = '';
    }
  },
  methods: {
    search: function() {
      if(this.searchString === '' || this.searchString === null) { return }
      this.$router.push({ path: 'books', query: { searchString: this.searchString }});
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

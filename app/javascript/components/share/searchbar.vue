<template>
  <div class="search-container">
    <input class="basic-input search-input--width" v-model="searchString" placeholder="検索したい書籍名を入力して下さい。">
    <button class="basic-button basic-button--short-width" @click="search">検索</button>
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
    '$route' (to) {
      if(to.name === 'books' && Object.keys(to.query).length) {
        return;
      }
      this.searchString = '';
    }
  },
  methods: {
    search: function() {
      if(this.searchString === '' || this.searchString === null) {
        return;
      }

      this.$router.push({ path: 'books', query: {
        searchString: this.searchString
      }});
    }
  }
};
</script>

<style lang="scss" scoped>
.search-container {
  text-align: center;
  margin-top: 10px;

  .search-input--width {
    width: 300px;
  }
}
</style>

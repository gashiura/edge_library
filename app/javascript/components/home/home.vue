<template>
  <div id="content">
    <rentals></rentals>
    <favorites></favorites>
  </div>
</template>

<script>
import { mapActions } from 'vuex';
import Rentals from './rentals.vue';
import Favorites from './favorites.vue'

export default {
  components: {
    Rentals,
    Favorites
  },
  data() {
    return {
      a: 'a'
    };
  },
  created: function() {
    this.changeBreadclumbList([
      {
        pagename: 'ホーム',
        url: '/home'
      }
    ]);
  },
  methods: {
    ...mapActions(['changeBreadclumbList'])
  }
}
</script>

<style lang="scss" scoped>
#content {
  margin: 30px 50px;
}
</style>

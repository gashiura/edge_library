<template>
  <div id="content">
    <rentals/>
    <favorites/>
    <return-modal/>
  </div>
</template>

<script>
import Rentals from './rentals.vue';
import Favorites from './favorites.vue';
import ReturnModal from './return_modal.vue';

export default {
  components: {
    Rentals,
    Favorites,
    ReturnModal
  }
};
</script>

<style lang="scss" scoped>
#content {
  margin: 30px 50px;
}
</style>

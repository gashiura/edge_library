<template>
<div id="review-container">
  <h2 class="title">レビュー</h2>
  <div v-for="review in reviews" :key="review.id"  class="reviews">
    <div class="review-info">
      <point :point="review.point" :enableClick="false"></point>
      <div class="review-user">投稿者：{{ review.userName }}</div>
      <div class="reviwe-date">投稿日：{{ formatDate(review.createdAt) }}</div>
    </div>
    <div class="review">{{ review.content }}</div>
  </div>
</div>
</template>

<script>
import Point from './point.vue';

export default {
  components: {
    Point
  },
  props: {
    reviews: Array
  },
  methods: {
    formatDate: dt => {
      var y = dt.getFullYear();
      var m = ("00" + (dt.getMonth()+1)).slice(-2);
      var d = ("00" + dt.getDate()).slice(-2);
      return y + "/" + m + "/" + d;
    }
  }
}
</script>

<style lang="scss" scoped>
#review-container {
  margin: 10px;

  .title {
    font-size: 20px;
  }
  .reviews {
    margin: 40px 10px;

    .review-info {
      display: inline-block;
      width: 100%;
      margin-bottom: 20px;

      .review-user, .reviwe-date {
        display: inline-block;
      }
      .reviwe-date { float: right }
    }
  }
}
</style>

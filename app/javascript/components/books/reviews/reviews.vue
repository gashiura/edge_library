<template>
  <div id="review-container">
    <h2 class="title">レビュー</h2>
    <template v-if="existsReview">
      <div v-for="review in reviews" :key="review.id"  class="reviews">
        <div class="review-info">
          <point :point="review.point" :enableClick="false"></point>
          <div class="review-user">投稿者：{{ review.user_name }}</div>
          <div class="reviwe-date">投稿日：{{ review.created_at }}</div>
        </div>
        <div class="review">{{ review.content }}</div>
      </div>
    </template>
    <div v-else class="reviews">
      レビューがありません。
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
  computed: {
    existsReview: function() {
      return this.reviews.length > 0;
    }
  }
};
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

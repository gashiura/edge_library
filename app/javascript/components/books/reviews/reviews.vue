<template>
  <div id="review-container">
    <h2 class="title">
      レビュー
    </h2>
    <template v-if="reviewExists">
      <div
        v-for="review in book.reviews"
        :key="review.id"
        class="reviews"
      >
        <div class="review-info">
          <point
            :point="review.point"
            :enable-click="false"
          />
          <div class="review-user">
            投稿者：{{ review.uid }}
          </div>
          <div class="reviwe-date">
            投稿日：{{ review.created_at }}
          </div>
        </div>
        <div
          class="review"
          v-html="review.content"
        />
      </div>
    </template>
    <div
      v-else
      class="reviews"
    >
      レビューがありません。
    </div>
  </div>
</template>

<script>
import { mapGetters } from 'vuex';
import Point from './point.vue';

export default {
  components: {
    Point
  },
  computed: {
    ...mapGetters('book', ['book']),
    reviewExists() {
      if (this.book.reviews === undefined) return false;
      return this.book.reviews.length > 0;
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
    margin: 20px 40px 40px 40px;
    font-size: 12px;

    .review-info {
      display: inline-block;
      width: 100%;
      margin-bottom: 10px;

      .review-user, .reviwe-date {
        display: inline-block;
      }
      .reviwe-date {
        margin-left: 30px;
      }
    }
  }
}
</style>

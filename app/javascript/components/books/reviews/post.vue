<template>
  <div id="post-container">
    <h2 class="title">
      レビューを投稿する
    </h2>
    <div id="post-form">
      <div id="evaluation-container">
        <h3 class="middle-title">
          評価
        </h3>
        <point
          :enable-click="true"
          :point="point"
          @update="updatePoint"
        />
      </div>
      <div id="review-container">
        <h3 class="middle-title">
          レビュー
        </h3>
        <textarea
          id="post-review"
          v-model="content"
        />
        <button
          id="post-button"
          class="basic-button"
          @click="createReview"
        >
          投稿する
        </button>
      </div>
    </div>
  </div>
</template>

<script>
import { mapGetters } from 'vuex';
import Point from './point.vue';
import http from '../../../api/axios';

export default {
  components: {
    Point
  },
  data() {
    return {
      content: '',
      point: 3
    };
  },
  computed: {
    ...mapGetters(['user']),
  },
  methods: {
    createReview: function() {
      http.post('api/reviews', {
        book_id: this.$route.params.id,
        user_id: this.user.id,
        point: this.point,
        content: this.content
      }).then(response => (
        alert(response.data.message)
      ));
    },
    updatePoint: function(point) {
      // NOTE: 現在のポイントと同じ星をクリックした場合、1点マイナスする。
      if(this.point === point) {
        this.point -= 1;
      }else {
        this.point = point;
      }
    },
  }
};
</script>

<style lang="scss" scoped>
#post-container {
  height: 350px;
  margin: 10px;

  .title {
    font-size: 20px;
  }

  .middle-title {
    font-size: 12px;
    margin-bottom: 10px;
  }

  #post-form {
    width: 850px;
    margin: 20px auto;

    #evaluation-container {
      margin-bottom: 20px;
    }

    #post-review {
      width: 820px;
      height: 100px;
      padding: 15px;
      font-size: 14px;
      border-radius: 10px;
    }

    #post-button {
      float: right;
      margin-top: 20px;
    }
  }
}
</style>

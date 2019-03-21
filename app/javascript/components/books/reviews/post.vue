<template>
  <div id="post-container">
    <h2 class="title">レビューを投稿する</h2>
    <div id="post-form">
      <div id="evaluation-container">
        <h3 class="middle-title">評価</h3>
        <point :enableClick="true"></point>
      </div>
      <div id="review-container">
        <h3 class="middle-title">レビュー</h3>
        <textarea id="post-review" v-model="content"></textarea>
        <button id="post-button">投稿する</button>
      </div>
    </div>
  </div>
</template>

<script>
import Point from './point.vue';

export default {
  components: {
    Point
  },
  data() {
    return {
      content: ''
    };
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
    font-size: 16px;
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

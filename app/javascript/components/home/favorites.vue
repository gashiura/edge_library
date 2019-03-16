<template>
<div id="favorite-container">
  <label id="favorite-title">最近のお気に入り</label>
  <div id="favorite-thumbnail">
    <button id="back-button">◀︎</button>
    <div v-for="favorite in favorites" :key="favorite.id" class="image-container">
      <img :src="favorite.imagePath" class="favorite-image">
      <a href="/" class="favorite-link">{{ favorite.bookName }}</a>
    </div>
    <button id="next-button">▶︎</button>
  </div>
</div>
</template>

<script>
export default {
  data() {
    return {
      favorites: [
        {
          id: 1,
          bookName: '[試して理解]Linuxのしくみ ~実験と図解で学ぶOSとハードウェアの基礎知識',
          imagePath: require('../../../assets/images/books/001.jpeg')
        },
        {
          id: 2,
          bookName: '実践ハイパフォーマンスMySQL 第3版',
          imagePath: require('../../../assets/images/books/002.jpeg')
        }
      ]
    };
  }
}
</script>

<style lang="scss" scoped>
#favorite-container {
  margin-top: 50px;

  #favorite-title {
    font-size: 18px;
    margin-bottom: 20px;

    &:before {
      font-family: "Font Awesome 5 Free";
      content: '\f005';
      font-weight: 900;
      font-size: 1.1em;
      color: #ffd700;
      margin-right: 5px;
    }
  }

  #favorite-thumbnail {
    margin-top: 20px;
    width: auto;
    height: auto;
    background: #f5f5f5;
    border-radius: 5px;

    .image-container {
      display: inline-block;
      vertical-align: top;
      margin: 30px;

      .favorite-image {
        max-width: 150px;
        max-height: 200px;
        box-shadow: 0 2px 5px 1px rgba(0,0,0,.2);
        border-radius: 3px;
        border: none;
      }
      .favorite-link {
        display: block;
        font-size: 12px;
        max-width: 150px;
      }
    }
    #back-button { float: left; }
    #next-button { float:right; }
    #back-button, #next-button{
      display: inline-block;
      vertical-align: middle;
      width: 30px;
      height: 300px;
      margin: 0 auto;
    }
  }
}
</style>

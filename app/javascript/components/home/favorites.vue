<template>
  <div id="favorite-container">
    <label id="favorite-title">最近のお気に入り</label>
    <div id="favorite-thumbnail">
      <button class="move-button move-button--back">◀︎</button>
      <div v-for="favorite in favorites" :key="favorite.id" class="image-container">
        <img :src="favorite.image_url" class="favorite-image">
        <router-link to="/book/1" class="favorite-link">{{ favorite.book_name }}</router-link>
      </div>
      <button class="move-button move-button--next">▶︎</button>
    </div>
  </div>
</template>

<script>
import http from '../../api/axios';

export default {
  data() {
    return {
      favorites: [],
      userId: 1
    };
  },
  created: function() {
    this.getFavorites(this.userId);
  },
  methods: {
    getFavorites: function(userId) {
      http.get(`/api/favorites/${userId}`).then(response => (
        this.favorites = response.data.favorites)
      );
    }
  }
};
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
    height: 300px;
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
    .move-button {
      display: inline-block;
      vertical-align: middle;
      width: 30px;
      height: 300px;
      margin: 0px auto;
      padding: 5px;
      border-radius: 5px;
      font-size: 14px;
      color: black;
      background: white;
      outline: 0;

      &--back { float: left; }
      &--next { float: right; }
      &:hover { background: #ffffb7 }
    }
  }
}
</style>

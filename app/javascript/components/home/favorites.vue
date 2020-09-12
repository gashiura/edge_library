<template>
  <div class="favorite-container">
    <label class="favorite-title">最近のお気に入り</label>
    <div class="favorite-thumbnail">
      <div class="prev-wrapper">
        <button
          :class="{ 'move-button--disable': totalPage === 1 || currentPage === 1 }"
          class="move-button"
          @click="movePrev">
          ◀︎
        </button>
      </div>
      <div class="image-wrapper">
        <div
          v-for="favorite in currentFavorites"
          :key="favorite.id"
          class="image-container"
        >
          <img
            :src="favorite.image_url"
            class="favorite-image"
          >
          <router-link
            to="/book/1"
            class="favorite-link"
          >
            {{ favorite.book_name }}
          </router-link>
        </div>
      </div>
      <div class="next-wrapper">
        <button
          :class="{ 'move-button--disable': totalPage === 1 || currentPage === totalPage }"
          class="move-button"
          @click="moveNext">
          ▶︎
        </button>
      </div>
    </div>
  </div>
</template>

<script>
import { mapGetters } from 'vuex';
import http from '../../api/axios';

export default {
  data() {
    return {
      favorites: [],
      currentPage: 1,
      per_page: 5
    };
  },
  computed: {
    ...mapGetters(['user']),
    offset() {
      return this.per_page * (this.currentPage - 1);
    },
    totalPage() {
      return Math.ceil(this.favorites.length / this.per_page);
    },
    currentFavorites() {
      return this.favorites.slice(this.offset, this.per_page * this.currentPage);
    }
  },
  created() {
    this.getFavorites();
  },
  methods: {
    getFavorites() {
      http.get(`/api/favorites`).then(response => (
        this.favorites = response.data.favorites)
      );
    },
    movePrev() {
      if(this.currentPage !== 1) {
        this.currentPage--;
      }
    },
    moveNext() {
      if(this.currentPage !== this.totalPage) {
        this.currentPage++;
      }
    }
  }
};
</script>

<style lang="scss" scoped>
.favorite-container {
  margin-top: 50px;

  .favorite-title {
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

  .favorite-thumbnail {
    display: flex;
    margin-top: 20px;
    width: auto;
    height: 300px;
    border-radius: 5px;

    .image-wrapper {
      display: flex;
      width: 1050px;

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
    }
  }

  .prev-wrapper {
    display: flex;
    justify-content: flex-start;
    align-items: center;
    width: 65px;
  }

  .next-wrapper {
    display: flex;
    justify-content: flex-end;
    align-items: center;
    width: 65px;
  }

  .move-button {
    text-align: center;
    width: 50px;
    height: 35px;
    margin: 0px auto;
    padding: 5px;
    border-radius: 5px;
    font-size: 14px;
    color: white;
    background: #727171;
    outline: 0;

    &:hover:not(.move-button--disable) {
      background: #474a4d
    }

    &--disable {
      opacity: 0.5;
    }
  }
}
</style>

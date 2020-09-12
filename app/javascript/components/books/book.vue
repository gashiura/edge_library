<template>
  <div id="book-container">
    <div id="book-detail-container">
      <img
        :src="book.image_url"
        class="book-image"
      >
      <div id="book-detail">
        <div id="book-category">
          {{ book.category }}
        </div>
        <div id="book-title">
          {{ book.name }}
        </div>
        <div id="book-author">
          著書： {{ book.author }}
        </div>
        <div id="book-publisher">
          出版社： {{ book.publisher }}
        </div>
        <div id="tags-container">
          <div
            v-for="tag in book.tags"
            :key="tag"
            class="book-tag"
          >
            # {{ tag }}
          </div>
        </div>
        <div>
          <button
            v-if="isFavorite"
            class="basic-button button-right button-margin"
            @click="deleteFavorite"
          >
            お気に入りから解除する
          </button>
          <button
            v-else
            class="basic-button button-right button-margin"
            @click="createFavorite"
          >
            お気に入り登録する
          </button>
        </div>
        <div>
          <div
            v-if="isRental"
            class="rental-message"
          >
            この書籍はレンタル中です
          </div>
          <button
            v-else
            class="basic-button button-right"
            @click="openModal"
          >
            レンタルする
          </button>
        </div>
      </div>
    </div>
    <hr>
    <div class="description-container">
      <h2 class="title">
        概要
      </h2>
      <div
        class="description"
        v-html="book.description"
      />
    </div>
    <hr>
    <reviews />
    <hr>
    <post />
    <rental-modal />
  </div>
</template>

<script>
import { mapGetters, mapActions } from 'vuex';
import Reviews from './reviews/reviews.vue';
import Post from './reviews/post.vue';
import RentalModal from './rental_modal';
import http from '../../api/axios';

export default {
  components: {
    Reviews,
    Post,
    RentalModal
  },
  data() {
    return {
      isFavorite: false
    };
  },
  computed: {
    ...mapGetters(['user']),
    ...mapGetters('book', ['book']),
    bookId() {
      return this.$route.params.id;
    },
    isRental() {
      return this.book.status === '貸出中';
    }
  },
  created() {
    this.getBook(this.bookId);
    http.get(`/api/favorites/exists/${this.bookId}`).then(response => {
      this.isFavorite = response.data.exists;
    });
  },
  methods: {
    ...mapActions('book', ['getBook', 'toggleModal']),
    openModal() {
      this.toggleModal(true);
    },
    createFavorite() {
      http.post('/api/favorites', {
        book_id: this.bookId
      }).then(response => {
        alert(response.data.message);
        if(response.data.status === 'success') {
          this.isFavorite = true;
        }
      });
    },
    deleteFavorite() {
      http.delete(`/api/favorites/${this.bookId}`).then(response => {
        alert(response.data.message);
        if(response.data.status === 'success') {
          this.isFavorite = false;
        }
      });
    }
  }
};
</script>

<style lang="scss" scoped>
#book-container {
  width: 1000px;
  margin: 50px auto;

  .title {
    font-size: 20px;
  }

  #book-detail-container {
    margin: 30px 10px;

    .book-image {
      max-width: 200px;
      max-height: 300px;
    }

    #book-detail {
      display: inline-block;
      width: 700px;
      vertical-align: top;
      margin: 0px 10px;

      #book-category {
        font-size: 14px;
        width: 100px;
        margin-bottom: 15px;
        background: gold;
        border-radius: 10px;
        text-align: center;
      }

      #book-title {
        display: block;
        font-size: 20px;
        word-wrap: break-word;
        margin-bottom: 15px;
      }

      #book-author, #book-publisher {
        font-size: 12px;
        word-wrap: break-word;
        margin: 5px 20px;
      }

      .book-tag {
        display: inline-block;
        margin: 20px 10px;
        padding: 3px 15px;
        background: black;
        color: white;
        border-radius: 10px;
        text-align: center;
        font-size: 12px;
      }

      .rental-message {
        float: right;
        margin-top: 10px;
        margin-right: 20px;
        color: red;
      }

      .button-right {
        float: right;
        display: block;
      }

      .button-margin {
        margin-left: 10px;
      }
    }
  }

  .description-container {
    margin: 10px;

    .description {
      margin: 20px 40px;
      font-size: 14px;
    }
  }
}

.star {
  float: right;
}
.enable-star {
  color: #ffd700;
}
.disable-star {
  color: gray;
}
.pointer-cursor {
  cursor: pointer;
}
</style>

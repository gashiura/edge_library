<template>
  <div id="book-container">
    <div id="book-detail-container">
      <img :src="book.image_url" class="book-image">
      <div id="book-detail">
        <div id="book-category">{{ book.category }}</div>
        <div id="book-title">{{ book.name }}</div>
        <div id="book-author">著書： {{ book.author }}</div>
        <div id="book-publisher">出版社： {{ book.publisher }}</div>
        <div id="tags-container">
          <div v-for="tag in book.tags['tags']" :key="tag" class="book-tag">
            {{ tag }}
          </div>
        </div>
        <div>
          <button v-if="isFavorite" @click="deleteFavorite" class="basic-button button-right button-margin">お気に入りから解除する</button>
          <button v-else @click="createFavorite" class="basic-button button-right button-margin">お気に入り登録する</button>
        </div>
        <div>
          <div v-if="isRental" class="rental-message">この書籍はレンタル中です</div>
          <button v-else @click="openModal" class="basic-button button-right">レンタルする</button>
        </div>
      </div>
    </div>
    <hr>
    <div id="description-container">
      <h2 class="title">概要</h2>
      <div v-html="book.description" id="description"></div>
    </div>
    <hr>
    <reviews :reviews="book.reviews"></reviews>
    <hr>
    <post/>
    <rental-modal/>
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
    }
  },
  created: function() {
    this.getBook(this.bookId);
    http.get(`/api/favorites/exists/${this.bookId}/${this.user.id}`).then(response => (this.isFavorite = response.data.exists));
  },
  computed: {
    ...mapGetters(['user']),
    ...mapGetters('book', ['book']),
    bookId: function() {
      return this.$route.params.id;
    },
    isRental: function() {
      return this.book.status === '貸出中';
    }
  },
  methods: {
    ...mapActions('book', ['getBook', 'toggleModal']),
    openModal: function() {
      this.toggleModal(true);
    },
    createFavorite: function() {
      http.post('/api/favorites/create', {
        book_id: this.bookId,
        user_id: this.user.id
      }).then(response => {
        alert(response.data.message);
        if(response.data.status === 'success') {
          this.isFavorite = true;
        }
      });
    },
    deleteFavorite: function() {
      http.delete(`/api/favorites/destroy/${this.bookId}/${this.user.id}`).then(response => {
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
        font-size: 16px;
        word-wrap: break-word;
        margin: 5px 20px;
      }

      .book-tag {
        display: inline-block;
        margin: 20px 10px;
        padding: 0px 15px;
        background: #add8e6;
        border-radius: 10px;
        text-align: center;
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

  #description-container {
    margin: 10px;
    height: 200px;

    #description {
      margin: 20px 10px
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

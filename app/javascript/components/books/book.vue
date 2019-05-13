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
        <div v-if="isRental" id="rental-message">この書籍はレンタル中です</div>
        <button v-else @click="openModal" class="basic-button button-right">レンタルする</button>
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
    const bookId = this.$route.params.id;
    this.getBook(bookId);
    http.get(`/api/favorites/exists/${bookId}/${this.user.id}`).then(response => (this.isFavorite = response.data.exists));
  },
  computed: {
    ...mapGetters(['user']),
    ...mapGetters('book', ['book']),
    isRental: function() {
      return this.book.status === '貸出中';
    }
  },
  methods: {
    ...mapActions('book', ['getBook', 'toggleModal']),
    openModal: function() {
      this.toggleModal(true);
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

      #rental-message {
        float: right;
        color: red;
      }

      .button-right {
        float: right;
        display: block;
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

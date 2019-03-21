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
          <div v-for="tag in tags" :key="tag" class="book-tag">{{ tag }}</div>
        </div>
        <div v-if="isRental" id="rental-message">この書籍はレンタル中です</div>
        <button v-else id="rental-button">レンタルする</button>
      </div>
    </div>
    <hr>
    <div id="description-container">
      <h2 class="title">概要</h2>
      <div id="description">{{ book.description }}</div>
    </div>
    <hr>
    <reviews :reviews="book.reviews"></reviews>
    <hr>
    <post></post>
  </div>
</template>

<script>
import { mapActions } from 'vuex';
import Reviews from './reviews/reviews.vue';
import Post from './reviews/post.vue';
import http from '../../api/axios';

export default {
  components: {
    Reviews,
    Post
  },
  data() {
    return {
      book: {}
    };
  },
  created: function() {
    this.changeBreadclumbList([
      {
        pagename: 'ホーム',
        url: '/home'
      },
      {
        pagename: '書籍検索',
        url: '/books'
      },
      {
        pagename: '書籍詳細',
        url: `/book/${this.$route.params.id}`
      },
    ]);
    this.getBook(this.$route.params.id);
  },
  computed: {
    tags: function() {
      return this.book.tags['tags'];
    },
    isRental: function() {
      return this.book.status === '貸出中';
    }
  },
  methods: {
    ...mapActions(['changeBreadclumbList']),
    getBook: function(bookId) {
      http.get(`/api/books/show/${bookId}`).then(response => (this.book = response.data.book));
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
    margin: 10px;

    #book-image {
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
        width: 100px;
        margin: 20px 10px;
        background: #add8e6;
        border-radius: 10px;
        text-align: center;
      }

      #rental-message {
        float: right;
        color: red;
      }

      #rental-button {
        float: right;
        display:block;
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
</style>

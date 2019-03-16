<template>
<div id="books-container">
  <div id="books-title">書籍一覧</div>
  <div id="books-count">現在1000件中  1〜20件目を表示しています。</div>
  <div v-for="book in books" :key="book.id" class="book-container">
    <img :src="book.imagePath" class="book-image">
    <div class="book-detail">
      <div class="book-category">{{ book.category }}</div>
      <router-link to="/book/1" class="book-title">{{ book.name }}</router-link>
      <div class="book-author">著書： {{ book.author }}</div>
      <div class="book-publisher">出版社： {{ book.publisher }}</div>
      <div v-for="tag in book.tags" :key="tag" class="book-tag">{{ tag }}</div>
    </div>
    <div class="book-status">
      <button class="status-ok" :class="{'status-rental': isRental(book.status)}">{{ book.status }}</button>
    </div>
    <hr>
  </div>
  {{ books }}
</div>
</template>

<script>
import { mapActions } from 'vuex';
import http from '../../api/axios'

export default {
  data() {
    return {
      books: []
    }
  },
  created: function() {
    this.changeBreadclumbList([
      {
        pagename: 'ホーム',
        url: '/home'
      },
      {
        pagename: '書籍検索',
        url: '/books/1'
      }
    ]);
    this.getBooks();
  },
  methods: {
    ...mapActions(['changeBreadclumbList']),
    isRental: status => {
      return status === '貸出中';
    },
    getBooks: function() {
      http.get('/api/books').then(response => (this.books = response.data.books));
    }
  }
}
</script>

<style lang="scss" scoped>
#books-container {
  width: 900px;
  margin: 30px auto;

  #books-title {
    font-size: 18px;

    &:before {
      font-family: "Font Awesome 5 Free";
      content: '\f02d';
      font-weight: 900;
      font-size: 1.1em;
      color: brown;
      margin-right: 5px;
    }
  }

  #books-count {
    margin: 10px;
  }

  .book-container {
    display: inline-block;
    margin: 10px 0px;

    .book-image {
      max-width: 150px;
      max-height: 200px;
    }

    .book-detail {
      display: inline-block;
      width: 550px;
      vertical-align: top;
      margin: 0px 10px;

      .book-category {
        font-size: 14px;
        width: 100px;
        margin-bottom: 5px;
        background: gold;
        border-radius: 10px;
        text-align: center;
      }

      .book-title {
        display: block;
        font-size: 16px;
        word-wrap: break-word;
        margin-bottom: 15px;
      }

      .book-author, .book-publisher {
        font-size: 14px;
        word-wrap: break-word;
        margin: 5px 20px;
      }

      .book-tag {
        display: inline-block;
        width: 100px;
        margin: 5px;
        background: #add8e6;
        border-radius: 10px;
        text-align: center;
      }
    }

    .book-status {
      display: inline-block;
      vertical-align: top;
      width: 100px;

      .status-ok {
        width: 100%;
        height: 40px;
        border-radius: 5px;
        background: #4169e1;
        color: white;
        text-align: center;
      }

      .status-rental {
        @extend .status-ok;
        background: #ff6347;
      }
    }
  }
}
</style>

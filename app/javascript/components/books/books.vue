<template>
  <div id="books-container">
    <div id="books-subject">
      書籍一覧
    </div>
    <template v-if="existsBook">
      <div class="result-label">
        {{ totalCount }}件中  {{ pageRange }}件目を表示しています。
      </div>
      <div
        v-for="book in books"
        :key="book.id"
        class="book-container"
      >
        <img
          :src="book.image_url"
          class="book-image"
        >
        <div class="book-detail">
          <router-link
            :to="{ name: 'book', params: { id: book.id }}"
            class="book-title"
          >
            {{ book.name }}
          </router-link>
          <div class="book-category">
            <label>カテゴリ：</label>
            <label>{{ book.category }}</label>
          </div>
          <div class="book-author">
            <label>著書：</label>
            <label>{{ book.author }}</label>
          </div>
          <div class="book-publisher">
            <label>出版社：</label>
            <label>{{ book.publisher }}</label>
          </div>
          <div
            v-for="tag in book.tags"
            :key="tag"
            class="book-tag"
          >
            # {{ tag }}
          </div>
        </div>
        <div class="book-status">
          <div
            class="status-ok"
            :class="{'status-rental': isRental(book.status)}"
          >
            {{ book.status }}
          </div>
        </div>
        <hr>
      </div>
      <pagination
        v-if="enablePagnetion"
        :page-count="totalPage"
        :per-page="perPage"
        @clickHandler="getBooks"
      />
    </template>
    <div
      v-else
      class="result-label"
    >
      <label class="label-bold">{{ searchString }}</label>
      <label>に一致する検索結果はありませんでした。</label>
    </div>
  </div>
</template>

<script>
import http from '../../api/axios';
import Pagination from '../share/pagination.vue';

export default {
  components: {
    Pagination
  },
  data() {
    return {
      books: [],
      totalPage: 0,
      totalCount: 0,
      perPage: 20,
      startIndex: 1
    };
  },
  computed: {
    searchString: function() {
      return this.$route.query.searchString;
    },
    existsBook: function() {
      return this.books.length > 0;
    },
    enablePagnetion: function() {
      return this.totalPage > 1;
    },
    lastIndex: function() {
      return this.startIndex + (this.books.length - 1);
    },
    pageRange: function() {
      if(this.startIndex === this.lastIndex) {
        return this.startIndex;
      }
      return this.startIndex + '〜' + this.lastIndex;
    }
  },
  watch: {
    '$route.query.searchString' () {
      this.getBooks(1);
    }
  },
  created: function() {
    this.getBooks(1);
  },
  methods: {
    isRental: function(status) {
      return status === '貸出中';
    },
    getBooks: function(pageNum) {
      http.get('/api/books', { params: {
        search_string: this.searchString,
        page: pageNum,
        per_page: this.perPage
      }}).then(
        response => {
          this.books = response.data.books;
          this.totalPage = response.data.total_page;
          this.totalCount = response.data.total_count;
          this.startIndex = response.data.offset + 1;
        }
      );
    }
  }
};
</script>

<style lang="scss" scoped>
#books-container {
  width: 900px;
  margin: 30px auto;

  #books-subject {
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

  .result-label {
    margin: 20px;
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

      .book-title {
        display: block;
        font-size: 16px;
        word-wrap: break-word;
        margin-bottom: 15px;
      }

      .book-category, .book-author, .book-publisher {
        font-size: 12px;
        word-wrap: break-word;
        margin: 5px 20px;
      }

      .book-tag {
        display: inline-block;
        margin: 10px;
        padding: 0px 15px;
        font-size: 12px;
        background: black;
        color: white;
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
        height: 25px;
        padding: 5px;
        border-radius: 5px;
        background: #ffa500;
        color: white;
        text-align: center;
      }

      .status-rental {
        @extend .status-ok;
        background: gray;
      }
    }
  }
}
</style>

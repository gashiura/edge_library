<template>
<div id="book-container">
  <div id="book-detail-container">
    <img :src="book.imagePath" class="book-image">
    <div id="book-detail">
      <div id="book-category">{{ book.category }}</div>
      <div id="book-title">{{ book.name }}</div>
      <div id="book-author">著書： {{ book.author }}</div>
      <div id="book-publisher">出版社： {{ book.publisher }}</div>
      <div id="tags-container">
        <div v-for="tag in book.tags" :key="tag" class="book-tag">{{ tag }}</div>
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
import Reviews from './reviews/reviews.vue'
import Post from './reviews/post.vue'

export default {
  components: {
    Reviews,
    Post
  },
  data() {
    return {
      book: {
          id: 1,
          egId: "EG000001",
          name: "[試して理解]Linuxのしくみ ~実験と図解で学ぶOSとハードウェアの基礎知識",
          author: '武内 覚',
          description: 'いまどきのOSのしくみが、実験と図解でわかる!\n\nITシステムやソフトウェアの開発、運用において、その基盤となるOSやハードウェアのしくみや動作を、\n具体的にイメージすることができるでしょうか。\n\n本書では、サーバ、クラウドからスマートフォン、IoT機器まで幅広く利用されているLinux OSを対象に、\nプロセススケジューラ、メモリ管理、記憶階層、ファイルシステム、ストレージデバイスなど、\nOSとハードウェアに関するしくみがどのように動くのか、\n実験とその結果を示すグラフを用いてわかりやすく解説します。',
          publisher: '技術評論社',
          category: '技術書',
          imagePath: require('../../../assets/images/books/001.jpeg'),
          status: '貸出中',
          tags: [
            'Linux',
            'OS'
          ],
          reviews: [
            {
              id: 1,
              bookId: 1,
              userId: 1,
              userName: '東浦 允',
              content: 'linux初心者が、内部の動作について学ぶのに最適です。この本を読むことで、理解が一段階深まった気がします！',
              point: 4,
              createdAt: new Date(2019, 3, 1),
              updatedAt: new Date(2019, 3, 1)
            },
            {
              id: 2,
              bookId: 1,
              userId: 2,
              userName: 'gashiura',
              content: '素晴らしい本ですね！絶対読んだ方がいいです！',
              point: 3,
              createdAt: new Date(2019, 3, 3),
              updatedAt: new Date(2019, 3, 3)
            },
          ]
      }
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
        url: '/book/1'
      },
    ]);
  },
  computed: {
    isRental: function() {
      return this.book.status === '貸出中' ? true : false;
    }
  },
  methods: {
    ...mapActions(['changeBreadclumbList'])
  }
}
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

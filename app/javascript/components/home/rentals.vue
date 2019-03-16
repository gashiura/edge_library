<template>
<div id="rentals-container">
  <label id="rental-title">レンタル中の書籍</label>
  <label v-if="hasOverdueBook" id="warinig-message">返却予定日を過ぎている書籍があります。</label>
  <div v-if="notExitsRetalBook" id="nobook-message">レンタル中の書籍はありません。</div>
  <table v-else id="table">
    <thead id="table-header">
      <tr class="table-row">
        <th class="col-header" :class="column.styleName" v-for="column in columns" :key="column.name">{{ column.name }}</th>
      </tr>
    </thead>
    <tbody id="table-body">
      <tr v-for="rental in rentals" :key="rental.id" class="table-row">
        <td class="cell col-id">{{ rental.egId }}</td>
        <td class="cell col-book"><router-link to="/book/1">{{ rental.bookName }}</router-link></td>
        <td class="cell col-checkuout-date">{{ formatDate(rental.checkoutDate) }}</td>
        <td class="cell col-return-due-date":class="isOverdue(rental.returnDueDate),">
          <i v-if="isOverdue(rental.returnDueDate)" class="fas fa-exclamation-circle"></i>
          {{ formatDate(rental.returnDueDate) }}
        </td>
        <td class="cell" col-return><button id="return-button">返却</button></td>
      </tr>
    </tbody>
  </table>
</div>
</template>

<script>
export default {
  data() {
    return {
      columns: [
        {
          name: 'ID',
          styleName: 'col-id'
        },
        {
          name: '書籍',
          styleName: 'col-book'
        },
        {
          name: '貸出日',
          styleName: 'hd-checkuout-date'
        },
        {
          name: '返却予定日',
          styleName: 'hd-return-due-date'
        },
        {
          name: '',
          styleName: 'col-return'
        }
      ],
      rentals: [
        {
          id: 1,
          egId: "EG000001",
          bookName: "[試して理解]Linuxのしくみ ~実験と図解で学ぶOSとハードウェアの基礎知識",
          checkoutDate: new Date(2018, 3, 1, 12, 32),
          returnDueDate: new Date(2018, 3, 1, 12, 32)
        },
        {
          id: 2,
          egId: "EG000002",
          bookName: "実践ハイパフォーマンスMySQL 第3版",
          checkoutDate: new Date(2019, 3, 1, 12, 32),
          returnDueDate: new Date(2019, 3, 31, 0, 0)
        },
        {
          id: 3,
          egId: "EG000003",
          bookName: "オブジェクト指向設計実践ガイド ~Rubyでわかる 進化しつづける柔軟なアプリケーションの育て方",
          checkoutDate: new Date(2019, 3, 1, 12, 32),
          returnDueDate: new Date(2019, 3, 31, 0, 0)
        }
      ]
    };
  },
  computed: {
    hasOverdueBook: function() {
      var overdueBooks = this.rentals.map(rental => {
        return this.isOverdue(rental.return_due_date);
      });
      return overdueBooks.length > 0;
    },
    notExitsRetalBook: function() {
      return this.rentals.length == 0;
    }
  },
  methods: {
    formatDate: dt => {
      var y = dt.getFullYear();
      var m = ("00" + (dt.getMonth()+1)).slice(-2);
      var d = ("00" + dt.getDate()).slice(-2);
      return y + "/" + m + "/" + d;
    },
    isOverdue: returnDueDate => {
      return returnDueDate < new Date();
    }
  }
}
</script>

<style lang="scss" scoped>
#rentals-container {
  #rental-title {
    font-size: 18px;
    margin-bottom: 20px;
    &:before {
      font-family: "Font Awesome 5 Free";
      content: '\f02d';
      font-weight: 900;
      font-size: 1.1em;
      color: brown;
      margin-right: 0px;
      margin-left: 0px;
    }
  }

  #warinig-message {
    color: red;
    font-size: 14px;
    margin-top: 10px;
    margin-left: 10px;

    &:before {
      font-family: "Font Awesome 5 Free";
      content: '\f06a';
      font-weight: 900;
      font-size: 1.1em;
      color: red;
    }
  }

  #nobook-message {
    font-size: 14px;
    margin-top: 20px;
    margin-left: 40px;

    &:before {
      font-family: "Font Awesome 5 Free";
      content: '\f06a';
      font-weight: 900;
      font-size: 1.1em;
      color: blue;
      margin-right: 5px;
    }
  }

  .col-id {
    width: 80px;
  }
  .col-book {
    width: 650px;
  }
  .hd-checkuout-date, .hd-return-due-date,
  .col-checkuout-date, .col-return-due-date {
    width: 110px;
  }
  .col-checkuout-date, .col-return-due-date {
    text-align: center;
  }
  .col-return {
    width: 100px;
  }

  #table {
    font-size: 14px;
    margin-top: 20px;
    border: 1px gray solid;
    border-collapse: separate;
    border-spacing: 0;
    border-radius: 5px;
    table-layout: fixed;

    #table-header, #table-body { display: block; }
    #table-header {
      .table-row{
        .col-header {
          color: white;
          background: #008080;
          padding: 10px;
          border-bottom: 1px gray solid;
        }
        .col-header + .col-header {
          border-left: 1px gray solid;
        }
        &:last-child .col-header{ border-bottom: none; }
        &:first-child .col-header:first-child { border-radius: 5px 0px 0px 0px; }
        &:first-child .col-header:last-child { border-radius: 0px 5px 0px 0px; }
      }
    }

    #table-body {
      height: auto;
      max-height: 150px;
      overflow-y: scroll;

      .table-row {
        .cell {
          background: #f5f5f5;
          padding: 10px;
          border-bottom: 1px gray solid;
          &:last-child {
            padding: 0px;
          }
          #return-button {
            width: 100px;
          }
        }
        .cell + .cell {
          border-left: 1px gray solid;
        }
        &:last-child .cell{ border-bottom: none; }
        &:last-child .cell:first-child { border-radius: 0px 0px 0px 5px; }
        &:last-child .cell:last-child { border-radius: 0px 0px 5px 0px; }
      }
    }
  }
}
</style>

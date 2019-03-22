<template>
  <div id="rentals-container">
    <label id="rental-title">レンタル中の書籍</label>
    <label v-if="hasOverdueBook" id="warinig-message">返却予定日を過ぎている書籍があります。</label>
    <div v-if="notExistsRetalBook" id="nobook-message">レンタル中の書籍はありません。</div>
    <table v-else id="table">
      <thead id="table-header">
        <tr class="table-row">
          <th class="col-header" :class="column.styleName" v-for="column in columns" :key="column.name">{{ column.name }}</th>
        </tr>
      </thead>
      <tbody id="table-body">
        <tr v-for="rental in rentals" :key="rental.id" class="table-row">
          <td class="cell hd-id">{{ rental.eg_id }}</td>
          <td class="cell hd-book">
            <router-link to="/book/1">{{ rental.book_name }}</router-link>
          </td>
          <td class="cell hd-checkuout-date">{{ rental.checkout_date }}</td>
          <td class="cell hd-return-due-date" :class="isOverdue(rental.return_due_date),">
            <i v-if="isOverdue(rental.return_due_date)" class="fas fa-exclamation-circle"></i>
            {{ rental.return_due_date }}
          </td>
          <td class="cell" col-return><button id="return-button">返却</button></td>
        </tr>
      </tbody>
    </table>
  </div>
</template>

<script>
import http from '../../api/axios';

export default {
  data() {
    return {
      columns: [
        {
          name: 'ID',
          styleName: 'hd-id'
        },
        {
          name: '書籍',
          styleName: 'hd-book'
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
          styleName: 'hd-return'
        }
      ],
      rentals: [],
      userId: 1
    };
  },
  created: function() {
    this.getRentals(this.userId);
  },
  computed: {
    hasOverdueBook: function() {
      var overdueBooks = this.rentals.map(rental => {
        return this.isOverdue(rental.return_due_date);
      });
      return overdueBooks.length > 0;
    },
    notExistsRetalBook: function() {
      return this.rentals.length == 0;
    }
  },
  methods: {
    getRentals: function(userId) {
      http.get(`/api/rentals/${userId}`).then(response => (this.rentals = response.data.rentals));
    },
    isOverdue: function(returnDueDate) {
      return returnDueDate < new Date();
    }
  }
};
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

  .hd-id {
    width: 80px;
  }
  .hd-book {
    width: 650px;
  }
  .hd-checkuout-date, .hd-return-due-date,
  .col-checkuout-date, .col-return-due-date {
    width: 110px;
  }
  .hd-checkuout-date, .hd-return-due-date {
    text-align: center;
  }
  .hd-return {
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
          background: black;
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
            width: 80px;
            height: 30px;
            margin: 0px 20px;
            color: black;
            background: white;
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

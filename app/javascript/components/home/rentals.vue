<template>
  <div id="rentals-container">
    <label id="rental-title">レンタル中の書籍</label>
    <label
      v-if="hasOverdueBook"
      id="warinig-message"
    >返却予定日を過ぎている書籍があります。</label>
    <table
      v-if="existsRetalBook"
      id="table"
    >
      <thead id="table-header">
        <tr class="table-row">
          <th
            v-for="column in columns"
            :key="column.name"
            class="col-header"
            :class="column.styleName"
          >
            {{ column.name }}
          </th>
        </tr>
      </thead>
      <tbody id="table-body">
        <tr
          v-for="rental in rentals"
          :key="rental.id"
          class="table-row"
        >
          <td class="cell col-id">
            {{ rental.eg_id }}
          </td>
          <td class="cell col-book">
            <router-link :to="{ name: 'book', params: { id: rental.book_id }}">
              {{ rental.book_name }}
            </router-link>
          </td>
          <td class="cell col-checkuout-date">
            {{ rental.checkout_date }}
          </td>
          <td class="cell col-return-due-date">
            <i
              v-if="rental.overdue"
              class="fas fa-exclamation-circle exclamation-mark"
            />
            {{ rental.return_due_date }}
          </td>
          <td class="cell col-return">
            <button
              class="small-button modal-button-margin"
              @click="openModal(rental.id)"
            >
              返却
            </button>
          </td>
        </tr>
      </tbody>
    </table>
    <div
      v-else
      id="nobook-message"
    >
      レンタル中の書籍はありません。
    </div>
  </div>
</template>

<script>
import { mapGetters, mapActions } from 'vuex';

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
          styleName: 'col-checkuout-date'
        },
        {
          name: '返却予定日',
          styleName: 'col-return-due-date'
        },
        {
          name: '',
          styleName: 'col-return'
        }
      ]
    };
  },
  created() {
    this.getRentals(this.user.id);
  },
  computed: {
    ...mapGetters(['user']),
    ...mapGetters('home', ['rentals']),
    hasOverdueBook: function() {
      const overdueBooks = this.rentals.map(rental => {
        return rental.overdue;
      });
      return overdueBooks.length > 0;
    },
    existsRetalBook: function() {
      return this.rentals.length > 0;
    }
  },
  methods: {
    ...mapActions('home', ['toggleModal', 'getRentals', 'getRentalBook']),
    openModal: function(id) {
      this.toggleModal(true);
      this.getRentalBook(id);
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

  .exclamation-mark {
    color: red;
  }

  .col-id {
    width: 80px;
  }
  .col-book {
    width: 650px;
  }
  .col-checkuout-date, .col-return-due-date {
    width: 110px;
  }
  .col-return {
    width: 100px;
  }
  .col-checkuout-date, .col-return-due-date, .col-return {
    text-align: center;
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
            padding: 5px 0px;
          }
          .modal-button-margin {
            margin: 0px 20px;
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

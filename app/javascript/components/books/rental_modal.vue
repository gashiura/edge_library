<template>
  <transition name="modal">
    <div v-if="showModal" class="modal-mask">
      <div class="modal-wrapper">
        <div class="modal-container">
          <div class="modal-close">
            <button class="small-button button-right" @click="close">Close</button>
          </div>
          <div class="modal-header">
            書籍をレンタルする
          </div>
          <div class="modal-content">
            <div class="modal-item">
              <label class="item-label">書籍名</label>
              <div class="item-value">{{ book.name }}</div>
            </div>
            <div class="modal-item">
              <label class="item-label">返却予定日</label>
              <label v-if="isPast" class="date-alert">{{ today }}以降を入力して下さい。</label>
              <div class="item-value">
                <input type="date" class="basic-input input--short-width" v-model="returnDueDate">
              </div>
            </div>
          </div>
          <div class="modal-footer">
            <button @click="createRental" class="basic-button" :class="{ 'disable-button': disableButton }">レンタルする</button>
          </div>
        </div>
      </div>
    </div>
  </transition>
</template>

<script>
import { mapGetters, mapActions } from 'vuex';
import http from '../../api/axios';

export default {
  data() {
    return {
      returnDueDate: null
    };
  },
  computed: {
    ...mapGetters(['user']),
    ...mapGetters('book', ['book', 'showModal']),
    isPast: function() {
      return new Date(this.returnDueDate) < new Date;
    },
    today: function() {
      let dt = new Date;
      let month = dt.getMonth() + 1;
      return `${month}/${dt.getDate()}`;
    },
    disableButton: function() {
      return this.returnDueDate === null || this.isPast;
    }
  },
  methods: {
    ...mapActions('book', ['toggleModal']),
    close() {
      this.returnDueDate = null;
      this.toggleModal(false);
    },
    createRental() {
      if(confirm('書籍をレンタルしますか？')) {
        http.post('/api/rentals/create', {
          book_id: this.book.id,
          user_id: this.user.id,
          checkout_date: new Date,
          return_due_date: this.returnDueDate
        }).then(response =>(
          alert(response.data.message)
        ));
        this.close();
      }
    }
  }
};
</script>

<style lang="scss" scoped>
.modal-mask {
  position: fixed;
  z-index: 9998;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
  background-color: rgba(0, 0, 0, .5);
  display: table;
  transition: opacity .3s ease;
}

.modal-wrapper {
  display: table-cell;
  vertical-align: middle;
}

.modal-container {
  position: relative;
  z-index: 9999;
  width: 500px;
  height: 350px;
  margin: 0px auto;
  padding: 15px 30px;
  background-color: #fff;
  border-radius: 2px;
  box-shadow: 0 2px 8px rgba(0, 0, 0, .33);
  transition: all .3s ease;
  font-family: Helvetica, Arial, sans-serif;

  .modal-close {
    height: 30px;

    .button-right {
      float: right;
    }
  }

  .modal-header {
    font-size: 20px;
    font-weight: bold;
    margin-left: 5px;
  }

  .modal-content {
    margin: 20px;

    .modal-item {
      margin-bottom: 20px;
    }

    .item-label {
      font-size: 14px;
      text-decoration: underline;
    }

    .overdue-alert {
      font-size: 12px;
      color: red;

      &:before {
        font-family: "Font Awesome 5 Free";
        content: '\f06a';
        font-weight: 900;
        font-size: 1.1em;
        color: red;
        margin-left: 15px;
      }
    }

    .item-value {
      margin-left: 15px;
      margin-top: 10px;
    }
  }

  .modal-footer {
    margin-top: 50px;
    text-align: center;
  }
}

.date-alert {
  font-size: 12px;
  color: red;

  &:before {
    font-family: "Font Awesome 5 Free";
    content: '\f06a';
    font-weight: 900;
    font-size: 1.1em;
    color: red;
    margin-left: 10px;
  }
}

.input--short-width {
  width: 150px;
}

.modal-enter {
  opacity: 0;
}

.modal-leave-active {
  opacity: 0;
}

.modal-enter .modal-container,
.modal-leave-active .modal-container {
  -webkit-transform: scale(1.1);
  transform: scale(1.1);
}
</style>

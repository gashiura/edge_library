<template>
<transition name="modal">
  <div v-if="showModal" class="modal-mask">
    <div class="modal-wrapper">
      <div class="modal-container">
        <div class="modal-close">
          <button class="small-button button-right" @click="close">Close</button>
        </div>
        <div class="modal-header">
          書籍を返却する
        </div>
        <div class="modal-content">
          <div>書籍名： {{ rentalBook.book_name }}</div>
          <div>返却予定日： {{ rentalBook.return_due_date }}</div>
          <label class="approver-label">確認者を入力して下さい。</label>
          <input class="basic-input" v-model="returnApprover">
        </div>
        <div class="modal-footer">
          <button @click="register" class="basic-button" :class="{ 'disable-button': disableButton }">返却する</button>
        </div>
      </div>
    </div>
  </div>
</transition>
</template>

<script>
import { mapGetters, mapActions } from 'vuex';

export default {
  data() {
    return {
      returnApprover: ''
    }
  },
  computed: {
    ...mapGetters('home', ['showModal', 'rentalBook']),
    disableButton: function() {
      return this.returnApprover === '';
    }
  },
  methods: {
    ...mapActions('home', ['toggleModal']),
    close: function() {
      this.returnApprover = '';
      this.toggleModal(false);
    },
    register: function() {
      if(confirm('書籍を返却してよろしいですか？')) {
        this.close();
        return;
      }
    }
  }
}
</script>

<style lang="scss">
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
  height: 500px;
  margin: 0px auto;
  padding: 20px 30px;
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
  }

  .modal-content {
    margin: 30px;

    .approver-label {
      color: red;
    }
  }

  .modal-footer {
    margin-top: 20px;
    text-align: center;
  }
}

.modal-default-button {
  float: right;
  width: 100px;
  height: 30px;
  font-size: 14px;
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

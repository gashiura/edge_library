<template>
  <paginate
    :page-count="pageCount"
    :page-range="perPage"
    :margin-pages="2"
    :clickHandler="clickHandler"
    :prev-text="'前へ'"
    :next-text="'次へ'"
    :container-class="'pagination'"
    :prev-class="'prev-item'"
    :next-class="'next-item'"
    :active-class="'active'"
    :disable-class="'disable'">
  </paginate>
</template>

<script>
import Paginate from 'vuejs-paginate';

export default {
  components: {
    Paginate
  },
  props: {
    pageCount: {
      type: Number,
      default: 1
    },
    perPage: {
      type: Number,
      default: 20
    }
  },
  methods: {
    clickHandler: function(pageNum) {
      this.$emit('clickHandler', pageNum);
    }
  }
};
</script>

<style lang="scss">
.pagination {
  text-align: center;
  margin: 20px 0;
  li {
    display: inline-block;
    width: 30px;
    height: 30px;
    margin: 0px;
    text-align: center;
    background: white;
    color: #2e7fea;
    border: solid 1px lightgray;

    &:hover:not(.active):not(.disabled) {
      background: lightgray;
      color: #2e7fea;
    }

    a {
      vertical-align: middle;
      overflow : hidden;
      outline : none;
    }
  }
  .prev-item {
    width: 80px;
    margin: 0px;
    border-radius: 5px 0 0 5px;
  }
  .next-item {
    width: 80px;
    margin: 0px;
    border-radius: 0 5px 5px 0;
  }
  .active {
    background: #2e7fea;
    color: white;
    border-color: #2e7fea;
  }
  .disabled {
    background: gray;
    color: black;
    border-color: gray;
  }
}
</style>

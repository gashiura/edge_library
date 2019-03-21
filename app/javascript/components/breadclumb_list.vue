<template>
<ul class="breadcrumb">
  <li v-for="breadclumb in breadclumbList" :key="breadclumb.pagename" itemscope="itemscope" itemtype="http://data-vocabulary.org/Breadcrumb">
    <router-link :to="breadclumb.url" itemprop="url">
      <span itemprop="title">{{ breadclumb.pagename }}</span>
    </router-link>
  </li>
</ul>
</template>

<script>
import { mapGetters } from 'vuex';

export default {
  computed: {
    ...mapGetters(['breadclumbList'])
  }
}
</script>

<style lang="scss" scoped>
.breadcrumb {
  margin-left: 20px;
  padding-left: 0;
}

.breadcrumb li {
  display: inline;
  list-style: none;
  &:after {
    content: '>';
    padding: 0 3px;
    color: #555;
  }
  &:last-child:after {
    content: '';
  }
}

.breadcrumb li a {
  text-decoration: none;
  color: gray;
  &:hover {
    text-decoration: underline;
  }
}

.breadcrumb li:first-child a:before {
  /*家アイコン*/
  font-family: "Font Awesome 5 Free";
  content: '\f015';
  font-weight: 900;
  font-size: 1.1em;
  color: #008080;
}
</style>

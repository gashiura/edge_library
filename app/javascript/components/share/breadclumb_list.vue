<template>
  <ul class="breadcrumb">
    <li
      v-for="breadclumb in breadclumbs"
      :key="breadclumb.pagename"
      itemscope="itemscope"
      itemtype="http://data-vocabulary.org/Breadcrumb"
    >
      <span v-if="disableLink(breadclumb.name)">
        {{ breadclumb.pageName }}
      </span>
      <router-link
        v-else
        :to="{ name: breadclumb.routeName }"
        itemprop="url"
      >
        <span itemprop="title">{{ breadclumb.pageName }}</span>
      </router-link>
    </li>
  </ul>
</template>

<script>
export default {
  computed: {
    breadclumbs: function() {
      return this.$route.meta.breadclumbs;
    }
  },
  methods: {
    disableLink: function(pageName) {
      return this.$route.name === pageName;
    }
  }
};
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
    margin: 0px 5px;
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
  color: #2e7fea;
  margin-right: 2px;
}
</style>

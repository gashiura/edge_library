<template>
  <div id="point-container">
    <template v-for="n in 5">
      <template v-if="enableClick">
        <i v-if="enableStar(n)" class="fas fa-star star pointer-cursor" :key="n" @click="updatePoint(n)"></i>
        <i v-else class="fas fa-star no-star pointer-cursor" :key="n" @click="updatePoint(n)"></i>
      </template>
      <template v-else>
        <i v-if="enableStar(n)" class="fas fa-star star" :key="n"></i>
        <i v-else class="fas fa-star no-star" :key="n"></i>
      </template>
    </template>
    <label id="point">{{ point }}</label>
  </div>
</template>

<script>
export default {
  props: {
    point: {
      type: Number,
      default: 0
    },
    enableClick: Boolean
  },
  methods: {
    updatePoint: function(point) {
      if(this.point === point) {
        this.point -= 1;
      }else {
        this.point = point;
      }
      return;
    },
    enableStar: function(point) {
      return point <= this.point;
    }
  }
};
</script>

<style lang="scss" scoped>
#point-container {
  .star { color: #ffd700; }
  .no-star { color: gray; }
  .pointer-cursor { cursor: pointer; }
  #point { margin-left: 10px; }
}
</style>

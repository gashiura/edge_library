<template>
  <div id="point-container">
    <template v-for="n in 5">
      <template v-if="enableClick">
        <i
          v-if="enableStar(n)"
          :key="n"
          class="fas fa-star star pointer-cursor"
          @click="update(n)"
        />
        <i
          v-else
          :key="n"
          class="fas fa-star no-star pointer-cursor"
          @click="update(n)"
        />
      </template>
      <template v-else>
        <i
          v-if="enableStar(n)"
          :key="n"
          class="fas fa-star star"
        />
        <i
          v-else
          :key="n"
          class="fas fa-star no-star"
        />
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
    update: function(point) {
      this.$emit('update', point);
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
  #point {
    margin-left: 10px;
    font-size: 12px;
  }
}
</style>

<template>
  <div class='info-panel-div'>
  
  <h1>{{this.outputTrees[0].common_name}}</h1>
  <Tree v-for="(tree, index) in this.outputTrees"
        v-bind:index="index"
        v-bind:key="tree.id"
        v-bind:tree="tree"/>

  </div>
</template>
<script>
import Tree from './tree'
export default {
  name: 'infoPanel',
  components: {
    Tree,
  },
  props: {
    outputTrees: Array
  },
  watch:{
    outputTrees() {
      console.log("hitting info panel", this.outputTrees)
    }
  }
}
</script>
<style scoped>
.info-panel-div {
  /* width: 100%; */
  width: 53%;
  margin: 1em;
  border: 1.5px solid grey;
  border-top: green 3px solid;
}
</style>
<template>
  <div class='info-panel-div'>
  
  <h1>{{this.searched}} {{this.outputTrees[0].common_name}} Results: {{this.outputTrees.length}} Trees Found</h1>
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
    outputTrees: Array,
    searched: String,
  },
  watch:{
    outputTrees() {
      console.log("hitting info panel", this.outputTrees)
    },
    searched(){
      
    }
  }
}
</script>
<style scoped>
.info-panel-div {
  /* width: 100%; */
  overflow: scroll;
  width: 53%;
  height: 80em;
  margin: 1em;
  border: 1.5px solid grey;
  border-top: green 3px solid;
}
h1 {
  /* margin-left: 1.3em;  */
}
</style>
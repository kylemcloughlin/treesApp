<template>
  <div
    v-if="this.makeMarkers === true "
  >
    <h1>maps</h1>
    <GmapMap
      :center="{lat:43, lng:-79}"
      :zoom="7"
      style="width:640px; height:360px; margin: 32px auto"
    >

      <GmapMarker 
        v-for="(tree, index) in this.markerTrees"
        v-bind:index="index"
        v-bind:key="tree.id"
      v-bind:position="{lat:tree.long_coordinate, lng:tree.lat_coordinate}"
        :clickable="true" 
         :icon="{ url: require('../assets/treeMarker.png')}" />
        :draggable="true" />
    </GmapMap>
  </div>
</template>
<script>
export default {
  name: "map",
  props: {
    markerTrees: Array
  },
  data() {
    return{
      makeMarkers: false
    }
  },
  watch: {
    markerTrees() {
      console.log("POPOP", this.markerTrees);
      this.makeMarkers = true
      for (let tree of this.markerTrees) {
        console.log(tree.address)
        console.log(tree.name)
        // console.log("???????", tree.long_coordinate)
        //  console.log("???????", tree.lat_coordinate)
        // let x = this.markerTrees[tree].long_coordinate
//         console.log( typeof this.markerTrees[tree].lat_coordinate)
//         console.log(this.markerTrees[tree].lat_coordinate)
// console.log()
//         console.log( typeof this.markerTrees[tree].long_coordinate)
//         console.log( this.markerTrees[tree].long_coordinate)


        // console.log(x.isInteger())



      }
      console.table(this.markerTrees);
    }
  },
  created() {
    console.log("yoyoyoy", this.markerTrees);
  }
};
</script>
<style>
</style>
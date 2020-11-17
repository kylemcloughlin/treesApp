<template>
  <div class='map-div'
    v-show="this.makeMarkers === true " >

    <GmapMap
    
      :center="{lat:43, lng:-79}"
      :zoom="10"
      style="width:640px; height:360px; margin: 32px auto"
    >

      <GmapMarker 
        v-for="(tree, index) in this.markerTrees"
        v-bind:index="index"
        v-bind:key="tree.id"
      v-bind:position="{lat:tree.long, lng:tree.lat}"
        :clickable="true" 
         :icon="{ url: require('../assets/treeMarker.png')}" />
        
    </GmapMap>
  </div>
</template>
<script>
export default {
  name: "map",
  props: {
    markerTrees: Array,
    searched: String
  },
  data() {
    return{
      makeMarkers: false
    }
  },
  watch: {
    markerTrees() {
      if(this.searched === 'diameters') {
          console.log('')
        
      }
      this.makeMarkers = true
    
      
    }
  },
  created() {
    
  }
};
</script>
<style>
.map-div {
  /* width: 100%; */
  width: 53%;
height: 26em;
  margin: 1em;
  border: 1.5px solid grey;
  border-top: green 3px solid;
}

</style>
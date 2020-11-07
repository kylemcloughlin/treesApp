<template>
  <div>
  <h1>maps</h1>
  <GmapMap 
  :center="{lat:10, lng:10}"
  :zoom="7"
  style="width:640px; height:360px; margin: 32px auto"
  >
  
  <GmapMarker
  
    :position="{lat:10, lng:10}"
    :clickable="true"
    :draggable="false"

  />
  </GmapMap>
   </div>
</template>
<script>
export default {
  name: 'map',

}
</script>
<style>

</style>
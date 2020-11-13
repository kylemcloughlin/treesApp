<template>
  <div class='tree-div' v-bind:class="[(tree.first === true) ? 'top' : '']" >
    <h3 class='tree-h3'>{{tree.common_name}} {{tree.id}}</h3>
    <h3 class='tree-h3'> <i>{{tree.botanical_name}}</i></h3>
  <span class='tree-span'>{{tree.address}} {{tree.name}}</span>
  <br/>
  <span class='tree-diam'> Diameter at Breast Height: {{tree.dbh_trunk}}</span>
  </div>
</template>
<script>
export default {
  name: 'tree',
props: {
  tree: Object
}
}
</script>
<style scoped>
 .tree-div {
  width: 100%;

  border: 1.5px solid grey;
  border-top: green 3px solid
 }
 .tree-h3 {
position: relative;
right: 29%;
margin-left: 2.3em;
 }

  .tree-span {
position: relative;
right: 37%;
margin-left: 3em;

 }
   .tree-diam {
position: relative;
right: 31%;

 }
 .top{
   margin-top: 8em; 
 }
</style>
<template>
  <div class='tree-div' v-bind:class="[(tree.first === true) ? 'top' : '']" v-on:click.stop="openInfoWindow(tree)">
    <h3 class='tree-h3'>{{tree.common_name}}</h3>
    <h4 class='tree-h4'> <i>{{tree.botanical_name}}</i></h4>
  <span class='tree-diam'> Diameter at Breast Height: {{tree.dbh_trunk}}</span>
  <br/>
  <span class='tree-span'>{{tree.address}} {{tree.name}}</span>
  </div>
</template>
<script>
export default {
  name: 'tree',
props: {
  tree: Object
},
methods: {
  openInfoWindow(tree){
   return this.$emit('infoWindow', tree);
  }

}
}
</script>
<style scoped>
 /* @media only screen and (max-width: 414px) {} */
 .tree-div {
  /* width: 99%; */
  align-content: unset;
  border: 1.5px solid grey;
  border-top: green 3px solid
 }
 .tree-h3 {
 position: relative;
 padding-left: 1em;
 }
 .tree-h4 {
position: relative;
 padding-left: 1em;
 }
  .tree-span {
position: relative;
 padding-left: 1em;


 }
   .tree-diam {
position: relative;
 padding-left: 1em;

 }
 .top{
   margin-top: -1.5em; 
 }
</style>
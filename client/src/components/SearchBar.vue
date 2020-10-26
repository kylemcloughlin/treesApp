<template>
<div>
  <!-- <h2>{{msg}}</h2> -->
   <form @submit="searchTree">
     <select name="tree-selector" >
<!-- <div v-bind:key="tree.x" v-for="tree in trees"> -->
  <option v-bind:key="tree.x" v-for="tree in trees">
   {{tree.common_name}}
    </option>
  <!-- </div> -->
</select>
  <input type="text" :placeholder="this.placeHolderValue"/>
    <input type="submit" value="submitboi" class='btn' @submit.prevent="searchTree"/>
  </form>
</div>
</template>

<script>
// import axios from 'axios';

export default {
  name: "SearchBar",
  data() {
    return {
      placeHolderValue: 'weee'
    }
  },
  props: {
    trees: Array
  },
  methods: {
     searchTree(e) {
      console.log('hit');
   
      e.preventDefault();
 this.$http.plain.get('/trees')
  .then( response => response.data)
  .then(data => console.log(data[0]))
  .catch(err => console.log(":(",err))

 }
},
created(){
  console.log(this.trees)
}
    
  
};
</script>

// <!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped>
/* h3 {
  margin: 40px 0 0;
}
ul {
  list-style-type: none;
  padding: 0;
}
li {
  display: inline-block;
  margin: 0 10px;
}
a {
  color: #42b983;
} */
</style>
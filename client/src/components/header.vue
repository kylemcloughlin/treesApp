<template>
<div>
  <h2>{{msg}}</h2>
   <form @submit="searchTree">
    <input type="submit" value="submitboi" class='btn' @submit.prevent="searchTree">
  </form>
</div>
</template>

<script>
// import axios from 'axios';

export default {
  name: "Header",
  props: {
    msg: String
  },
  methods: {
     searchTree(e) {
      console.log('hit');
   
      e.preventDefault();
 this.$http.plain.get('/trees')
  .then( response => response.data)
  .then(data => console.log(data[0]))
  .catch(err => console.log(":(",err))
//   axios.get('http://localhost:3000/trees')
//     .then(res => console.log(res) )
//     .catch(err=> console.log(err))
 }
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

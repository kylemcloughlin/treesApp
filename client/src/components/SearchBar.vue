<template>
  <div>
    <!-- <h2>{{msg}}</h2> -->
    <form @submit="searchTree">
      <select v-if="this.search ===  'types'" v-model="output">
        <option
          v-bind:key="tree.x"
          v-for="tree in trees"
          v-bind:value="tree.id"
        >{{tree.common_name}} {{tree.botanical_name}}</option>
      </select>
      <select v-else-if="this.search === 'locations' " v-model="output">
        <option v-bind:key="tree.y" 
        v-for="tree in trees"
       v-bind:value="tree.id"
        >{{tree.address}} {{tree.name}}</option>
      </select>
      <select v-else name="tree-selector" v-model="output">
        <option v-bind:key="tree.geo_id" v-for="tree in trees">{{tree.dbh_trunk}}</option>
      </select>
      <!-- <input type="text" :placeholder="this.search" /> -->
      <input type="submit" value="submit" class="btn" @submit.prevent="searchTree" />
    </form>
  </div>
</template>

<script>
// import axios from 'axios';

export default {
  name: "SearchBar",
  data() {
    return {
      trees: [],
      dataSelect: "Location",
      output: ""
    };
  },
  props: {
    search: String,
    select: String
  },
  methods: {
    searchTree(e) {
      console.log("hit search");
      console.log("######");
      // console.log(this.search)
      e.preventDefault();
    
  
      // this.$emit('update:myProp',response.data)
      this.$http.plain
        .get(`/${this.search}/${this.output}`)
        .then(response => this.$emit('setTrees' ,response.data))
        .catch(err => console.log(":(", err));
      console.log("######");
    },
    getTrees() {
      this.$http.plain
        .get(`/${this.search}`)

        .then(response => (this.trees = response.data))
        .then(() => console.log(this.trees))
        .catch(err => console.log(":(", err));

      console.log(this.baseTrees);
    }
  },

 watch:{
            search(){
                 this.getTrees();

            }
  },


  created() {
    this.getTrees();
    console.log(this.trees);
    this.dataSelect = this.search;
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
<template>
  <div>
    <!-- <h2>{{msg}}</h2> -->
    <form @submit="searchTree">
      <select  v-if="this.search ===  'Species'" >
        <option v-bind:key="tree.x" v-for="tree in trees" value="tree.x">{{tree.common_name}} {{tree.botanical_name}}</option>
      </select>      
       <select v-else-if="this.search ===  'Location'">
        <option v-bind:key="tree.y" v-for="tree in trees" value="tree.y">{{tree.address}} {{tree.name}} </option>
      </select>      
        <select v-else name="tree-selector">
        <option  v-bind:key="tree.y" v-for="tree in trees" value="tree.x">{{tree.dbh_trunk}}</option>
      </select>
      <input type="text" :placeholder="this.search" />
      <input type="submit" value="submitboi" class="btn" @submit.prevent="searchTree" />
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
      dataSelect: 'Location'
    };
  },
  props: {
    search: String,
    select: String
  },
  methods: {
    searchTree(e) {
      console.log("hit");

      e.preventDefault();
      this.$http.plain
        .get("/trees")
        .then(response => response.data)
        .then(data => console.log(data[0]))
        .catch(err => console.log(":(", err));
    },
    getTrees() {
      console.log("hi   errret");
      this.$http.plain
        .get("/trees")

        .then(response => (this.trees = response.data))
        .then(() => console.log(this.trees))
        .catch(err => console.log(":(", err));

      console.log(this.baseTrees);
    }
  },

  created() {
    this.getTrees();
    console.log(this.trees);
    this.dataSelect =  this.search;
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
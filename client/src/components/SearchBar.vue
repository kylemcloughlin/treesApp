<template>
  <div id='search-holder'>
    <!-- <h2>{{msg}}</h2> -->
    <form @submit="searchTree">
      <select v-if="this.search ===  'types'" v-model="output">
        <option
          v-bind:key="tree.id"
          v-for="tree in trees"
          v-bind:value="tree.id"
        >{{tree.common_name}} {{tree.botanical_name}}</option>
      </select>
      <select v-else-if="this.search === 'locations' " v-model="output">
        <option v-bind:key="tree.id" 
        v-for="tree in trees"
       v-bind:value="tree.id"
        >{{tree.address}} {{tree.name}}</option>
      </select>
     <div v-else>
        <h1>{{this.trees[this.numOutput].dbh_trunk}} inches </h1>
     <button  v-show="this.numOutput < 124" v-on:click.prevent='plus'>+</button> 
     <button  v-show="this.numOutput > 0" v-on:click.prevent='minus'>-</button> 

     <!-- <button value="-" v-on:submit.prevent="this.numOutput -= 1">-</button> -->
<!--      
       <select v-model="output">
                 <option v-bind:key="tree.id" 
        v-for="tree in trees"
       v-bind:value="tree.id"
        >{{tree.dbh_trunk}}</option> -->

      <!-- </select> -->
</div>
      <!-- <input type="range" v-else name="tree-selector"  min='0' max='125' v-model="numOutput"/> -->
        <!-- <h6>{{this.trees[this.numOutput].dbh_trunk}}</h6> -->
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
      output: "",
      numOutput: 3
    };
  },
  props: {
    search: String,
    select: String
  },
  methods: {
    searchTree(e) {
      console.log("######");
      // console.log(this.search)
      e.preventDefault();
      let conditonialOutput = this.search === 'diameters' ? (this.numOutput) : (this.output)
    console.log('conditonal search', this.search)
    
    console.log('conditonal search', conditonialOutput)
      console.log(`searching..... /${this.search}/${conditonialOutput}`)
      this.$http.plain
        .get(`/${this.search}/${conditonialOutput}`)
        .then(response => this.$emit('setTrees' ,response.data))
        .catch(err => console.log(":(", err));
      console.log("######");
    },
    getTrees() {
      this.$http.plain
        .get(`/${this.search}`)

        .then(response => (this.trees = response.data))
        // .then(() => )
        .catch(err => console.log(":(", err));

      // console.log(this.baseTrees);
    },
    plus() {
      this.numOutput = this.numOutput + 1;
     

    },
        minus() {
   
      this.numOutput = this.numOutput - 1;
    
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
  #search-holder {
  display: flex;
    width: 100%;
    position: absolute;
    top: 3em;
    /* left: 52%; */
    padding-left: 3em; 
  }
</style>
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
     <div v-else-if="this.search === 'locations' ">
    
    
      <input  v-show="selected === false" type='text' placeholder=" Search location here..." v-model="output" @keyup="autocomplete"/> 
      <div v-if="this.output.length > 0" v-show="selected === false"> 
      <div v-for="tree in suggestions"
       v-bind:key="tree.id"
       v-bind:value="tree.id"
       @click="help(tree)"
      > <h2>{{tree.address}} {{tree.name}}</h2>  
      </div>
      </div>
      <div v-if="selected === true">{{location.address}} {{location.name}}</div> 
      <!-- <div v-else/> -->
      <!-- <select v-model="output">
        <option v-bind:key="tree.id" 
        v-for="tree in trees"
       v-bind:value="tree.id"
        >{{tree.address}} {{tree.name}}</option>
      </select> -->
     </div>
     
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
      numOutput: 3,
      suggestions: [],
      selected: false,
      location: {}
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
    
    },
  autocomplete() {
    let list = this.trees
    let location = this.output
      console.log(list[0].name)
  this.suggestions  = list.filter(tree => {
    return tree.name.startsWith(location.toUpperCase())
  })
  if (this.output.length === 0) {
      this.suggestions = [];
  }
  },
  help(value) {
    console.log(`${value.address} ${value.name}`)
    this.location = value;
    this.selected = true;
    this.output = value.id
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
<template>
  <div id="app">
    <Header msg="trees App" />
    <Species msg v-on:setSearch="setSearch" />
    <Location msg v-on:setSearch="setSearch" />
    <Diameter msg v-on:setSearch="setSearch" />
    <SearchBar v-bind:search="this.baseSearch" msg="location" v-on:setTrees="setTrees" />
    <Map v-bind:markerTrees="this.searchedTrees"/>
  </div>
</template>

<script>
import Header from "./components/header.vue";
import Location from "./components/location";
import Diameter from "./components/diameter";
import SearchBar from "./components/SearchBar";
import Species from "./components/species";
import Map from './components/map';



export default {
  name: "App",
  components: {
    Header,
    Location,
    Diameter,
    SearchBar,
    Species,
    Map
  },
  methods: {
    setSearch(x) {
      console.log("set search", x);
      if (x === 'types') {
          console.log('species/types', x)
          return this.baseSearch = x; 

      } else if(  x === 'locations') {
          console.log('local', x)

          return this.baseSearch = x; 

      } else {
          console.log('kick a doo')

        return this.baseSearch = x; 

      }
    },
    setTrees(x) {
      console.log('hit app')
     return this.searchedTrees = x;
    }

  },
  created() {
  

  },
  data() {
    return {
      baseTrees: [],
      baseSearch: "types",
      searchedTrees: []
    };
  }
};
</script>

<style>
#app {
  font-family: Avenir, Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  text-align: center;
  color: #2c3e50;
  margin-top: 60px;
}
</style>

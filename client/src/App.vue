<template>
  <div id="app">
    <Header msg="trees App"/>
    <Location msg='' v-on:setSearch='setSearch'/>
    <Species msg=''  v-on:setSearch='setSearch'/>
    <Diameter msg=''  v-on:setSearch='setSearch'/>
    <SearchBar  v-bind:trees="this.baseTrees" msg="location"/>
  </div>
</template>

<script>
import Header from './components/header.vue'
import Location from './components/location'
import Diameter from './components/diameter'
import SearchBar from './components/SearchBar'
import Species from './components/species'

export default {
  name: 'App',
  components: {
    Header,
    Location,
    Diameter,
    SearchBar,
    Species

  },
  methods: {
   
   setSearch(x) {
      console.log('set search', x)
    },

    getTrees() {
       console.log('hi   errret');
   
      // e.preventDefault();
 this.$http.plain.get('/trees')

.then( response => this.baseTrees = response.data)
  .then(() => console.log(this.baseTrees))
  .catch(err => console.log(":(",err))

 console.log(this.baseTrees)
}
  },
  created () {
    this.getTrees();
  },
  data() {
    return {
      baseTrees: [

      ]
    }
  }

}
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

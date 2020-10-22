<template>
  <div id="app">
    <Header msg="trees App"/>
    <Location msg='' v-on:setSearch='setSearch'/>
    <Species msg=''/>
    <Diameter msg=''/>
    <SearchBar msg="location"/>
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

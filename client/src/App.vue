<template>
  <div id="app">
    <Header msg="trees App" v-on:backBtn="backBtn" v-bind:show="this.back"/>
    <div class="form-holder" v-show="formShow">
      <Species v-bind:msg="this.msg" v-on:setSearch="setSearch" />
      <Location v-bind:msg="this.msg" v-on:setSearch="setSearch" />
      <Diameter v-bind:msg="this.msg" v-on:setSearch="setSearch" />
      <SearchBar v-bind:search="this.baseSearch" msg="location" v-on:setTrees="setTrees" />
      <div class="btn-helper" />
    </div>
    <div class="output-holder" v-show='formShow === false'>
    <Map v-bind:markerTrees="this.searchedTrees" />
      <InfoPanel  v-if="formShow === false" v-bind:outputTrees="this.searchedTrees" v-bind:searched="this.baseSearch"/>
    </div>
  </div>
</template>

<script>
import Header from "./components/header.vue";
import Location from "./components/location";
import Diameter from "./components/diameter";
import SearchBar from "./components/SearchBar";
import Species from "./components/species";
import Map from "./components/map";
import InfoPanel from "./components/infoPanel";

export default {
  name: "App",
  components: {
    Header,
    Location,
    Diameter,
    SearchBar,
    Species,
    Map,
    InfoPanel
  },
  methods: {
    setSearch(x) {
      
      if (x === "types") {
      
        this.baseSearch = x;
        this.msg = x;
      } else if (x === "locations") {
      

        this.baseSearch = x;
        this.msg = x;
      } else {
      

        this.baseSearch = x;
        this.msg = x;
      }
    },
    setTrees(x) {
     
      this.searchedTrees = x
      return(this.formShow = false);

    },
    backBtn(x) {
      console.log("HELLLLL@@@@@@@@@@@@@@@@@@@@@@@@@@@L0", x);
      if (x === false) {
        console.log("")
      } else {
        return(this.formShow = x);

      }
    }
  },
  created() {
   
  },
  data() {
    return {
      baseTrees: [],
      baseSearch: "types",
      searchedTrees: [],
      msg: "types",
      formShow: true,
      back: false
    };
  }
};
</script>

<style>
body {
  margin: 0;
  padding: 0;
}
#app {
  font-family: Avenir, Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  text-align: center;
  color: #2c3e50;
  margin: 0;
  padding: 0;
}
.form-holder {
  width: 100%;
  position: relative;
  top: 3em;
  display: flex;
  margin: auto;
  width: 50%;
  height: 7em;

  border: 1.5px solid grey;
  border-top: 3px solid green;
  padding-bottom: 10px;
}
.btn {
  border-radius: 0em;
  border: 1.5px solid grey;
  /* border-bottom: none; */
}
.btn:focus {
  outline: none;
  box-shadow: none;
}
.btn-helper {
  border-top: 1.5px solid grey;
  width: 100%;
  height: 0px;
  position: relative;
  top: 1.24em;
  left: -1px;
}
.output-holder {
    width: 100%;
  position: relative;
  top: 3em;
  display: flex;
  margin: auto;

}
</style>

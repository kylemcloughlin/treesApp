<template>
  <div id="app">
    <Header msg="trees App" v-on:backBtn="backBtn" v-bind:show="this.back"/>
    <div class="form-holder" v-show="formShow">
  <div class='button-bar'>
      <Species v-bind:msg="this.msg" v-on:setSearch="setSearch" />
      <Location v-bind:msg="this.msg" v-on:setSearch="setSearch" />
      <Diameter v-bind:msg="this.msg" v-on:setSearch="setSearch" />
  </div>
      <SearchBar v-bind:search="this.baseSearch" msg="location" v-on:setTrees="setTrees" />
    </div>
    <div class="output-holder" v-show='formShow === false'>
    <Map v-bind:markerTrees="this.searchedTrees" v-bind:searched="this.baseSearch"/>
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
        console.log(this.msg)
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
      this.back = true;
      return(this.formShow = false);

    },
    backBtn(x) {
      if (x === false) {
        console.log()
      } else {
      this.back = false;
      

      this.output = ""
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

  color: #2c3e50;
  margin: 0;
  padding: 0;
}
.form-holder {
  width: 100%;
  max-width: 40em;
  position: relative;
  top: 3em;
  display: flex;
  margin: auto;
  width: 65%;
  height: 12em;
  /* overflow-x: hidden; */

  border: 1.5px solid grey;
  border-top: 3px solid green;
  padding-bottom: 10px;
}
.button-bar {
  width: 100%;
  display: flex;
height: 2.5em;
background-color: #555;
}
.btn {
  /* background-color: #555; */
  /* display: flex; */
  /* background: #555; */
  /* border-radius: 0em; */
  border: none;
  border-radius: 2em;
  margin-left: 2em;
  height: 3em;
  opacity: 0.6;
  transition: 0.3s;
  width: 100%
  

}
.btn:focus {
  outline: none;
  box-shadow: none;
  background-color: teal;
  transition: 0.3s;

   opacity: 1;
}
.btn:hover {
  /* background-color: black; */
  opacity: 1;
}
.btn-helper {
  border-top: 1.5px solid grey;
  width: 47%;
  height: 0px;
  position: absolute;
  top: 2.45em;
  left: 12.25em;
}
.output-holder {
    width: 100%;
  position: relative;
  top: 3em;
  display: flex;
  margin: auto;

}
@media only screen and (max-width: 1024px) {
.btn-helper {
  width: 70%;
}
.output-holder{
  display: flex;
  flex-direction: column;
}
.type-select {
  top: 3.2em !important;
  /* left: 0.5em; */
}
.map-div {
  width: 93%;
  overflow: hidden;
  height: 41em;
}
.info-panel-div {
  height: 82em !important;
}
.vue-map-container {
  width: 880px !important;
  height: 600px !important;
}


}

@media only screen and (max-width: 768px) {
 .btn-helper {
    width: 61%;
  }
  .type-select {
    /* left: 0em; */
  top: 2em;
  right: 1.5em;
}

  .vue-map-container {
  width: 650px !important;
}


}

@media only screen and (max-width: 414px) {


.vue-map-container {
    width: 334px;
  /* width: 50% */
}
.form-holder {
  width: 90% ;
 

}
.type-select {
  top: 2em !important;
  right: 1.5em !important;
}
/* #search-holder {

} */
}
@media only screen and (max-width: 375px) {
  .btn-helper {
    width: 42%;
  }

.vue-map-container {
  width: 350px !important;
}

}
</style>

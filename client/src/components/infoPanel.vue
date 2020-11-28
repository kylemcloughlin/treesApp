<template>
  <div class="info-panel-div" ref="infoPanel">
    <div class="title-holder">
      <h1
        v-if="this.searched === 'diameters'"
      >Diameter's of {{this.outputTrees[0].dbh_trunk}} inches</h1>
      <h1
        v-else-if="this.searched === 'locations'"
      >{{this.outputTrees[0].address}} {{this.outputTrees[0].name}}</h1>
      <h1 class='info-title' v-else>Spieces: {{this.outputTrees[0].common_name}}</h1>
      <h2>Results: {{this.outputTrees.length}} Trees Found</h2>
    
    </div>
    <div>
      <Tree
        v-for="(tree, index) in this.divTrees"
        v-bind:index="index"
        v-bind:key="tree.id"
        v-bind:tree="tree"
        v-bind:id="tree.id"
        v-on:infoWindow="infoWindow"
      />
      <input
        v-if="this.outputTrees.length > 25"
        v-show="this.outputTrees.length !== this.divTrees.length"
        type="submit"
        class="info-panel-btn"
        value="MORE"
        v-on:click.stop="infoPanelClick"
     />
    

    </div>
  </div>
</template>
<script>
import Tree from "./tree";
export default {
  name: "infoPanel",
  components: {
    Tree
  },
  props: {
    outputTrees: Array,
    searched: String
  },
  data() {
    return {
      divTrees: [],
      clicked: false
    };
  },
  beforeMount() {
    if (this.outputTrees.length < 25) {
      this.divTrees = this.outputTrees;
    } else {
      for (let x in this.outputTrees) {
        if (this.divTrees.length === 25) {
          break;
        } else {
          this.divTrees.push(this.outputTrees[x]);
        }
      }
    }
    this.outputTrees[this.outputTrees.length- 1].last = true;
  },
  beforeUpdate() {
    if (this.outputTrees[this.outputTrees.length- 1].last !== true) {
      this.outputTrees[this.outputTrees.length- 1].last = true;
    }
  },
  methods: {
    infoWindow(tree) {
      return this.$emit('panelClick', tree);
    },
    infoPanelClick(e) {
      e.preventDefault();
      this.clicked = true;

      let dt = this.divTrees;

      let op = this.outputTrees;

      let helper = [];
      for (let x in op) {
        if (
          dt.length + helper.length === op.length ||
          dt.length + helper.length === dt.length * 2
        ) {
          break;
        } else {
          helper.push(op[dt.length + Number(x)]);
        }
      }
      // const scroll = document.getElementById(`${x.id}`);
      console.table("helper", this.$refs);
      let newDivTrees = [...this.divTrees, ...helper];

      // let x = this.outputTrees[dt.length];

      // let id = x.id
      // id = id.toString();

      this.divTrees = newDivTrees;

      this.scrollHelper(dt.length);
    },
    scrollHelper(dt) {
      let x = this.outputTrees[dt - 4];

      let id = x.id;
      id = id.toString();

      let elmnt = document.getElementById(id);
      elmnt.scrollIntoView();
    }
  },
  watch: {
    outputTrees() {},
    searched() {}
  }
};
</script>
<style scoped>
.info-panel-div { 
  overflow: scroll;
  width: 75%;
  max-width: 40em;
  height: 34em;
  margin: auto;
  /* border: 1.5px solid #292f36; */
  border-top: #44cf6c 4px solid;
  border-top-right-radius: 1em;

  z-index: 9999;
  /* margin-top: 8em; */
  margin-bottom: 2em;
}
.title-holder {
  width: 100%;
  max-width: 40em;
  position: relative;
  background-color: #292f36;
  border-top-right-radius: 1em;
  color: white;
  z-index: 9999;
  height: 11.4em;
  max-height: 11.4em;
  text-align: center;
  top: -1.5em;
  font-family: 'PT sans', sans-serif;
  padding-top: 3em;

}
.info-panel-btn {
 margin-top: 1em;
 margin-bottom: 1em;
 padding: 0.9em;
 border-radius: 0.6em;
 font-weight: 800;
 font-size: x-large;
  width: 100%;
  position: relative;
  border: #157A6E solid 5px;
  /* border-top-left-radius: 1em; */
  background: transparent;
  color: #157A6E;
    transition: .5s;
    opacity: .7;;

}

 .info-panel-btn:hover{
    opacity: 1;
    color: white;
    background-color: #292f36;
    border: #292f36 solid 3px;
    /* box-shadow: 0px 0.5px 2px 0px; */
  transition: .5s;


  }
.info-panel-btn:focus {
  outline: none;
  
}
</style>
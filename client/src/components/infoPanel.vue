<template>
  <div class="info-panel-div" ref="infoPanel">
    <div class="title-holder">
      <h1
        v-if="this.searched === 'diameters'"
      >Diameter's of {{this.outputTrees[0].dbh_trunk}} inches</h1>
      <h1
        v-else-if="this.searched === 'locations'"
      >{{this.outputTrees[0].address}} {{this.outputTrees[0].name}}</h1>
      <h1 v-else>Spieces: {{this.outputTrees[0].common_name}}</h1>
      <h2>Results: {{this.outputTrees.length}} Trees Found</h2>
    
    </div>
    <div>
      <Tree
        v-for="(tree, index) in this.divTrees"
        v-bind:index="index"
        v-bind:key="tree.id"
        v-bind:tree="tree"
        v-bind:id="tree.id"
      />
      <input
        v-if="this.outputTrees.length > 50"
        v-show="this.outputTrees.length !== this.divTrees.length"
        type="submit"
        class="info-panel-btn"
        value="more"
        v-on:click.stop="infoPanelClick"
     />
    
      <!-- <div  v-if="this.clicked === true">
  <Tree v-for="(tree, index) in this.divTrees"
        v-bind:index="index"
        v-bind:key="tree.id"
        v-bind:tree="tree"
        v-bind:id="tree.id"/>
      </div>-->
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
    this.outputTrees[0].first = true;
  },
  beforeUpdate() {
    if (this.outputTrees[0].first !== true) {
      this.outputTrees[0].first = true;
    }
  },
  methods: {
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
  /* width: 100%; */
    /* text-align: center; */
  overflow: scroll;
  width: 93%;
  /* position:fixed; */
  height: 34em;
  margin: 1em;
  border: 1.5px solid grey;
  border-top: green 3px solid;
  z-index: 9999;
  /* margin-top: 8em; */
}
.title-holder {
  width: 93%;
  position: absolute;
  background-color: #999;
  z-index: 9999;
  height: 11.4em;
  max-height: 11.4em;
    text-align: center;

}
.info-panel-btn {
  padding: 0em;
  margin-top: 1em;
  width: 28.5em;
}
</style>
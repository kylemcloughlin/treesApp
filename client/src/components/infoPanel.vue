<template>
  <div class='info-panel-div' ref='infoPanel'>
 <div class='title-holder'> 
  <h1>{{this.searched}} {{this.outputTrees[0].common_name}} Results: {{this.outputTrees.length}} Trees Found</h1>
 </div>
 <div>
  <Tree v-for="(tree, index) in this.divTrees"
        v-bind:index="index"
        v-bind:key="tree.id"
        v-bind:tree="tree"
        v-bind:id="tree.id"/>
 <input v-if="this.outputTrees.length > 50" v-show="this.outputTrees.length !== this.divTrees.length" type="submit" class='info-panel-btn' value="more"  v-on:click.stop="infoPanelClick"/>
 <!-- <div  v-if="this.clicked === true">
  <Tree v-for="(tree, index) in this.divTrees"
        v-bind:index="index"
        v-bind:key="tree.id"
        v-bind:tree="tree"
        v-bind:id="tree.id"/>
  </div> -->
 </div>
  </div>
</template>
<script>
import Tree from './tree'
export default {
  name: 'infoPanel',
  components: {
    Tree,
  },
  props: {
    outputTrees: Array,
    searched: String,
  },
  data() {
    return {
      divTrees: [],
      clicked: false
      
    }
  },
  beforeMount() {
        if (this.outputTrees.length < 25 ) {
     this.divTrees = this.outputTrees;
    console.log('in the if ,', this.divTrees)
    } else {
      console.log('hit false')
     for (let x in this.outputTrees) {
        if(this.divTrees.length ===  25) {
          break
        } else {
          // console.log(this.outputTrees[x])
          this.divTrees.push(this.outputTrees[x])
        }
        // console.table(this.outputTrees[0]);

    } 
    }
   this.outputTrees[0].first = true
   console.log(this.outputTrees[0].first);
        
  },
  beforeUpdate() {
      if (   this.outputTrees[0].first !== true) {
      this.outputTrees[0].first = true
      }
   console.log(this.outputTrees[0].first);
  },
  methods: {
      infoPanelClick(e) {
        e.preventDefault();
    this.clicked = true
    
    let dt = this.divTrees
  
      let op = this.outputTrees
    
     
 

      let helper = []
      for (let x in op) {
    
          if (dt.length + helper.length === op.length || dt.length + helper.length === dt.length * 2) {
              break;
            } else {
      
              helper.push(op[dt.length + Number(x)])
            }
      }
      // const scroll = document.getElementById(`${x.id}`);
        console.table('helper', this.$refs);
  let newDivTrees = [...this.divTrees, ...helper];
       
  // let x = this.outputTrees[dt.length];
  // console.log('x', dt.length)  
  // let id = x.id
  // id = id.toString();
  // console.log('id????', id)
       this.divTrees = newDivTrees;
      console.log(dt.length)
      this.scrollHelper(dt.length)

      },
      scrollHelper(dt) {
        let x = this.outputTrees[dt - 4];
        console.log('hit', dt)
  // console.log('x', dt.length)  
  let id = x.id
  id = id.toString();
  console.log('id????', id)

  // console.log('x', dt.length)  
  let elmnt = document.getElementById(id);
  elmnt.scrollIntoView();  

      }
  },
  watch:{
    outputTrees() {
         
    },
    searched(){
      
    }
  }
}
</script>
<style scoped>
.info-panel-div {
  /* width: 100%; */
  overflow: scroll;
  width: 53%;
  /* position:fixed; */
  height: 34em;
  margin: 1em;
  border: 1.5px solid grey;
  border-top: green 3px solid;
  z-index: 9999;
  /* margin-top: 8em; */


}
.title-holder{

  width: 53%;
  z-index: 9999;
position: absolute;
    width: 53%;
    background-color: #999;
    z-index: 9999;

}
</style>
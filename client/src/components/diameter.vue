<template>
<div>
  <form>
     <input  v-bind:class="this.msg === 'diameters' ? 'selected' : '' " type="submit" value="Diameter" class='btn' v-on:click.stop="click" v-bind:id="[msg === 'diameters' ? this.activeId : '']"/>
  </form>
</div>
</template>


<script>
export default {
   name: "Diameter",
  props: {
    msg: String
  }, 
    data() {
    return ({
      activeId: 'active-id'

    })
  },
  methods: {
    click(e) {
     e.preventDefault();
     
   this.$emit('setSearch', 'diameters');

 }
},
 watch:{
            msg(){
              

            }
  },

}
</script>
<style scoped>
.selected {
  transition: .25s;
  background-color: teal;
}
#active-id {
  border-bottom: none; 
  /* background-color: black; */
}
</style>
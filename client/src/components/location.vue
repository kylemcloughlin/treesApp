<template>
   <div>
  <form>
    <input  v-bind:class="this.msg === 'locations' ? 'selected' : '' " type="submit" value="Location" class='btn' v-on:click.stop="click" v-bind:id="[msg === 'locations' ? this.activeId : '']"/>
  </form>
</div>
</template>


<script>
export default {
   name: "Location",
  props: {
    msg: String
    
  }, 
  watch: {
    msg() {
      
    }
  },
    data() {
    return ({
      activeId: 'active-id'

    })
  },
  methods: {
    click(e) {
     e.preventDefault();
    
   this.$emit('setSearch', 'locations');

 }
}

}
</script>
<style scoped>
.selected {
  transition: .25s;
  background-color: teal;
}
#active-id {
  border-bottom: none;
 
}
</style>
<template>
<div>
  <form>
     <input type="submit" value="Species" class='btn' v-on:click.stop="click" v-bind:id="[msg === 'types' ? this.activeId : '']"/>
  </form>
</div>
</template>


<script>
export default {
   name: "Species",
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
     
   this.$emit('setSearch', 'types');

 },
},
   watch: {
     msg() {
       
     }
   },
created() {
  
}

}
</script>
<style scoped>
#active-id {
  border-bottom: none;
 
}
</style>
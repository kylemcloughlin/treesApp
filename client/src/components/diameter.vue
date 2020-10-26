<template>
<div>
  <form>
     <input type="submit" value="Diameter" class='btn' v-on:click.stop="click"/>
  </form>
</div>
</template>


<script>
export default {
   name: "Diameter",
  props: {
    msg: String
  }, 
  methods: {
    click(e) {
     e.preventDefault();
     console.log("!!")
   this.$emit('setSearch', 'Diameter');

 }
}

}
</script>
<style scoped>

</style>
<template>
   <div>
  <form>
    <input type="submit" value="Location" class='btn' v-on:click.stop="click"/>
  </form>
</div>
</template>


<script>
export default {
   name: "Location",
  props: {
    msg: String
  }, 
  methods: {
    click(e) {
     e.preventDefault();
     console.log("!!")
   this.$emit('setSearch', 'locations');

 }
}

}
</script>
<style scoped>

</style>
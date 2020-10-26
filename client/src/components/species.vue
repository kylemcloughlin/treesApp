<template>
<div>
  <form>
     <input type="submit" value="Species" class='btn' v-on:click.stop="click"/>
  </form>
</div>
</template>


<script>
export default {
   name: "Species",
  props: {
    msg: String
  },methods: {
    click(e) {
     e.preventDefault();
     console.log("!!")
   this.$emit('setSearch', 'Species');

 }
}

}
</script>
<style scoped>

</style>
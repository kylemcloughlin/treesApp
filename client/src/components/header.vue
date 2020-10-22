<template>
    <div class='header'>
    <h1>Header</h1>
    </div>
</template>


<script>
export default {
   name: "Species",
  props: {
    msg: String
  },

}
</script>
<style scoped>
  .header{
    background: #333;
    color: #fff;
    text-align: center;
    padding: 10px;
  }
  .header a {
    color: #fff;
    padding-right: 5px; 
  }
</style>

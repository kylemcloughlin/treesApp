<template>
    <div class='header'>
    <h1>Toronto's Urban Canopy Database</h1>
       <input type="submit" class='back-btn' value="back"  v-on:click.stop="backClick"/>
    </div>
</template>


<script>
export default {
   name: "Header",
  props: {
    
    show: Boolean
  },
  watch: {
    show() {
      console.log(this.show)
    },
  },
    methods: {
      backClick(e) {
        console.log('clickyy', this.show)
         this.$emit('backBtn', !this.show)
           e.preventDefault();
        

      }
    }
  


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
  .back-btn {
    position: relative;
    right: 1em;
    left: 48%;
    top: -6.5em;
  }
</style>

<template>
    <div class='header'>
    <img class='img' src="../assets/treeMarker.png"/>
    <h2>Toronto's Street Trees</h2>
       <input v-if="this.clicked === false" type="submit" class='back-btn' value="back"  v-on:click.stop="backClick"/>
    </div>
</template>


<script>
export default {
   name: "Header",
  props: {
    
    show: Boolean
  },
  data() {
    return{
      clicked: true
    }
  },
  watch: {
    show() {
      
     this.clicked = true;
     if (this.show ===  true ) {
       this.clicked = false;

     }
    },
  },
    methods: {
      backClick(e) {
      e.preventDefault();
       this.clicked = true;
       
         this.$emit('backBtn', true)
        

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
    height: 5em;
  }
  .header a {
    color: #fff;
    padding-right: 5px; 
  }

.header h2 {
  position: absolute;
  top: 29px;
}
  .back-btn {
    position: relative;
    width: 4em;
    height: 3em;
    left: 44%;
    top: .5em;
  }
  .img {
    position: absolute;
    right: 7.5em;
    top: 3em;
    /* width: 3em; */
  }
</style>

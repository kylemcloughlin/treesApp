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
     console.log("!!")
   this.$emit('setSearch', 'types');

 },
},
   watch: {
     msg() {
       console.log('', this.msg)
     }
   },
created() {
  console.log("yoyoyo upupupup", this.msg);
}

}
</script>
<style scoped>
#active-id {
  border-bottom: none;
 
}
</style>
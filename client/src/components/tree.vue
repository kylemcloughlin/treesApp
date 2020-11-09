<template>
  <div>
    <h3>{{tree.common_name}}</h3>
    <h4>{{tree.botanical_name}}</h4>
  <h5>{{tree.address}}</h5>
  <h5>{{tree.name}}</h5>
  <h6>{{tree.dbh_trunk}}</h6>
  </div>
</template>
<script>
export default {
  name: 'tree',
props: {
  tree: Object
}
}
</script>
<style scoped>

</style>
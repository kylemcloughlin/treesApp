<template>
  <div>
    <!-- <h2>{{msg}}</h2> -->
    <form @submit="searchTree">
      <div id="search-holder">
        <select class="type-select" v-if="this.search ===  'types'" v-model="output">
          <option
            v-bind:key="tree.id"
            v-for="tree in trees"
            v-bind:value="tree.id"
          >{{tree.common_name}} {{tree.botanical_name}}</option>
        </select>
        <div v-else-if="this.search === 'locations' ">
          <input
          class='location-input'
            v-show="selected === false"
            type="text"
            placeholder=" Search location here..."
            v-model="output"
            @keyup="autocomplete"
          />
          <div v-if="this.output.length > 0" v-show="selected === false">
            <div
              v-for="tree in suggestions"
              v-bind:key="tree.id"
              v-bind:value="tree.id"
              @click="help(tree)"
            >
              <h2>{{tree.address}} {{tree.name}}</h2>
            </div>
          </div>
          <div v-if="selected === true">
            <h3>{{location.address}} {{location.name}}</h3>
            <a @click="selected = false, output = ''">X</a>
          </div>
        </div>

        <div v-else>
          <h1 class='diameter-input'>{{this.numOutput}} inches</h1>
          <button class='plus' v-show="this.numOutput < 124" v-on:click.prevent="plus">+</button>
          <button class='minus' v-show="this.numOutput > 0" v-on:click.prevent="minus">-</button>

        </div>
        <!-- <input type="range" v-else name="tree-selector"  min='0' max='125' v-model="numOutput"/> -->
        <!-- <h6>{{this.trees[this.numOutput].dbh_trunk}}</h6> -->
      </div>
      <input type="submit" value="submit" id="submit" class="btn" @submit.prevent="searchTree" />
    </form>
  </div>
</template>

<script>
// import axios from 'axios';

export default {
  name: "SearchBar",
  data() {
    return {
      trees: [],
      dataSelect: "Location",
      output: "",
      numOutput: 3,
      suggestions: [],
      selected: false,
      location: {}
    };
  },
  props: {
    search: String,
    select: String
  },
  methods: {
    searchTree(e) {
      // console.log(this.search)
      e.preventDefault();

      let conditonialOutput =
        this.search === "diameters" ? this.numOutput : this.output;

      this.$http.plain
        .get(`/${this.search}/${conditonialOutput}`)
        .then(response => this.$emit("setTrees", response.data))
        .catch(err => console.log(":(", err));
    },
    getTrees() {
      this.$http.plain
        .get(`/${this.search}`)

        .then(response => (this.trees = response.data))
        // .then(() => )
        .catch(err => console.log(":(", err));
    },
    plus() {
      this.numOutput = this.numOutput + 1;
    },
    minus() {
      this.numOutput = this.numOutput - 1;
    },
    autocomplete() {
      let list = this.trees;
      let location = this.output;

      this.suggestions = list.filter(tree => {
        return tree.name.startsWith(location.toUpperCase());
      });
      if (this.output.length === 0) {
        this.suggestions = [];
      }
    },
    help(value) {
      this.location = value;
      this.selected = true;
      this.output = value.id;
    }
  },

  watch: {
    search() {
      this.getTrees();
    }
  },

  created() {
    this.getTrees();

    this.dataSelect = this.search;
  }
};
</script>

// <!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped>

/* @media only screen and (max-width: 414px) {} */
#search-holder {
  display: flex;
  width: 96%;
  position: absolute;
  top: 3em;
  left: 2em;
  
}
.diameter-input {
  position: absolute;
  left: 1.5em;
    top: .05em;
}
.plus {
position: absolute;
  top: 2.8em;
  right: 11.5em;

}
.minus {
position: absolute;
  right: 9.9em;
  top: 2.8em;

}
.type-select {
  width: 96%;
  position: relative;
  right: 2em;
}
#submit {
    left: 6em;
    position: relative;
    top: 12em;
    height: 2.3em;
    width: 6em;
    border-radius: .5em;
}
.location-input {
position: absolute;
top: 2em;
width: 84%;
}
</style>
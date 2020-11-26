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
            class="location-input"
            v-show="selected === false"
            type="text"
            placeholder=" Search location here..."
            v-model="output"
            @keyup="autocomplete"
          />

          <div class="selected-location" v-if="selected === true">
            <a class="x" @click="selected = false, output = ''">X</a>
            <h3>{{location.address}} {{location.name}}</h3>
          </div>
        </div>

        <div v-else>
          <h1 class="diameter-input">{{this.numOutput}} inches</h1>
          <button class="plus" v-show="this.numOutput < 124" v-on:click.prevent="plus">+</button>
          <button class="minus" v-show="this.numOutput > 0" v-on:click.prevent="minus">-</button>
        </div>
        <!-- <input type="range" v-else name="tree-selector"  min='0' max='125' v-model="numOutput"/> -->
        <!-- <h6>{{this.trees[this.numOutput].dbh_trunk}}</h6> -->
        <input type="submit" value="submit" id="submit" class="btn" @submit.prevent="searchTree" />
      </div>
    </form>
    <div class="suggestion-container" v-if="this.output.length > 0" v-show="selected === false">
      <div
        v-for="tree in suggestions.slice(0,9)"
        v-bind:class="tree.id === id ? 'in-focus' : '' "
        v-bind:key="tree.id"
        v-bind:value="tree.id"
        @click="help(tree)"
        class="suggestion-div"
      >
        <h2>{{tree.address}} {{tree.name}}</h2>
      </div>
    </div>
  </div>
</template>

<script>
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
      location: {},
      focusCounter: -1,
      id: null
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
      if (conditonialOutput === "") {
        alert("hit");
      } else {
        this.$http.plain
          .get(`/${this.search}/${conditonialOutput}`)
          .then(response => this.$emit("setTrees", response.data))
          .catch(err => console.log(":(", err));
      }
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
    autocomplete(e) {
      if (e.which === 40 && this.suggestions.length > 0 && this.focusCounter < 9) {
        this.focusCounter = this.focusCounter + 1;
        this.id = this.suggestions[this.focusCounter].id;     
    
      } else if (e.which === 38 && this.suggestions.length > 0 && this.focusCounter > 0) {
        console.log("-first focus counter:", this.focusCounter);
        this.focusCounter = this.focusCounter - 1;
        this.id = this.suggestions[this.focusCounter].id;
    
      } else if (e.which ===  13 && this.suggestions.length > 0) {
        this.help(this.suggestions[this.focusCounter]);
      } 
      else {
       
       if (this.output.length === 0) {
          this.suggestions = [];
        }
        let list = this.trees;
        let location = this.output;

        this.suggestions = list.filter(tree => {
          return tree.name.startsWith(location.toUpperCase());
        });

        
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
      if (this.search === "locations") {
        this.output = "";
      }
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
  /* overflow: hidden; */
}
.diameter-input {
  position: absolute;
  left: 1.5em;
  top: 0.05em;
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
  top: 3.5em;
}
#submit {
  position: absolute;
  right: 2em;
  top: 8.4em;
  height: 2.3em;
  width: 6em;
  border-radius: 0.5em;
  background-color: darkolivegreen;
}
.location-input {
  position: absolute;
  top: 1.5em;
  width: 84%;
  max-width: 19em;
  background: #222;
  border: 0;
  font-size: 25px;
  color: #fff;
}
.selected-location {
  width: 80%;
  max-width: 26em;
  text-align: center;
  margin: none;
  background-color: #888;
  position: absolute;
  left: 4em;
  top: 2em;
  border-radius: 1em;
}

.x {
  float: right;
  margin-right: 0.5em;
  margin-top: 0.25em;
}
.suggestion-div {
  background: #222;
  padding: 15px;
  padding-top: 5px;
  padding-bottom: 5px;
  font-size: 15px;
  color: #fff;
  border-top: 1px solid #666;
  cursor: pointer;
  opacity: 0.75;
  transition: 0.25s;
  /* width:  */
  /* width: 84%; */
}
.suggestion-div:hover {
  opacity: 1;
}
.in-focus {
  opacity: 1;;
}
.suggestion-container {
  position: absolute;
  left: 2em;
  top: 8em;
  width: 80%;
  max-width: 29.99em;
}
</style>
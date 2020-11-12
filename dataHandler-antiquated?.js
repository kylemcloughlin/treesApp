const fs = require('fs');
let testData = [{
  "type": "Feature",
  "properties": {
    "GEO_ID": 567858,
    "X": 305305.047,
    "Y": 4843335.492,
    "STRUCTID": "NY151704",
    "ADDRESS": 123,
    "SUFFIX": null,
    "NAME": "TAVISTOCK RD",
    "DBH_TRUNK": 25,
    "TREE_POSIT": 50,
    "COMMON_NAM": "WALNUT",
    "BOTANICAL_": "Juglans sp."
  },
  "geometry": {
    "type": "Point",
    "coordinates": [-79.4937308518207, 43.731917558949036]
  }
}, {
  "type": "Feature",
  "properties": {
    "GEO_ID": 481983,
    "X": 317531.274,
    "Y": 4848835.763,
    "STRUCTID": "NY151776",
    "ADDRESS": 25,
    "SUFFIX": null,
    "NAME": "ALLENBURY GDNS",
    "DBH_TRUNK": 120,
    "TREE_POSIT": 30,
    "COMMON_NAM": "WILLOW",
    "BOTANICAL_": "Salix sp."
  },
  "geometry": {
    "type": "Point",
    "coordinates": [-79.34183665251797, 43.78131780976805]
  }
}, {
  "type": "Feature",
  "properties": {
    "GEO_ID": 553927,
    "X": 304404.747,
    "Y": 4842021.589,
    "STRUCTID": "NY153525",
    "ADDRESS": 8,
    "SUFFIX": null,
    "NAME": "RAINSWOOD CRT",
    "DBH_TRUNK": 15,
    "TREE_POSIT": 30,
    "COMMON_NAM": "NORTHERN CATALPA",
    "BOTANICAL_": "Catalpa speciosa"
  },
  "geometry": {
    "type": "Point",
    "coordinates": [-79.50490531016467, 43.72009074292787]
  }
}, {
  "type": "Feature",
  "properties": {
    "GEO_ID": 541735,
    "X": 312559.481,
    "Y": 4848116.348,
    "STRUCTID": "NY16745",
    "ADDRESS": 173,
    "SUFFIX": null,
    "NAME": "MCKEE AVE",
    "DBH_TRUNK": 25,
    "TREE_POSIT": 10,
    "COMMON_NAM": "OAK",
    "BOTANICAL_": "Quercus sp."
  },
  "geometry": {
    "type": "Point",
    "coordinates": [-79.4036125917919, 43.77491096914759]
  }
}, {
  "type": "Feature",
  "properties": {
    "GEO_ID": 548168,
    "X": 316825.07,
    "Y": 4843324.425,
    "STRUCTID": "NY22862",
    "ADDRESS": 91,
    "SUFFIX": null,
    "NAME": "OVERLAND DR",
    "DBH_TRUNK": 50,
    "TREE_POSIT": 10,
    "COMMON_NAM": "WHITE BIRCH",
    "BOTANICAL_": "Betula papyrifera"
  },
  "geometry": {
    "type": "Point",
    "coordinates": [-79.35073330841682, 43.731720645534665]
  }
}, {
  "type": "Feature",
  "properties": {
    "GEO_ID": 489967,
    "X": 312012.572,
    "Y": 4848977.165,
    "STRUCTID": "NY17567",
    "ADDRESS": 75,
    "SUFFIX": null,
    "NAME": "BISHOP AVE",
    "DBH_TRUNK": 13,
    "TREE_POSIT": 20,
    "COMMON_NAM": "WHITE BIRCH",
    "BOTANICAL_": "Betula papyrifera"
  },
  "geometry": {
    "type": "Point",
    "coordinates": [-79.4103946558101, 43.78266491781208]
  }
}, {
  "type": "Feature",
  "properties": {
    "GEO_ID": 10335639,
    "X": 309176.075,
    "Y": 4849293.206,
    "STRUCTID": "NY151837",
    "ADDRESS": 59,
    "SUFFIX": null,
    "NAME": "LISSOM CRES",
    "DBH_TRUNK": 40,
    "TREE_POSIT": 80,
    "COMMON_NAM": "WILLOW",
    "BOTANICAL_": "Salix sp."
  },
  "geometry": {
    "type": "Point",
    "coordinates": [-79.44563126022376, 43.785531874120586]
  }
}, {
  "type": "Feature",
  "properties": {
    "GEO_ID": 521055,
    "X": 312383.308,
    "Y": 4846482.236,
    "STRUCTID": "NY28080",
    "ADDRESS": 86,
    "SUFFIX": null,
    "NAME": "GLENDORA AVE",
    "DBH_TRUNK": 10,
    "TREE_POSIT": 40,
    "COMMON_NAM": "EASTERN WHITE CEDAR",
    "BOTANICAL_": "Thuja occidentalis"
  },
  "geometry": {
    "type": "Point",
    "coordinates": [-79.40582406968603, 43.76020373069734]
  }
}, {
  "type": "Feature",
  "properties": {
    "GEO_ID": 566187,
    "X": 314593.458,
    "Y": 4845431.381,
    "STRUCTID": "NY24496",
    "ADDRESS": 4,
    "SUFFIX": null,
    "NAME": "SULGRAVE CRES",
    "DBH_TRUNK": 100,
    "TREE_POSIT": 10,
    "COMMON_NAM": "WHITE BIRCH",
    "BOTANICAL_": "Betula papyrifera"
  },
  "geometry": {
    "type": "Point",
    "coordinates": [-79.37839576795842, 43.75071879011039]
  }
}, {
  "type": "Feature",
  "properties": {
    "GEO_ID": 7941347,
    "X": 314516.115,
    "Y": 4847608.122,
    "STRUCTID": "NY29564",
    "ADDRESS": 29,
    "SUFFIX": null,
    "NAME": "WHITTAKER CRES",
    "DBH_TRUNK": 15,
    "TREE_POSIT": 20,
    "COMMON_NAM": "EASTERN WHITE CEDAR",
    "BOTANICAL_": "Thuja occidentalis"
  },
  "geometry": {
    "type": "Point",
    "coordinates": [-79.37931674931808, 43.77031322187752]
  }
}, {
  "type": "Feature",
  "properties": {
    "GEO_ID": 522209,
    "X": 313272.475,
    "Y": 4845072.122,
    "STRUCTID": "NY20340",
    "ADDRESS": 91,
    "SUFFIX": null,
    "NAME": "GORDON RD",
    "DBH_TRUNK": 45,
    "TREE_POSIT": 10,
    "COMMON_NAM": "WHITE BIRCH",
    "BOTANICAL_": "Betula papyrifera"
  },
  "geometry": {
    "type": "Point",
    "coordinates": [-79.39480389481443, 43.747501272380624]
  }
}]


let jsonToRuby = (treeData) => {
  let newTreeData = [];
  treeData.forEach(tree => {
    let newTreeObject = {}
    newTreeObject.GEO_ID = tree.properties.GEO_ID;
    newTreeObject.X = tree.properties.X;
    newTreeObject.Y = tree.properties.Y;
    newTreeObject.STRUCTID = tree.properties.STRUCTID;
    newTreeObject.ADDRESS = tree.properties.ADDRESS;
    newTreeObject.SUFFIX = tree.properties.SUFFIX;
    newTreeObject.NAME = tree.properties.NAME;
    newTreeObject.DBH_TRUNK = tree.properties.DBH_TRUNK;
    newTreeObject.TREE_POSIT = tree.properties.TREE_POSIT;
    newTreeObject.COMMON_NAM = tree.properties.COMMON_NAM;
    newTreeObject.BOTANICAL_ = tree.properties.BOTANICAL_;
    newTreeObject.geometry_type = tree.geometry.type;
    newTreeObject.coordinates = tree.geometry.coordinates;


    console.log('new obj', newTreeObject);
    newTreeData.push(newTreeObject);

  });
  console.log('new array');
  let data = JSON.stringify(newTreeData);
  fs.writeFileSync('seed.json', data)
  return newTreeData;
};

console.log(jsonToRuby([testData[0], testData[1]]));
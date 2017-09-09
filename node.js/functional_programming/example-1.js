var data = [
  {
    name: "Jamestown",
    population: 2047,
    temperatures: [-34, 67, 101, 87]
  },
  {
    name: "Awesome Town",
    population: 3568,
    temperatures: [-3, 4, 9, 12]
  },
  {
    name: "Funky Town",
    population: 1000000,
    temperatures: [75, 75, 75, 75, 75]
  }
]


// Coordinates
var coords = [],
    totalTemperature = 0,
    averageTemperature = 0;

for (var i=0; i < data.length; i++) {
  totalTemperature = 0;

  // add every number in a list
  for (var j=0; j < data[i].temperatures.length; j++) {
    totalTemperature += data[i].temperatures[j];
  }
  // calculate an average
  averageTemperature = totalTemperature / data[i].temperatures.length;

  // retrieve a single property from a list of objects
  coords.push([averageTemperature, data[i].population]);
}

console.log('Coords average temperature')
console.log(JSON.stringify(coords))

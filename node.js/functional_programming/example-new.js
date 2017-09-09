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

function sum(array) {
  return array.reduce((a, b) => a + b )
}

function average(array) {
  return sum(array)/array.length
}


// Coordinates
var coords = data.map(
  item => [average(item.temperatures), item.population]
)

console.log('Coords average temperature')
console.log(JSON.stringify(coords))

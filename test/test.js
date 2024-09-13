const array = [2,4,1,5,6,3]

const greatestValue = array.reduce((response, current, i, array) =>
  Math.max(response, current + (array[i + 1] || 0)),
  -Infinity
)

console.log(greatestValue)

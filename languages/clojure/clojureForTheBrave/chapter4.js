var node3 = {
	value: "last",
	next: null,
}

var node2 = {
	value: "middle",
	next: node3,
}

var node1 = {
	value: "first",
	next: node2
}

var first = node => node.value

var rest = node => node.next

var cons = (newValue, node) => ({
	value: newValue,
	next: node
})

console.log(first(node1))

console.log(rest(node1))

console.log(rest(rest(node1)))

var node0 = cons("new first", node1)

first(rest(node0))

var map = (list, mapFunction) => list === null
	? null
	: cons(mapFunction(first(list)), map(rest(list), mapFunction))

console.log(
	first(
		map(node1, value => `${value} maped!`)
	)
)

// Array Implementation

var first = array => array[0]
var rest = (array, sliced = array.slice(1, array.length)) =>
	sliced.length === 0
		? null
		: sliced
var cons = (newValue, array) => [newValue].concat(array)

var list = ["Transylvania", "Forks WA"];
console.log(
	map(list, value => `${value} mapped!!`)
)

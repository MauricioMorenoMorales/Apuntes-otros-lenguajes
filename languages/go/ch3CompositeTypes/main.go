// Los arrays no son muy usados en go

// Crea un array con 3 ceros
var x [3]int

var x = [3]int{10, 20, 30}

// [1, 0, 0, 0, 0, 4, 6, 0, 0, 0, 100, 15].
var x = [12]int{1, 5:4, 6, 10:100, 15}

// Tamaño dinamico
var x = [...]int{10, 20, 30}

var x = [...]int{1, 2, 3}
var y = [3]int{1, 2, 3}
fmt.Println(x == y)// Prints true

// Multidimentional arrays
var x [2][3]int

//Access value
x[2]

//! Slices
/* Un slice es como un array pero con tamaño dinamico
simplemente no se le especifica el tamaño en su tipado*/

var x = []int{10, 20, 30} // no es lo mismo [...] que []

// Los slices no pueden usar == ni !=, simplemente se les puede comparar con nil
// Para eso puedes usar una libreria reflect/DeepEqual

//! Funciones

// Len: Retorna el tamaño del array
len(x)

// Append: Aggrega un valor al final

x = append(x, 10, 1)

x = append(x, y...)// Mergea dos arrays

// make: puedes crear arrays de este modo

x := make([]int, 5)
x = append(x, 10)// Esto agregara el 10 al final [0,0,0,0,0, 10]

x := make([]int, 5, 10)// length 5 and capacity 10

// Ways to declare an slice
var data []int
var x = []int{}

data := []int{2, 4, 5, 6}// Slice with default values

// si sabes que tan largo va a ser tu array pero no que valores van a tener
// entonces usa la funcion make


//! Slicing Slices
Para hacer un slice puedes usar esta notacion

x := []string{"a", "b", "c", "d"}

x[:2]
x[1:2]
x[1]
x[:]// Everything

// Cuando obtienes data de un slice no estás generando una copia
// si no accediendo a una determinada porcion de la memoria dentro de ese slice
// por lo que si haces una mutacion de el slice este afectara al slice al que apunta

// La capacidad va a depender de como se haga el slice

x := make([]string, 0, 5) // -> Capacidad 5
x = append(x, "a", "b", "c", "d")
y := x[:2] // -> Capacidad 5
z := x[2:] // -> Capacidad 3
fmt.Println(cap(x), cap(y), cap(z))
y = append(y, "i", "j", "k")
x = append(x, "x")
z = append(z, "y")
fmt.Println("x:", x) // -> [a b i j y] //? Append sobreescribe
fmt.Println("y:", y) // -> [a b i j y]
fmt.Println("z:", z) // -> [i j y]

//? Para evitar confuciones nunca uses append en a subslice

//! Obtener copias de slices

x: []int{1, 2, 3, 4}
y := make([]int, 4)
num := copy(y, x)
fmt.Println(y, num)// [1 2 3 4] 4

// puedes copiar desde cierto punto del slice

copy(y, x[2:])

//! convertir un array en un slice

xArray := [4]int{5, 6, 7, 8}
xSlice := xArray[:]

// igualmente puedes tener problemas de memoria usando esta tecnica

x := [4]int{5, 6, 7, 8}
y := x[:2]
z := x[2:]
x[0] = 10
fmt.Println("x: ", x)// [10 6 7 8]
fmt.Println("y: ", y)// [10 6]
fmt.Println("z: ", z)// [7 8]

//! Converting Slices to arrays
/* Haciendo esto no generara problemas de memoria por que estaras creando una
Nueva ubicacion de memoria */

xSlice := []int{1, 2, 3, 4}
xArray := [4]int(xSlice)
smallArray := [2]int(xSlice)
xSlice[0] = 10
fmt.Println(xSlice)// [10 2 3 4]
fmt.Println(xArray)// [1 2 3 4 .]
fmt.Println(smallArray)// [1 2]

//? En este caso no puedes usar el [...] para convertir un slice a un array

/*! Conversion de tipos */
//! string
/* Un string en go es una secuencia de bytes, no una secuencia de runas */

var s string = "Hello there"
var b byte = s[6]
var s2 string = s[4:7]// Podemos usar la notacion de sliceso

// A simple rune or byte can be converted to string

var a rune = 'x'
var s string = string(a)
var b byte = 'y'
var s2 string = string(b)
//? Pero go no puede convertir integers a strings
var x int = 65
var y = string(x)// esto dará error

// Convertir un string en slices de bytes o slices de runes
var s string = "Hello, World"
var bs []byte = []byte(s)
var rs []rune = []rune(s)

//! Maps
// -> map[keyType]valueType => var nilMap map[string]int

totalWins := map[string]int{}

teams := map[string][]string [
	"Orcas": []string{"Fred", "Ralph", "Bijou"},
	"Lions": []string{"Sarah", "Peter", "Billie"},
	"Kittens": []string{"Waldo", "Raul", "Ze"},
]

// si conoces el tamaño pero no los valores de tu mapa puedes crearlo asi

ages := make(map[int][]string, 10)
// Si un map no tiene valores retorna nil
//? Los maps no son comparables

//Using a map

totalWins := map[string]int{}
totalWins["Orcas"] = 1
totalWins["Lions"] = 2
totalWins["Kittens"]++
totalWins["Lions"] = 3

// Find if a key is in the map
m := map[string]int{
	"Hello": 5,
	"World": 0,
}
v, ok := m["Hello"]
v, ok := m["World"]
v, ok := m["Goodbye"]

// Eliminar una key de un objeto
m := map[string]int{
	"Hello": 5,
	"World": 10,
}
delete(m, "Hello")

// Using Maps as Sets

intSte := map[int]bool{}
vasl := []int{5, 10, 2, 5, 8, 7, 3, 9, 1, 2, 10}

for _, v := range vals {
	intSet[v] = true
}

fmt.Println(len(vals), len(intSet))
fmt.Println(intSet{5})
fmt.Println(intSet[500])
if intSet[100] {
	fmt.Println("100 is in the set")
}

// More efficient equivalent but less readable

intSet := map[int]struct{}{}
vals := []int{5, 10, 2, 5, 8, 7, 3, 9, 1, 2, 10}
for _, v := range vals {
	intSet[v] = struct{}{}
}

if _, ok := intSet[5]; ok {
	fmt.Println("5 is in the set")
}

//! Structs

type person struct {
	name string
	age int
	pet string
}


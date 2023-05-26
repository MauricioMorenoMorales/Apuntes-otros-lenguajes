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

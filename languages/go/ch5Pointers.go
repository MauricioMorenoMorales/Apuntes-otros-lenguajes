x := 10

pointerToX := &x

fmt.Println(pointerToX) // prints a memory address
fmt.Println(*pointerToX) // prints 10
z := 5 + *pointerToX
fmt.Println(z)// Prints 15

// debes verificar si un puntero no es nil por que si no crashea el programa
var x *int
fmt.Println(x == nil) // prints true
fmt.Println(*x)       // panics



x := 10
var pointerToX *int
pointerToX = &x

type person struct {
	FirtName string
	MiddleName *string
	LastName string
}

// Puedes tener este tipo de errores con los structs
p := person{
	FirstName: "Pat",
	MiddleName: "Perry", // This line wont compile
	LastName: "Peterson",
}

// PAra resolverlos puedes usar esta funcion auxiliar

func stringp(s string) *string { return &s }

p := person{
	FirstName: "Pat",
	MiddleName: stringp("Perry"),
	LastName: "Peterson",
}

// Si una funcion recibe un nil pointer no puede cambiar su valor

func failedUpdate(g *int) {
	x :10
	g = &x
}

func main() {
	var f *int // f is nil
	failedUpdate(f)
	fmt.Println(f)// prints nil
}

// Tambien tienes
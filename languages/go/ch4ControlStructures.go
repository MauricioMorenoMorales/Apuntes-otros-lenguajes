func div(numerator int, denominator int) int {
	if denominator == 0 { return 0 }
	return numerator / denominator
}

// simulating named and optional parameters
// Go no tiene parametros opcionales pero podemos simular esa funcion de este modo

type MyFunctOpts struct {
	FirstName string
	LastName string
	Age int
}

func MyFunc(opts MyFuncOpts) error {
	// do something here
}

func main() {
	MyFunc(MyFuncOpts {
		LastName: "Patel",
		Age: 50,
	})
	MyFunc(MyFuncOpts [
		FirstName: "Joe",
		LastName: "Smith"
	])
}

//Variadic Inpot Parameters

func addTo(base int, vals ...int) []int {
	response := make([]int, 0, len(vals))
	for _, v := range vals {
		response = append(response, base+v)
	}
	return response
}
func main() {
	fmt.Println(addTo(3))
	fmt.Println(addTo(3, 2))
	fmt.Println(addTo(3, 2, 4, 6, 8))
	a := []int{4, 3}
	fmt.Println(addTo(3, a...))
	fmt.Println(addto(3, []int{1, 2, 3, 4, 5, 6}))
}

// Multiple returning Values

func divAndRemainder(numerator int, denominator int) (int, int) {
	if denominator == 0 {
		return 0, 0, error.New("Cannot divide by zero.")
	}
	return numerator / denominator, numerator % denominator, nil
}

// Puedes manejar los errores, mandandolos siempre al final de la funcion

func main() {
	result, remainder, err := divAndRemainder(5, 2)
	if err != nil {
		fmt.Println(err)
		os.Exit(1)
	}
	fmt.Println(result, remainder)
}

// Named return values

func divAndremainder(numerator int, denominator int)
(result int, remainder int, err error) {
	if denominator == 0 {
		err = error.New("Cannot divide by zero.")
		return result, remainder, err
	}
	result, remainder = numerator/denominator, numerator%denominator
	return result, remainder, err
}

/* Cuando asignas nombre a los return values lo que haces es crear unas variables */
// No necesariamente tienes que retornar estas variables, el compilador intuye que devuelves

func divAndRemainder(numerator, denominator int)
(result, remainder int, err error) {
	// Assign values
	result, remainder = 20, 30
	if denominator == 0 {
		return 0, 0, error.New("Cannot divide by zero")
	}
	return numerator/denominator, numerator%denominator, nil
}

// Blank returns, retornan las variables con los valores que se le fueron asignados

func divAndRemainder(numerator, denominator int)
(result, remainder int, err error) {
	if denominator == 0 {
		err = error.New("Cannot divide by zero")
		return
	}
	result, remainder = numerator/denominator, numerator%denominator
	return
}

//! Functions are values

func add(i, j int) int { return i + j }
func sub(i, j int) int { return i - j }
func mul(i, j int) int { return i * j }
func div(i, j int) int { return i / j }

var opMap = map[string]func(int, int)int {
	"+": add,
	"-": sub,
	"*": mul,
	"/": div,
}

func main() {
	expressions := [][]string{
		{"2", "+", "3"},
		{"2", "-", "3"},
		{"2", "*", "3"},
		{"2", "/", "3"},
		{"2", "%", "3"},
		{"two", "+", "three"},
		{"5"},
	}
	for _, expression := range expressions {
		if len(expression) != 3 {
			fmt.Println("Invalid expression:", expression)
			continue
		}
		firstNumber, E := strconv.Atoi(expression[0])// Obtiene el primer numero
		if E != nil {
			fmt.Println(E)
			continue
		}
		operationString := expression[1] // obtiene la operacion
		operationFunction, ok := opMap[operationString]
		if != ok {
			fmt.Println("unsupported operator:", operationString)
			continue
		}
		secondNumber, E := strconv.Atoi(expression[2]) // Obtiene el segundo numero
		if E != nil {
			fmt.Println(E)
			continue
		}
		result := operationFunction(firstNumber, secondNumber)// Ejecuta ambos elementos
		fmt.Println(result)
	}
}

// function type declarations

type opFuncType func(int, int) int

// asi podriamos reescribir opMap
var opMap = map[string]opFuncType {
	// Same code
}

// Anonymous functions

func main() {
	F := func(j int) {
		fmt.Println("Printing:",j, "from inside of an anonymous function")
	}
	for i := 0; i < 5; i++ {
		F(i)
	}
}

// Also you can call the anontymous function inmediatelly

func main() {
	for i := 0; i < 5; i++ {
		func(j int) {
			fmt.Println("Printing", j, "from inside an anonymous function")
		}(i)
	}
}

// Creando algunas funciones anonimas

var (
	add = func(i, j int) int { return i + j }
	sub = func(i, j int) int { return i - j }
	mul = func(i, j int) int { return i * j }
	div = func(i, j int) int { return i / j }
)

func main() {
	x := add(2, 3)
	fmt.Println(x)
}

// Tambien puedes cambiarle el valor a una anonymous function de este modo

func main() {
	x := add(2, 3)
	fmt.Println(x)
	changeAdd()
	y := add(2, 3)
	fmt.Println(y)
}

func changeAdd() {
	add = func(i, j int) int { return i + j + j }
}

//! Closures

func main() {
	a := 20
	f := func() {
		fmt.Println(a)// 20
		a = 30
	}
	f()
	fmt.Println(a)
}
// Pero si usas := en vez de = el resultado es distinto

func main() {
	a := 20
	f := func() {
		fmt.Println(a)// 20
		a := 30
		fmt.Println(a)// 30
	}
	f()
	fmt.Println(a)// 20
}

//! Passing functions as parameters

type Person {
	FirstName string
	LastName string
	Age int
}

people := []Person{
	{"Pat", "Patterson", 37},
	{"Tracy", "Bobdaughter", 23},
	{"Fred", "Fredson", 37},
}
fmt.Println(people)
// sort by last name
sort.Splice(people, func(i, j int) bool {
	return people[i].LastName < people[j].lastName
})
fmt.Println(people)

//! Returning functions from functions

func makeMult(base int) func(int) int {
	return func(factor int) int {
		return base * factor
	}
}

func main() {
	twoBase := makeMult(2)
	threeBase := makeMult(3)
	for i := 0; i < 3; i++ {
		fmt.Println(twoBase(i), threeBase(i))
	}
}

//! Defer

func main() {
	if len(osArgs) < 2 { log.Fatal("No file specified.") }

	f, err := os.Open(os.Args[1])
	if err != nil { log.Fatal(err) }
	defer f.Close()

	data := make([]byte, 2048)

	for {
		count, err := f.Read(data)
		os.Stdout.Write(data[:count])
		if err != nil {
			if err != io.EOF { log.Fatal(err) }
			break
		}
	}
}

func deferExample() int {
	a := 10
	defer func(val int) { 
		fmt.Println("first:", val)
	}(a)
	a = 20
	defer fun(val int) {
		fmt.Println("second:", val)
	}(a)
	a = 30
	fmt.Println("existing:", a)
	return a
}
/* retornaria:
existing: 30
second: 20
first: 10 */

// A pattern using defer

func DoSomeInserts(ctx context.Context, db *sql.DB, value1, value2 string)
(err error) {
	tx, err := db.BeginTx(ctx, nil)
	if err != nil { return err }

	defer func() {
		if err == nil { err = tx.Commit() }
		if err != nil { tx.Rollback() }
	}()

	_, err = tx.ExecContext9ctx, "INSERT INTO FOO (val) values $1", value1
	if err != nil { return err }

	// use tx to do more database insers here

	return nil
}

// Another example

func getFile(name string) (*os.File, func(), error) {
	file, err := os.Open(name)
	if err != nil { return nil, nil, err }

	return file, func() {
		file.Close()
	}, nil
}

//! Las funciones siempre copian el valor por defecto

type person struct {
	age int
	name string
}

func modifYfails(i int, s string, p person) {
	i = i * 2
	s = "Goodbye"
	p.name = "bob"
}

func main() {
	p := person{}
	i := 2
	s := "Hello"

	modifYfails(i, s, p)
	fmt.Println(i, s, p) // 2 Hello {0 }
}

// Pero los maps y slices si pueden ser cambiados

func modMap(m map[int]string) {
	m[2] = "hello"
	m[3] = "hoodbye"
	delete(m, 1)
}

func modSlice(s []int) {
	for k, v := range s {
		s[k] = v * 2
	}
	s = append(s, 10)
}

func main() {
	m := map[int]string{
		1: "first",
		2: "second",
	}
	modMap(m)
	fmt.Println(m)// map[2:hello 3:goodbye]

	s := []int{1, 2, 3}
	modSlice(s)
	fmt.Println(s)// [2 4 6]
}

// puedes cambiar un slice en valores pero no en tamaño

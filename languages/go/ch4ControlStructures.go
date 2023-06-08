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


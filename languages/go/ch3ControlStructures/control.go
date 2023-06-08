// Shadowing variables

func main() {
	x := 10
	if x > 5 {
		fmt.Println(x)// 10
		x := 5// The symbol := shadows the variable
		fmt.Println(x)// 5
	}
	fmt.Println(x)// 10
}

func main() {
	x := 10
	if x > 5 {
		x, y := 5, 20
		fmt.Println(x, y)// 5 20
	}
	fmt.Println(x)// 10
}

// Shadows package name

func main() {
	x := 10
	fmt.Println(x)
	fmt := "Oops"
	fmt.Println(fmt)// fmt.Println undefined (type string has no field or method Println)
}

// Hay palabras reservadas (int, string) pero hay otras que no lo son(true, false)

fmt.Println(true)// true
true := 10
fmt.Println(true)// 10

//! condicionales en Go
n := randIntn(10)
if n == 0 {
	fmt.Println("That's too low")
} else if n > 5 {
	fmt.Println("Tha'ts too big:", n)
} else {
	fmt.Println("That's a good number:", n)
}

// Puedes crear variables que se usaran dentro del scope de los ifs

if n := rand.Intn(10); n == 0 {
	fmt.Println("That's too low")
} else if n > 5 {
	fmt.Println("That's too big:", n)
} else {
	fmt.Println("That's a good number:", n)
}
fmt.Println(n)// undefined: n

//! bucles For en go
/* Hay cuatro tipos de bucles for en go
un for estilo C
un condition-only for
un for infinito
y un for range*/

// C style for
for i := 0; i <= 10; i++ {
	fmt.Println(i)
}

// Condition only for
i := 1
for i < 100 {
	fmt.Println(i)
	i = i * 2
}

// Infinite for
for {
	fmt.Println("Hello")
}

//No hay do whiles en go en cambio para hacer un do while se haria asi

do {
} while(CONDITION)

for {
	if !CONDITION { break }
}

for i :+ 1; i <= 100; i++ {
	if i % 3 == 0 && i % 5 == 0 {
		fmt.Println("FizzBuzz")
		continue
	}
	if i % 3 == 0 {
		fmt.Println("Fizz")
		continue
	}
	if i % 5 === 0 {
		fmt.Println("Buzz")
		continue
	}
	fmt.Println(i)
}

// For range

evenVals := []int{2, 4, 6, 8, 10, 12}
for index, value := range evenVals {
	// Rest of the code
}
for _, value := range evenVals {
	// Uses only the values
}

// Puedes iterar en objetos del mismo modo
uniqueNames := map[string]bool{"Fred": true, "Raul": true, "William": true}
for key := range uniqueNames {
	fmt.Println(k)
}

// Iterando en un string

samples := []string{"Hello", "apple_π!"}
for _, sample := range samples {
	for i, r := range sample {
		fmt.Println(i, r, string(r))
	}
	fmt.Println()
}
//? Lo anterior imprimiria esto para el segundo string
/*
0 97 a
1 112 p
2 112 p
3 108 l
4 101 e
5 95 _
6 960 π << Este valor ocupa 2 bytes por lo tanto desplaza la 7ma poscicion
8 33 !

El bucle for funciona por las runas no por bytes

*/

// range crea una copia de los valores

evenVals := []int{2, 4, 6, 8, 10, 12}
for _, v := range evenVals {
	v *= 2
}
fmt.Println(evenVals)// [2 4 6 8 10 12]

// puedes asignarle nombres a los bucles

func main() {
	samples := []string{"Hello", "apple_π!"}

outer:
	for _, sample := range samples {
		for i, r := range sample {
			fmt.Println(i, r, string(r))
			if r == '1' { continue outer }
		}
		fmt.Println()
	}
}

// Switch statement

words := []string{"a", "cow", "smile", "gopher", "octopus", "anthropologist"}
for _, word := range words {
	switch size := len(word); size {
	case 1, 2, 3, 4:
		fmt.Println(word, "is a short word!")
	case 5:
		wordLen := len(word)
		fmt.Println(word, "is exactly the right length:", wordLen)
	case 6, 7, 8, 9: // nothing happens
	default:
		fmt.Println(word, "is a long word!")
	}
}

// puedes usar un switch con cualquier tipo de valor que funcione con la funcion ==

// esta funcion rompe el switch no el bucle for

func main() {
	for i := 0; i < 10; i++ {
		switch {
		case i % 2 == 0:
			fmt.Println(i, "is even")
		case i % 3 == 0:
			fmt.Println(i, "is divisible by 3 but not 2")
		case i % 7 == 0:
			fmt.Println("exit the loop!")
			break;
		default:
			fmt.Println(i, "is boring")
		}
	}
}

// Esta funcion rompe el bucle for 
func main() {
loop:
	for i := 0; i < 10; i++ {
		switch {
		case i % 2 == 0:
			fmt.Println(i, "is even")
		case i % 3 == 0:
			fmt.Println(i, "is divisible by 3 but not 2")
		case i % 7 == 0:
			fmt.Println("exit the loop!")
			break loop
		default:
			fmt.Println(i, "is boring")
		}
	}
}

//! Blank Switch es equivalente a (cond) de clojure

words := []string{"hi", "salutations", "hello"}
for _, word := range words {
	switch wordLen := len(word); {
	case wordLen < 5:
		fmt.Println(word, "is a short word!")
	case wordLen > 10:
		fmt.Println(word, "is a long word!")
	default:
		fmt.Println(word, "is exactly the right length.")
	}
}

switch {
case a == 2:
	fmt.Println("a is 2")
case a == 3:
	fmt.Println("a is 3")
case a == 4:
	fmt.Println("a is 4")
default:
	fmt.Println("a is ", a)
}
// can be writted better in this way

switch a {
case 2:
	fmt.Println("a is 2")
case 3:
	fmt.Println("a is 3")
case 4:
	fmt.Println("a is 4")
default:
	fmt.Println("a is ", a)
}


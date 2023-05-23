// Rune literal

const rune rune = '\u0061'
const rune2 rune = '\x61'

const spacingString = `Greetings and
"Salutations".`

var flag bool // set to false
var isAwesome = true

// number types

const int8low = -128
const int8High = 127

const uint8low = 0
const uint8high = 255

const byteLow byte = 0
const bytehigh byte = 255

// Puedes usar combinaciones de simbolos aritmeticos

var x int = 10
x *= 2

// Type convertions

var x int = 10
var y float64 = 30.2
var sum1 float64 = float64(x) + y
var sum2 int = x + int(y)
fmit.Println(sum1, sum2)

var x int = 10
var b byte = 100
var sum3 int = x + int(b)
var sum4 byte = byte(x) + b
fmit.Println(sum3, sum4)

// number to boolean

/*  para convertir un numero a booleano tienes que usar
== != > < <= >=*/

// Formas de declarar variables

var x int = 10

var x = 0

var xc int // 0

var x, y int = 10, 20

var x, y int

var x, y = 10, "hello"

var (
	x int
	y = 20
	z int = 30
	d, e = 40, "hello"
	f, g string
)

// This is the same thing

var x = 10
x := 10

x, y := 10, "Hello"

// := is only legal to use inside functions

const x int64 = 10
const (
	idKey = "id"
	nameKey = "name"
)

const z = 20 * 1

//Esto va a fallar por que las constantes deben depender de otras constantes

x := 5
y := 10
const z = x + z
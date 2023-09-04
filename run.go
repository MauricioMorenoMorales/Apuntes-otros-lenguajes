package main

import (
	"fmt"
	"math/big"
	"strings"
)

type Stack struct {
	data []int
}

func (stack *Stack) Push(value int) int {
	stack.data = append(stack.data, value)
	return value
}

func (stack *Stack) Peek() int {
	if len(stack.data) == 0 { return -1 }
	return stack.data[len(stack.data)-1]
}

func (stack *Stack) Pop() int {
	if len(stack.data) == 0 { return -1 }
	response := stack.data[len(stack.data)-1]
	stack.data = stack.data[:len(stack.data)-1]
	return response
}

func pop(list []int) []int {
	if len(list) == 0 { return []int{} }
	return list[1:]
}

func first(list []int) int {
	if len(list) == 0 { return -2 }
	return list[0]
}


func validateStackSequences(pushed []int, popped []int) bool {
	stack := &Stack{}
	for _, value := range pushed {
		stack.Push(value)
		for stack.Peek() == first(popped) {
			stack.Pop()
			popped = pop(popped)
		}
	}
	return len(popped) == 0
}

func arraySign(nums []int) int {
	var negativeCount int16
	for _, value := range nums {
		if value <= 0 { negativeCount++ }
		if value == 0 { return 1 }
	}
	return map[int16]int{0:1, 1:-1}[negativeCount % 2]
}

func convertToNumber(str string) int64 {
	numberValue := map[byte]int64{
		'1': 1,
		'2': 2,
		'3': 3,
		'4': 4,
		'5': 5,
		'6': 6,
		'7': 7,
		'8': 8,
		'9': 9,
		'0': 0,
	}
	var response int64
	var decimalPosition int64 = 1
	for i := len(str)-1; i >= 0; i-- {
		response += numberValue[str[i]] * decimalPosition
		decimalPosition *= 10
	}
	fmt.Printf("response = %d\n", response)
	return response
}

func multiply(num1, num2 string) string {
	firstValue := big.NewInt(convertToNumber(num1))
	secondValue := big.NewInt(convertToNumber(num2))
	result := new(big.Int)
	result.Mul(firstValue, secondValue)
	return result.String()
	// return strconv.FormatInt(firstValue * secondValue, 10)
}

func trimLastSpace(s string) string {
	var response strings.Builder
	firstLetterFound := false
	for i := len(s)-1; i >= 0; i-- {
		if s[i] != ' ' { firstLetterFound = true }
		if firstLetterFound { response.WriteByte(s[i])}
	}
	

	return response.String()
}

func reverseWords(s string) string {
	if len(s) == 1 { return s }

	var response strings.Builder
	for i := len(s)-2; i >= 0; i-- {
		if s[i] == ' ' && s[i+1] != ' ' {
			for j := i+1; j < len(s); j++ {
				if s[j] == ' ' { break }
				response.WriteByte(s[j])
			}
			response.WriteByte(' ')
		}
		// Last word
		if i == 0 && s[i] != ' ' {
			for j := i; j < len(s); j++ {
				if s[j] == ' ' { break }
				response.WriteByte(s[j])
			}
		}
	}
	return strings.TrimSpace(response.String())
}

/*
checamos cual es el peek del stack
si el elemento agregado al stack corresponde al primer popped lo sacamos
Agregamos el elemento al stack -> i++
*/


func main() {
	fmt.Println(validateStackSequences([]int{1,2,3,4,5}, []int{4,5,3,2,1}))
	fmt.Println(convertToNumber("1234"))
	fmt.Println(multiply("498828660196", "840477629533"))
	fmt.Println(reverseWords("Hola mundo esta es una prueba"))
	myString := "Probando quitar el ultimo espacioX"
	fmt.Println(myString[0:len(myString)-1])
}

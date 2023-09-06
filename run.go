package main

import (
	"fmt"
	"strconv"
)

type Stack struct {
	data []int
}

func (stack *Stack) Add(value int) {
	stack.data = append(stack.data, value)
}

func (stack *Stack) Peek() (res int, success bool) {
	if len(stack.data) == 0 { return 0, false }
	return stack.data[len(stack.data)-1], true
}

func (stack *Stack) LastTwo() (res int, res2 int, success bool) {
	if len(stack.data) <= 1 { return 0, 0, false }
	return stack.data[len(stack.data)-1], stack.data[len(stack.data)-2], true
}

func (stack *Stack) Pop() (res int, success bool) {
	if len(stack.data) == 0 { return 0, false }
	response := stack.data[len(stack.data)-1]
	stack.data = stack.data[:len(stack.data)-1]
	return response, true
}

func (stack *Stack) Total() int {
	var response int
	for _, value := range stack.data {
		response += value
	}
	return response
}

func calPoints(operations []string) int {
	stack := &Stack{}
	for _, value := range operations {
		switch value {
		case "C":
			stack.Pop()
		case "D":
			previousValue, ok := stack.Peek()
			if !ok { continue }
			stack.Add(previousValue * 2)
		case "+":
			lastValue1, lastValue2, ok := stack.LastTwo()
			if !ok { continue }
			stack.Add(lastValue1 + lastValue2)
		default:
			integer, _ := strconv.Atoi(value)
			stack.Add(integer)
		}
	}
	return stack.Total()
}

func singleNumber(nums []int) int {
	hashMap := make(map[int]int8)
	for _, value := range nums {
		hashMap[value]++
	}
	for key, value := range hashMap {
		if value == 1 { return key }
	}
	return -1
}

func main() {

	fmt.Println(calPoints([]string{"5","2","C","D","+"}))
}

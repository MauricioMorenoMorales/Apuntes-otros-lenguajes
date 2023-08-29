package main

import "sync"

type Set struct {
	data map[interface{}]bool
}

func NewSet() *Set {
	return &Set{
			data: make(map[interface{}]bool),
	}
}

func (s *Set) Add(value interface{}) {
	s.data[value] = true
}

func (s *Set) Includes(value interface{}) bool {
	_, found := s.data[value]
	return found
}

func (s *Set) Length() int {
	return len(s.data)
}

func countLetters(str string) map[interface{}]int {
	response := map[interface{}]int{}
	for _, value := range str {
		response[value]++
	}
	return response
}

func countPalindromicSubsequence(s string) int {
	response := NewSet()
	left := NewSet() //registers the letters you can found on left
	right := countLetters(s) // counts all occurrences on right

	for _, mid := range s {
		right[mid]-- //deletes occurence on right
		if right[mid] == 0 { delete(right, mid) }

		// VErify for each letter if its on right or left and add it
		//with the corresponden mid letter
		for _, letter := range "abcdefghijklmnopqrstuwvxyz" {
			if _, isInRight := right[letter];
			isInRight && left.Includes(letter) {
				response.Add(string(letter)+string(mid))
			}
		}
		left.Add(mid) //registers to the left the mid value
	}
	return response.Length()
}

type MyStack struct {
	data []int
}

func Constructor() MyStack {
	return MyStack{
		data: make([]int, 0),
	}
}

func (this *MyStack) Push (x int) {
	this.data = append(this.data, x)
}

func (this *MyStack) Pop() int {
	response := this.data[len(this.data)-1]
	this.data = this.data[:len(this.data)-1]
	return response
}

func (this *MyStack) Top() int {
	return this.data[len(this.data)-1]
}

func (this *MyStack) Empty() bool {
	return len(this.data) == 0
}


type Stack struct {
	items []interface{}
	lock sync.Mutex
}

func (s *Stack) Push(item interface{}) {
	s.lock.Lock()
	defer s.lock.Unlock()
	s.items = append(s.items, item)
}

func (s *Stack) Pop() interface{} {
	s.lock.Lock()
	defer s.lock.Unlock()

	if len(s.items) == 0 { return nil }

	item := s.items[len(s.items)-1]
	s.items = s.items[:len(s.items)-1]
	return item
}

func (s *Stack) Length() int {
	s.lock.Lock()
	defer s.lock.Unlock()

	return len (s.items)
}

func main() {
	stack := &Stack{}

	stack.Push(5)
	stack.Push(5)

}

type Stack1 struct {
	data []interface{}
	lock sync.Mutex
}

func (s *Stack1) Add(item interface{}) {
	s.lock.Lock()
	defer s.lock.Unlock()

	s.data = append(s.data, item)
}

func (s *Stack1)

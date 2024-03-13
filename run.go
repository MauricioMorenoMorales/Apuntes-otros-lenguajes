package main

import "fmt"

type ListNode struct {
	Val int
	Next *ListNode
}

/*
Input: head = [1,2,6,3,4,5,6], val = 6
Output: [1,2,3,4,5]

Input: [1,1,2,2,2,2], val = 1
Output: [2,2,2,2]
*/

//! Helpers
func ll(values []int) *ListNode {
	response := &ListNode{Val: -1, Next: nil}
	current := response

	for i := 0; i < len(values); i++ {
		current.Next = &ListNode{Val: values[i], Next: nil}
		current = current.Next
	}
	return response.Next
}

func printLl(head *ListNode) {
	var values []int
	for current := head; head != nil; head = head.Next {
		values = append(values, current.Val)
	}
	fmt.Println(values)
}

//! %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



func main() {
}
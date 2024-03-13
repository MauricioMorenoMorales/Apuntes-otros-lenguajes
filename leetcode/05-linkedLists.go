package main
func main() { }

type ListNode struct {
	Val int
	Next *ListNode
}

//! Reverses a linked list
/*
	[1,2,3,4,5] -> [5,4,3,2,1]
	[1,2] -> [2,1]
*/


func reverseList(head *ListNode) *ListNode {
	var response *ListNode
	for current := head; current != nil; current = current.Next {
		response = &ListNode{Val: current.Val, Next: response}
	}
	return response
}

//? Type
func reverseList_m(head *ListNode) *ListNode {
	var response *ListNode
	curr := head

	for curr != nil {
		tmp := curr.Next
		curr.Next = response
		response = curr
		curr = tmp
	}

	return response
}

//! Mergea dos listas enlazadas que estan sorteadas
/*
list1 = [1,2,4], list2 = [1,3,4]
	-> [1,1,2,3,4,4]

list1 = [], list2 = []
	-> []

list1 = [], list2 = [0]
	-> [0]
*/

func mergeTwoLists(list1, list2 *ListNode) *ListNode {
	var response *ListNode
	current1 := list1
	current2 := list2

	for current1 != nil && current2 != nil {
		if current1.Val > current2.Val {
			response = &ListNode{Val: current2.Val, Next: response}
			current2 = current2.Next
		} else {
			response = &ListNode{Val: current1.Val, Next: response}
			current1 = current1.Next
		}
	}

	for current1 != nil {
		response = &ListNode{Val: current1.Val, Next: response}
		current1 = current1.Next
	}
	for current2 != nil {
		response = &ListNode{Val: current2.Val, Next: response}
		current2 = current2.Next
	}
	return reverseList(response)
}

//? Speed
func mergeTwoLists_s(list1, list2 *ListNode) *ListNode {
	dummy := &ListNode{}
	node := dummy

	for list1 != nil && list2 != nil {
		if list1.Val < list2.Val {
			node.Next = list1
			list1 = list1.Next
		} else {
			node.Next = list2
			list2 = list2.Next
		}
		node = node.Next
	}

	if list1 != nil {
		node.Next = list1
	} else if list2 != nil {
		node.Next = list2
	}

	return dummy.Next
}

//! Verifica si una lista enlazada es un palindromo
/*
[1,2,2,1] -> true
[1,2]     -> false
*/

func isPalindrome_b(head *ListNode) bool {
	head2 := reverseList(head)
	for head2 != nil && head != nil {
		if head.Val != head2.Val { return false }
		head, head2 = head.Next, head2.Next
	}
	return true
}

func isPalindrome(head *ListNode) bool {
	slow, fast := head, head
	var reversed *ListNode
	
	for fast != nil && fast.Next != nil {
		fast = fast.Next.Next
		temporal := slow.Next
		slow.Next = reversed
		reversed = slow
		slow = temporal
	}

	if fast != nil { slow = slow.Next }

	for slow != nil {
		if slow.Val != reversed.Val { return false }
		slow, reversed = slow.Next, reversed.Next
	}

	return true
}

//! Remueve un elemento de una lista enlazada
/*
Input: head = [1,2,6,3,4,5,6], val = 6
Output: [1,2,3,4,5]
*/

func removeElements(head *ListNode, val int) *ListNode {
	if head == nil { return nil }

	for curr := head; curr.Next != nil; {
		if curr.Next.Val == val {
			curr.Next = curr.Next.Next
		} else {
			curr = curr.Next
		}
	}

	if head.Val == val {
		return head.Next
	}

	return head
}

//! 83. Remove Duplicates from Sorted List
/*
Input: head = [1,1,2,3,3]
Output: [1,2,3]
*/

func deleteDuplicates(head *ListNode) *ListNode {
	if head == nil { return nil }
	for current := head; current.Next != nil; {
		if current.Val == current.Next.Val {
			current.Next = current.Next.Next
		} else {
			current = current.Next
		}
	}
	return head
}

//! Retorna el punto medio de una lista
/*
	[1,2,3,4,5] ->   [3,4,5]
	[1,2,3,4,5,6] -> [4,5,6]
*/

func middleNode(head *ListNode) *ListNode {
	slow, fast := head, head
	for slow != nil && fast != nil && fast.Next != nil {
		slow = slow.Next
		fast = fast.Next.Next
	}
	return slow
}

//! 143 ReorderList
/*
  Toma una lista y pon el primer elemento al inicio despues el ultimo asi consecutivamente
  Input: head = [1,2,3,4]
  Output: [1,4,2,3]

  Input: head = [1,2,3,4,5]
  Output: [1,5,2,4,3]
*/
func toArray(head *ListNode) []int {
	var response []int
	for current := head; current != nil; current = current.Next {
		response = append(response, current.Val)
	}
	return response
}

func getOrder(list []int) []int {
	var response []int
	for i, j := 0, len(list)-1; i <= j; i, j = i+1, j-1 {
		if i == j {
			response = append(response, list[i])
			break
		}
		response = append(response, list[i])
		response = append(response, list[j])
	}
	return response
}

func reorderList(head *ListNode) {
	arrayList := toArray(head)
	orderedList := getOrder(arrayList)
	//fmt.Println(orderedList)

	for i, current := 0, head;
	current != nil && i < len(orderedList);
	i, current = i+1, current.Next {
		current.Val = orderedList[i]
	}
}
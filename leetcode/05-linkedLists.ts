class ListNode_ {
  val: number
  next: ListNode | null
  constructor(val?: number, next?: ListNode | null) {
    this.val = (val === undefined ? 0 : val)
    this.next = (next === undefined ? null : next)
  }
}

//! Reverses a linked list
/*
	[1,2,3,4,5] -> [5,4,3,2,1]
	[1,2] -> [2,1]
*/

const reverseList = (head: ListNode | null): ListNode | null => {
  let response: ListNode | null = null;
  while (head) {
    const temporal = head.next;
    head.next = response;
    response = head;
    head = temporal
  }
  return response;
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

const mergeTwoLists = (
  list1: ListNode | null,
  list2: ListNode | null
): ListNode | null => {
  let response: ListNode = new ListNode(0)
  let currentNode: ListNode = response

  while(list1 && list2) {
    if (list1.val < list2.val) {
      currentNode.next = list1
      list1 = list1.next
    } else {
      currentNode.next = list2;
      list2 = list2.next
    }

    currentNode = currentNode.next
  }

  if(list1) currentNode.next = list1
  if(list2) currentNode.next = list2

  return response.next
}

//! Verifica si una lista enlazada es un palindromo
/*
[1,2,2,1] -> true
[1,2]     -> false
*/

const isPalindrome = (head: ListNode | null): boolean => {
  let
    slow: ListNode | null = head,
    fast: ListNode | null = head,
    reversed: ListNode | null = head;
  
  while(fast && fast.next) {
    fast = fast.next.next

    const temporal: ListNode | null = slow!.next
    slow!.next = reversed
    reversed = slow
    slow = temporal
  }

  if (fast) slow = slow!.next

  while(slow) {
    if(slow.val !== reversed!.val) return false;
    slow = slow.next
    reversed = reversed!.next
  }
  return true
}

//! Remueve un elemento de una lista enlazada
/*
Input: head = [1,2,6,3,4,5,6], val = 6
Output: [1,2,3,4,5]
*/

const removeElements = (head: ListNode | null, val: number): ListNode | null => {
  if(!head) return head
  let current = head

  while(current && current.next)
    if(current.next.val === val) current.next = current.next.next
    else current = current.next

  if(head.val === val) return head.next
  return head
}

//! 83. Remove Duplicates from Sorted List
/*
Input: head = [1,1,2,3,3]
Output: [1,2,3]
*/

const deleteDuplicates = (head: ListNode | null): ListNode | null => {
  if(!head) return null
  let current: ListNode | null = head

  while(current && current.next)
    current.val === current.next.val
      ? current.next = current.next.next
      : current = current.next

  return head
}

//! 143 ReorderList
/*
  Toma una lista y pon el primer elemento al inicio despues el ultimo asi consecutivamente
  Input: head = [1,2,3,4]
  Output: [1,4,2,3]

  Input: head = [1,2,3,4,5]
  Output: [1,5,2,4,3]
*/

function toArray(head: ListNode | null): Array<number> {
  const response: Array<number> = []

  for(let current = head; current; current = current.next)
    response.push(current.val)

  return response
}

function getOrder(list: Array<number>): Array<number> {
  const response: Array<number> = []

  for(let i = 0, j = list.length-1; i <= j; i++, j--) {
    if(i === j) response.push(list[i])

    response.push(list[i])
    response.push(list[j])
  }
  return response
}

function reorderList_(head: ListNode | null) {
  const arrayList: Array<number> = toArray(head)
  const orderedList: Array<number> = getOrder(arrayList)

  for (
    let i = 0, current = head;
    current && i < orderedList.length;
    i++, current = current.next
  )
    current.val = orderedList[i]
}

//? Speed -------------------------------------

function splitLinkedListInHalf(list: ListNodeNull): Array<ListNodeNull> {
  let slow = list, fast = list!.next
  while(fast && fast.next) {
    slow = slow!.next
    fast = fast.next.next
  }
  const secondHalf = slow!.next
  slow!.next = null

  return [list, secondHalf]
}

function reverse_(list: ListNodeNull): ListNodeNull {
  let response: ListNodeNull = null
  
  while(list) {
    const temporal = list.next
    list.next = response
    response = list
    list = temporal
  }

  return response
}

function mergeLists(list1: ListNodeNull, list2: ListNodeNull): ListNodeNull {
  let response: ListNodeNull = new ListNode()
  let pointer = response

  while(list1 && list2) {
    pointer.next = list1
    list1 = list1.next
    pointer = pointer.next
    pointer.next = list2
    list2 = list2.next
    pointer = pointer.next
  }

  if(list1) pointer.next = list1
  if(list2) pointer.next = list2
  return response.next
}

function reorderList(list: ListNodeNull): ListNodeNull {
  let [firstHalf, secondHalf] = splitLinkedListInHalf(list)
  let reversedSecondHalf = reverse(secondHalf)
  return mergeLists(firstHalf, reversedSecondHalf)
}

//! 160. Intersection of Two Linked Lists
/*
l1 = [4,1,8,4,5], l2 = [5,6,1,8,4,5]
output [8,4,5]
*/

function getIntersectionNode(list1: ListNodeNull, list2: ListNodeNull): ListNodeNull {
  let
    pointer1: ListNodeNull = list1,
    pointer2: ListNodeNull = list2
  while(pointer1 != pointer2) {
    pointer1 = pointer1 ? pointer1.next : list2
    pointer2 = pointer2 ? pointer2.next : list1
  }
  return pointer1
}

//! 2130. Maximum Twin Sum of a Linked List
/*
Input: head = [5,4,2,1]
Output: 6
Explanation:
Nodes 0 and 1 are the twins of nodes 3 and 2, respectively. All have twin sum = 6.
There are no other nodes with twins in the linked list.
Thus, the maximum twin sum of the linked list is 6.

Input: head = [4,2,2,3]
Output: 7
Explanation:
The nodes with twins present in this linked list are:
- Node 0 is the twin of node 3 having a twin sum of 4 + 3 = 7.
- Node 1 is the twin of node 2 having a twin sum of 2 + 2 = 4.
Thus, the maximum twin sum of the linked list is max(7, 4) = 7.
*/

function pairSum(head: ListNode | null): number {
  let
    slow: ListNode | null = head,
    fast: ListNode | null = head,
    reversed: ListNode | null = null;

  while(fast && fast.next) {
    fast = fast.next.next
    const temporal = slow!.next
    slow!.next = reversed
    reversed = slow
    slow = temporal
  }

  let response = 0

  while(slow) {
    const currentValue = reversed!.val + slow!.val
    if (currentValue > response) response = currentValue
    reversed = reversed!.next
    slow = slow!.next
  }
  return response
}

//! 19 Remove Nth Node From End of List
/*
Input: head = [1,2,3,4,5], n = 2
Output: [1,2,3,5]

Input: head = [1,2], n = 1
Output: [1]
*/

function removeNthFromEnd(head: ListNode | null, n: number): ListNode | null {
  let response: ListNode | null = new ListNode(0, head),
    left: ListNode | null = response,
    right: ListNode | null = head;

    while(n > 0) {
      right = right!.next
      n--
    }

    while(left && right) {
      left = left.next
      right = right.next
    }

    left!.next = left!.next!.next
    return response.next
}

//! 1721 Swapping Nodes in a Linked List
/*
Input: head = [1,2,3,4,5], k = 2
Output: [1,4,3,2,5]

Input: head = [7,9,6,6,7,8,3,0,9,5], k = 5
Output: [7,9,6,6,8,7,3,0,9,5]
*/

function swapNodes(head: ListNode | null, k: number): ListNode | null {
  let dummy = new ListNode(0, head),
    left: ListNode | null = dummy,
    right: ListNode | null = dummy,
    final: ListNode | null = dummy

  for(let i = 0; i < k; i++) {
    left = left!.next
  }

  while(k > 0) {
    final = final!.next
    k--
  }

  while(right && final) {
    right = right.next
    final = final.next
  }

  // Swap values
  const temporal = left!.val
  left!.val = right!.val
  right!.val = temporal

  return dummy.next
}

//! 138 Copy List with random pointer
/*
tienes una lista enlazada que contiene un valor y un valor random haz una copia de ella

Input: head = [[7,null],[13,0],[11,4],[10,2],[1,0]]
Output: [[7,null],[13,0],[11,4],[10,2],[1,0]]

Input: head = [[1,1],[2,1]]
Output: [[1,1],[2,1]]

Input: head = [[3,null],[3,0],[3,null]]
Output: [[3,null],[3,0],[3,null]]
*/

//? review

class NodeRandom {
  val: number
  next: NodeRandom | null
  random: NodeRandom | null
  constructor(val?: number, next?: NodeRandom, random?: NodeRandom) {
    this.val = val ? val : 0
    this.next = next ? next : null
    this.random = random ? random : null
  }
}

function copyRandomList(head: NodeRandom | null): NodeRandom | null {
  let hash = new Map<NodeRandom, NodeRandom>();

  let response = new NodeRandom(0);
  let current = head;
  let newCurrent = response;

  while (current) {
      let newNode = new NodeRandom(current.val);
      newCurrent.next = newNode;
      newCurrent = newNode;
      hash.set(current, newNode);

      current = current.next;
  }

  current = head;
  while (current) {
      let inNew = hash.get(current);
      if (current.random) {
          let inNewRand = hash.get(current.random);
          inNew!.random = inNewRand;
      }
      current = current!.next;
  }

  return response.next;
}

const copyRandomListd = (head: NodeRandom | null): NodeRandom | null => {
  let hash = new Map<NodeRandom, NodeRandom>()

  let response = new NodeRandom(0)
  let current = head
  let newCurrent = response

  while(current) {
    let newNode = new NodeRandom(current.val)
    newCurrent.next = newNode
    newCurrent = newNode

    current = current.next
  }

  current = head
  while(current) {
    let inNew = hash.get(current)
    if(current.random) {
      let inNewRand = hash.get(current.random)
      inNew!.random = inNewRand
    }
    current = current!.next
  }
  return response.next
}

//! 707 Design Linked list

interface Node {
  val: number
  next: Node
}

class MyLinkedList {
  head: Node;
  size: number;
  
  constructor() {
    this.head = null
    this.size = 0
  }

  getNode(index: number): Node | null {
    if (index < 0 || index >= this.size) return null
    let count = 0
    let node = this.head
    while (count < index) {
      node = node.next
      count++
    }
    return node
  }
  
  get(index: number): number {
    const node = this.getNode(index)
    if (!node) return -1
    return node.val
  }

  addAtHead(val: number): void {
    const next = this.head
    this.head = { val, next }
    this.size++
  }

  addAtTail(val: number): void {
    if (this.size === 0) {
      this.addAtHead(val)
      return
    }
    const node = this.getNode(this.size - 1)
    node.next = { val, next: null }
    this.size++
  }

  addAtIndex(index: number, val: number): void {
    if (index < 0 || index > this.size) return
    if (index === this.size) {
      this.addAtTail(val)
      return
    }
    if (index === 0) {
      this.addAtHead(val)
      return
    }
    const node = this.getNode(index - 1)
    node.next = { val, next: node.next}
    this.size++
  }

  deleteAtIndex(index: number): void {
    if (index < 0 || index >= this.size) return
    if (this.size === 0) return
    if (index === 0) {
      this.head = this.head.next
      this.size--
      return
    }
    const node = this.getNode(index - 1)
    node.next = node.next?.next || null
    this.size--
  }
}

//! 2 add two numbers

/*
Input: l1 = [2,4,3], l2 = [5,6,4]
Output: [7,0,8]
Explanation: 342 + 465 = 807.

Input: l1 = [0], l2 = [0]
Output: [0]

Input: l1 = [9,9,9,9,9,9,9], l2 = [9,9,9,9]
Output: [8,9,9,9,0,0,0,1]
*/

function addTwoNumbers(
  list1: ListNode | null,
  list2: ListNode | null
): ListNode | null {
  let
    dummyNode: ListNode = new ListNode(),
    currentNode: ListNode = dummyNode,
    carry: number = 0;

  while (list1 || list2 || carry !== 0) {
      const
        value1 = list1 ? list1.val : 0,
        value2 = list2 ? list2.val : 0,
        sum: number = value1 + value2 + carry,
        value: number = sum % 10,
        newLinkedList: ListNode = new ListNode(value);

      currentNode.next = newLinkedList;
      currentNode = newLinkedList;
      carry = Math.floor(sum / 10);

      list1 = list1 ? list1.next : null;
      list2 = list2 ? list2.next : null;
  }
  return dummyNode.next;
}

//! 24 Swwap Nodes in Pairs
/*
Input: head = [1,2,3,4]
Output: [2,1,4,3]
Example 2:

Input: head = []
Output: []
Example 3:

Input: head = [1]
Output: [1]
*/

function swapPairs(head: ListNode | null): ListNode | null {
  let dummy = new ListNode(0, head)
  let previous = dummy, current = head

  while(current && current.next) {
    // Saving pointers
    const nextNext: ListNode | null = current.next.next
    const next: ListNode | null = current.next

    // Reverse pointers
    next.next = current
    current.next = nextNext
    previous.next = next

    // Update pointers
    previous = current
    current = nextNext
  }
  return dummy.next
}

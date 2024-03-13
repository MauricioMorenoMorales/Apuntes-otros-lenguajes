const _ = (value: any): any => (...functions: any[]) : any =>
  functions.reduce((response, func) => func(response), value)

class ListNode {
  val: number
  next: ListNode | null
  constructor(val?: number, next?: ListNode | null) {
    this.val = (val === undefined ? 0 : val)
    this.next = (next === undefined ? null : next)
  }
}

const logList = (list: ListNode | null) => {
  const response: Array<number> = []
  while(list) {
    response.push(list.val)
    list = list.next
  }
  console.log(response)
}

const linkedList = (values: Array<number>): ListNode | null => {
  let response: ListNode | null = new ListNode(0, null)
  let pointer: ListNode | null = response

  for (const value of values) {
    pointer.next = new ListNode(value, null)
    pointer = pointer?.next
  }

  return response.next
}

type falsy = false | null | undefined
type ListNodeNull = ListNode | null
//! Helpers ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

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

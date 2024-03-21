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

// _([1,2,1])(
//   generateRow,
//   generateRow,
//   generateRow,
//   console.log
// )

// console.log(generate(1))
// console.log(generate(2))
// console.log(generate(3))
// console.log(generate(4))
// console.log(generate(5))
// console.log(generate(6))

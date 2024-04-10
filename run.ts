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
const getNumericValue = (word: string): number => word
  .split('')
  .reduce((response, letter) => response += Number(letter.charCodeAt(0)),0)

function groupAnagrams_(words: Array<string>): string[][] {
  let groupedValues: { [key: number]: Array<string> } = {}

  for (const word of words) {
    const wordValue = getNumericValue(word)
    if(!groupedValues[wordValue]) groupedValues[wordValue] = [word]
    else groupedValues[wordValue].push(word)
  }

  return Object.values(groupedValues)
}

function isPalindrome(s: string): boolean {
  s = s.replace(/[^a-zA-Z0-9]/g, "").toLowerCase()
  for(let i = 0, j = s.length-1; i < j; i++, j--) {
    if(s[i] !== s[j]) return false
  }
  return true
}

function groupAnagrams(strs: Array<string>): string[][] {
  const wordsMap = strs.reduce((map, current) => {
    const sortedWord = current.split('').sort().join('')
    map[sortedWord] = (map[sortedWord] || []).concat(current)
    return map
  }, {})

  return Object.values(wordsMap)
}


_("A man, a plan, a canal: Panama")(
  isPalindrome,
  console.log
)

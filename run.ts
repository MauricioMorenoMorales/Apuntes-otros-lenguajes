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

const numberValues: {[key: string]: string[]} = {
  '1': ''.split(''),
  '2': 'abc'.split(''),
  '3': 'def'.split(''),
  '4': 'ghi'.split(''),
  '5': 'jkl'.split(''),
  '6': 'mno'.split(''),
  '7': 'pqrs'.split(''),
  '8': 'tuv'.split(''),
  '9': 'wxyz'.split('')
}

function combine1(digits: string): string[] {
  return numberValues[digits[0]]
}
function combine2(digits: string): string[] {
  let response: Array<string> = []
  const numbers1 = numberValues[digits[0]]
  const numbers2 = numberValues[digits[1]]

  for (const letter1 of numbers1)
    for (const letter2 of numbers2)
      response.push(`${letter1}${letter2}`)

  return response
}
function combine3(digits: string): string[] {
  let response: Array<string> = []
  const numbers1 = numberValues[digits[0]]
  const numbers2 = numberValues[digits[1]]
  const numbers3 = numberValues[digits[2]]

  for (const letter1 of numbers1)
    for (const letter2 of numbers2)
      for (const letter3 of numbers3)
        response.push(`${letter1}${letter2}${letter3}`)

  return response
}
function combine4(digits: string): string[] {
  let response: Array<string> = []
  const numbers1 = numberValues[digits[0]]
  const numbers2 = numberValues[digits[1]]
  const numbers3 = numberValues[digits[2]]
  const numbers4 = numberValues[digits[3]]

  for (const letter1 of numbers1)
    for (const letter2 of numbers2)
      for (const letter3 of numbers3)
        for (const letter4 of numbers4)
        response.push(`${letter1}${letter2}${letter3}${letter4}`)

  return response
}

function letterCombinations(digits: string): string[] {
  switch (digits.length) {
    case 1: return combine1(digits)
    case 2: return combine2(digits)
    case 3: return combine3(digits)
    case 4: return combine4(digits)
    default: return []
  }
}


function addBinary(b1: string, b2: string): string {
  let p1 = b1.length-1, p2 = b2.length-1
  let response = ''
  let remaining = true
  while(p1 && p2) {
    const current1 = b1[p1], current2 = b2[p2]
    const areBothZero = current1 === '0' && current2 === '0'
    const areBothOne = current1 === '1' && current2 === '1'
    const areDifferent = !areBothOne && !areBothZero

    if(areBothOne) {
      response += '0'
      remaining = true
    } else if (areBothZero) {
      if(remaining) {
        response += '1'
        remaining = false
      }
      response += '0'
    } else if (areDifferent) {
      if(remaining) {
        response += '0'
        remaining = true
      } else {
        response += '1'
      }
    }
    p1--;p2--;
  }
  console.log(response)

  if(remaining) response += '1'
  return response.split('').reverse().join('')
}

function isHappy(n: number): boolean {
  let currentValue = n
  for (let i = 0; i < 10000; i++)
    if (currentValue === 1) return true
    else currentValue = currentValue
      .toString()
      .split('')
      .map(x => Number(x) ** 2)
      .reduce((response, current) => response + current, 0)
  return false
}


//_(addBinary("1010", "1011"))(console.log)

_(19)(isHappy, console.log)

"111"
"111"
"1000"

"101"
"101"
"1011"

"1011"
 "101"
"0010"

 ' '
 "1010"
 "1011"
"10101"

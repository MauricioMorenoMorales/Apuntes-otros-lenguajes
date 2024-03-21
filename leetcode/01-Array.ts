//! 217 Contains Duplicate
/*
  Input: nums = [1,2,3,1]
  Output: true

  Input: nums = [1,2,3,4]
  Output: false

  Input: nums = [1,1,1,3,3,4,3,2,4,2]
  Output: true
*/

function containsDuplicate(nums: Array<number>): boolean {
  let hashMap: { [key: number]: boolean } = {}
  for (const value of nums) {
    if(value in hashMap) return true
    hashMap[value] = true
  }
  return false
}

//! 242 Valid Anagram

/*
Input: s = "anagram", t = "nagaram"
Output: true

Input: s = "rat", t = "car"
Output: false
*/
function isAnagram(string1: string, string2: string): boolean {
  if(string1.length !== string2.length) return false

  const
    sorted1 = string1.split('').sort(),
    sorted2 = string2.split('').sort();

  for (let i = 0; i < sorted1.length; i++) {
    if(sorted1[i] !== sorted2[i]) return false
  }

  return true
}

function isAnagram_memory(s: string, t: string) {
  if(s.length !== t.length) return false

  let first: Array<string | null> = s.split('')
  const second: Array<string | null> = t.split('')

  for (const element of second) {
    const found = first.indexOf(element)

    if (found !== -1) first[found] = null
    else return false
  }
  return true
}

//! 1299. Replace Elements with Greatest Element on Right Side

/*
  Input: arr = [17,18,5,4,6,1]
  Output: [18,6,6,6,1,-1]
*/

const remplaceElements = (arr: number[]): number[] => {
  let response: number[] = new Array(arr.length)
  let currentMax: number = -1

  for(let i = arr.length; i >= 0; i--) {
    const current: number = arr[i]
    response[i] = currentMax
    currentMax = current > currentMax ? current : currentMax
  }
  return response
}

//! 392. Is Subsequence
/*
Input: s = "abc", t = "ahbgdc"
Output: true

Input: s = "axc", t = "ahbgdc"
Output: false
*/

function isSubsequence(substring: string, string: string): boolean {
  let susbtringCount = 0
  let subStringIndex = 0

  for (let value of string)
    if(value === substring[subStringIndex]) {
      susbtringCount++
      subStringIndex++
    }

  return susbtringCount === substring.length
}

//! 1. Two Sum
/*
  Input: nums = [2,7,11,15], target = 9
  Output: [0,1]
  Explanation: Because nums[0] + nums[1] == 9, we return [0, 1].

  Input: nums = [3,2,4], target = 6
  Output: [1,2]

  Input: nums = [3,3], target = 6
  Output: [0,1]
*/
function twoSum(nums: number[], target: number): number[] {
  let hashMap: {[key: number]: number} = {}

  for (let i = 0; i < nums.length; i++) {
    const current: number = nums[i],
      necesaryValueToTarget: number = target - current,
      indexInHash: number = hashMap[necesaryValueToTarget]

    if(indexInHash !== undefined) return [i, indexInHash]

    hashMap[current] = i
  }
  return [-1, -1]
}

//! 14. Longest Common Prefix
/*
Input: strs = ["flower","flow","flight"]
Output: "fl"

Input: strs = ["dog","racecar","car"]
Output: ""
Explanation: There is no common prefix among the input strings.
*/

function longestCommonPrevix(strings: Array<string>): string {
  const firstValue: string = strings[0]
  let response: string = ''
  let currentIndex: number = 0

  for (let currentLetter of firstValue) {

    for(let word of strings) if(word[currentIndex] !== currentLetter)
      return response

    response += currentLetter
    currentIndex++
  }
  return response
}

//! 118. Pascal's Triangle
/*
  Genera cierta cantidad de filas dentro de un triangulo de pascal

  Input: numRows = 5
  Output: [[1],[1,1],[1,2,1],[1,3,3,1],[1,4,6,4,1]]

  Input: numRows = 1
  Output: [[1]]
*/

function generateRow(row: number[]): number[] {
  let response: number[] = []
  for (let i = 0, j = 1; j < row.length; i++, j++) {
    response.push(row[i] + row[j])
  }
  return [1, ...response, 1]
}

function generate(numRows: number): number[][] {
  let rows: number[][] = [[1], [1,1]]

  if(numRows <= 2) return rows.slice(0, numRows)

  numRows -= 2
  while(numRows > 0) {
    const lastRow = rows[rows.length-1]
    const nextRow = generateRow(lastRow)
    rows.push(nextRow)
    numRows--
  }
  return rows
}

//? optimal
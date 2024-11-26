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

  for (let i = 0; i < sorted1.length; i++)
    if(sorted1[i] !== sorted2[i]) return false

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

  for (const currentLetter of firstValue) {

    for(let word of strings)
      if(word[currentIndex] !== currentLetter) return response

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

//! 49 Group Anagrams
/*
Input: strs = ["eat","tea","tan","ate","nat","bat"]
Output: [["bat"],["nat","tan"],["ate","eat","tea"]]

Input: strs = [""]
Output: [[""]]

Input: strs = ["a"]
Output: [["a"]]
*/
function groupAnagrams(strs: Array<string>): string[][] {
  const wordsMap = strs.reduce(
    (map: { [key: string]: string[] }, word: string) => {
      let sortedWord = word.split('').sort().join()
      map[sortedWord] = (map[sortedWord] || []).concat(word)
      return map
    },
    {},
  )
  return Object.values(wordsMap)
}

//! 929. Unique Email Addresses
/*
Input: emails = ["test.email+alex@leetcode.com","test.e.mail+bob.cathy@leetcode.com","testemail+david@lee.tcode.com"]
Output: 2
Explanation: "testemail@leetcode.com" and "testemail@lee.tcode.com" actually receive mails.

Input: emails = ["a@leetcode.com","b@leetcode.com","c@leetcode.com"]
Output: 3
*/

function numUniqueEmails(emails: string[]): number {
  const set = new Set()

  for(let email of emails) {
    const emailParts = email.split('@')
    const firstHalf = emailParts[0].split('.').join('').split('+')[0]
    const secondHalf = emailParts[1]

    set.add(`${firstHalf}@${secondHalf}`)
  }
  return set.size
}

//! 205. Isomorphic Strings
/*
Input: s = "egg", t = "add"
Output: true

Input: s = "foo", t = "bar"
Output: false

Input: s = "paper", t = "title"
Output: true
*/
function isIsomorphic(s: string, t: string): boolean {
  for(let i = 0; i < s.length; i++)
    if(t.indexOf(t[i]) !== s.indexOf(s[i])) return false
  return true
}

//! 13. Roman to Integer
/*
Input: s = "III"
Output: 3
Explanation: III = 3.

Input: s = "LVIII"
Output: 58
Explanation: L = 50, V= 5, III = 3.

Input: s = "MCMXCIV"
Output: 1994
Explanation: M = 1000, CM = 900, XC = 90 and IV = 4.
*/

const romanToInt = (
  s: any,
  romanValues = { I: 1, V: 5, X: 10, L: 50, C: 100, D: 500, M: 1000 },
): number =>
  s
    .split('')
    .map(letter => romanValues[letter])
    .reduce(
      (response, current, i, self) =>
        current < self[i + 1] ? response - current : response + current,
      0,
    )

//! 11. Container With Most Water
/*
Input: height = [1,8,6,2,5,4,8,3,7]
Output: 49
Explanation: The above vertical lines are represented by array [1,8,6,2,5,4,8,3,7]. In this case, the max area of water (blue section) the container can contain is 49.

Input: height = [1,1]
Output: 1
*/

function maxArea(vertical: number[]): number {
  let maximum: number = 0
  let i = 0, j = vertical.length-1
  while (i < j) {
    const height = Math.min(vertical[i], vertical[j])
    const width = j-i
    const area = height * width
    
    maximum = Math.max(area, maximum)

    if(vertical[i] < vertical[j]) i++
    else j--
  }
  return maximum
};

/*
!Consejos a realizar
? Pensar solucion hashmap
? Pensar si un sort soluciona el problema
? Pensar el problema en distinta direccion

! Algunos ejercicios si dan respuestas raras buscan hacer mutaciones a inputs

Para fixear tamaño array usa: new Array(nums.length * 2)
Es bastante optima la destructuracion [...nums, ...nums]
*/

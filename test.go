package main

import (
	"fmt"
	"runtime/debug"
	"sort"
	"strings"
	"unicode"
)

func replaceElements(arr []int) []int {
	response := make([]int, len(arr))

	for i := 0; i < len(arr); i++ {
		var highest int = -1

		for j := i+1; j < len(arr); j++ {
			if arr[j] > highest {
				highest = arr[j]
			}
		}

		response[i] = highest
	}

	return response
}
//? Speed --------------

func max(a, b int) int {
	if a > b { return a }
	return b
}

func replaceElements_s(arr []int) []int {
	temp := -1
	for i := len(arr) -1; i >= 0; i-- {
		arr[i], temp = temp, max(temp, arr[i])
	}
	return arr
}

// ---
func replaceElements_s2(arr []int) []int {
	result := make([]int, len(arr))
	max := -1

	for i := len(arr)-1; i >= 0; i-- {
		result[i] = max
		if arr[i] > max {
			max = arr[i]
		}
	}
	return result
}

func isSubsequence(s, t string) bool {
	if len(s) == 0 { return true }

	for i, j := 0, 0; i < len(t); i++ {
		if s[j] == t[i] { j++ }
		if j == len(s) { return true }
	}
	return false
}

func lengthOfLastWord(s string) int {
	if len(s) == 1 { return 1 }
	var response = 0

	for isTailSpace, i := true, len(s) - 1; i > 0; i-- {
		if s[i] != ' ' {
			isTailSpace = false
			response++
		}
		if s[i] == ' ' && !isTailSpace { break }
	}

	return response
}

func reverseString(s []byte) {
	var temp byte
	for i, j := 0, len(s) -1; i < j; i, j = i+1, j-1 {
		temp = s[j]
		s[j], s[i] = s[i], temp
	}
}

func removeDuplicates(list []int) int {
	var setMap = map[int]bool{}
	var response int

	for _, value := range list {
		if _, ok := setMap[value]; ok {
			response++
		} else {
			setMap[value] = true
		}
	}
	return response
}

func removeDuplicates2(nums []int) int {
	length := len(nums)
	if length < 2 { return length }

	k, i := 1, 1
	for i < length {
		if nums[i] != nums[i-1] {
			nums[k] = nums[i]
			k++
		}
		i++
	}
	return k
}


func moveZeroes(nums []int) {
	var newValue = make([]int, len(nums))
	right, left := 0, len(nums) - 1

	for _, value := range nums {
		if value == 0 {
			newValue[left] = 0
			left--
		} else {
			newValue[right] = value
			right++
		}
	}

	for i := 0; i < len(nums); i++ { nums[i] = newValue[i] }
}

func removeSymbolsAndLowercase(input string) string {
	var response strings.Builder

	for _, char := range input {
		if unicode.IsLetter(char) {
			response.WriteRune(unicode.ToLower(char))
		}
		if unicode.IsNumber(char) {
			response.WriteRune(char)
		}
	}
	return response.String()
}

func isPalindrome(s string) bool {
	s = removeSymbolsAndLowercase(s)
	for i, j := 0, len(s) - 1; i < j; i, j = i+1, j-1 {
		if s[i] != s[j] { return false }
	}
	return true
}

func rotate(matrix [][]int) {
	side := len(matrix)
	var newValue [][]int

	for i := 0; i < side; i++ {
		var newRow []int
		for j := side - 1; j >= 0; j-- {
			newRow = append(newRow, matrix[j][i])
		}
		newValue = append(newValue, newRow)
	}
	for i := 0; i < side; i++ {
		for j := 0; j < side; j++ {
			matrix[i][j] = newValue[i][j]
		}
	}
}

//! Isomorfic strings

func isIsomorphic(s string, t string) bool {
	var setMap1 = make(map[byte]int)
	var setMap2 = make(map[byte]int)

	for i := 0; i < len(s); i++ {
		value1, ok1 := setMap1[s[i]]
		value2, ok2 := setMap2[t[i]]

		if !ok1 && !ok2 {
			setMap1[s[i]] = i
			setMap2[t[i]] = i
		} else if ok1 != ok2 || value1 != value2 {
			return false
		} else { continue }
	}
 return true
}

func majorityElement(nums []int) int {
	var mostOccurrent = -1
	var response int
	mapSet := make(map[int]int)

	for _, element := range nums {
		if _, ok := mapSet[element]; !ok {
			mapSet[element] = 1
		} else {
			mapSet[element]++
		}
	}

	for key, count := range mapSet {
		if count > mostOccurrent {
			mostOccurrent = count
			response = key
		}
	}

	return response
}

func generate(numRows int) [][]int {
	response := [][]int{{1}, {1, 1}}

	if numRows <= 2 { return response[0:numRows] }

	var lastValue = 1
	for numRows > 2 {
		newValue := []int{1}
		for i := 1; i < len(response[lastValue]); i++ {
			newValue = append(newValue, response[lastValue][i-1] + response[lastValue][i])
		}
		newValue = append(newValue, 1)
		response = append(response, newValue)
		lastValue++
		numRows--
	}
	return response
}


func twoSum(nums []int, target int) []int {
	for i := 0; i < len(nums); i++ {
		for j := len(nums) - 1; j >= 0; j-- {
			if nums[i] + nums[j] == target {
				return []int{i, j}
			}
		}
	}
	return []int{}
}

func twoSum2(nums []int, target int) []int {
	mapHash := make(map[int]int)

	for index, value := range nums {
		neededValue := target - value
		if storedIndex, ok := mapHash[neededValue]; ok {
			return []int{index, storedIndex}
		} else {
			mapHash[value] = index
		}
	}
	return []int{-1}
}

func test(nums []int, target int) []int {
	hashMap := make(map[int]int)

	for index, value := range nums {
		neededValue := target - value
		if storedIndex, ok := hashMap[neededValue]; ok {
			return []int{index, storedIndex}
		} else {
			hashMap[value] = index
		}
	}
	return []int{}
}

func mapFirstGreatestElement (list []int) map[int]int {
	response := make(map[int]int)

	for i := 0; i < len(list); i++ {
		var foundGreatestValue int = -1
		for j := i + 1; j < len(list); j++ {
			if list[i] < list[j] {
				foundGreatestValue = list[j]
				break
			}
		}
		response[list[i]] = foundGreatestValue
	}

	return response
}

func nextGreaterElement(nums1 []int, nums2 []int) []int {
	nums2FirstGreatestValue := mapFirstGreatestElement(nums2)
	response := make([]int, len(nums1))

	for i, value := range nums1 {
		response[i] = nums2FirstGreatestValue[value]
	}

	return response
}

func formatEmail(email string) string {
	var response strings.Builder
	isArrobaFound, isPlusFound := false, false

	for _, value := range email {
		if value == '@' {
			isArrobaFound = true
			response.WriteRune(value)
		} else if value == '+' {
			isPlusFound = true
		} else if !((value == '.' && !isArrobaFound) || (isPlusFound && !isArrobaFound)){
			response.WriteRune(value)
		}
	}

	return response.String()
}

func numUniqueEmails(emails []string) int {
	formattedEmails := make([]string, len(emails))
	for i, value := range emails {
		formattedEmails[i] = formatEmail(value)
	}

	setMap := make(map[string]bool)
	for _, value := range formattedEmails {
		setMap[value] = true
	}

	return len(setMap)
} 

//! Group anagrams
/*
Input: strs = ["eat","tea","tan","ate","nat","bat"]
Output: [["bat"],["nat","tan"],["ate","eat","tea"]]
*/

func sortString(s string) string {
	bytes := []byte(s)
	
	sort.Slice(bytes, func(i, j int) bool {
			return strings.ToLower(string(bytes[i])) < strings.ToLower(string(bytes[j]))
	})
	
	return string(bytes)
}

func groupAnagrams(strs []string) [][]string {
	anagramMap := make(map[string][]string)

	for _, value := range strs {
		sortedString := sortString(value)
		anagramMap[sortedString] = append(anagramMap[sortedString], value)
	}

	var response [][]string
	for _, array := range anagramMap {
		response = append(response, array)
	}

	return response
}

func groupAnagrams_s(strs []string) [][]string {
	m := make(map[[58]int8][]string, len(strs))
	for _, str := range strs {
		var hash [58]int8
		for _, char := range str {
			index := char - 'A'
			hash[index] = hash[index] + 1
		}
		m[hash] = append(m[hash], str)
	}

	res := make([][]string, 0, len(m))
	for _, val := range m {
		res = append(res, val)
	}
	return res
}

//! Encuentra la cantidad de ocurrencias de la palabra baloon dentro de un string
func sortString(s string) string {
	bytes := []byte(s)
	
	sort.Slice(bytes, func(i, j int) bool {
			return strings.ToLower(string(bytes[i])) < strings.ToLower(string(bytes[j]))
	})
	
	return string(bytes)
}

func min(numbers ...int) int {
	if len(numbers) == 0 {
		return 0
	}
	response := numbers[0]
	for _, num := range numbers[1:] {
		if num < response {
			response = num
		}
	}
	return response
}
func maxNumberOfBalloons(text string) int {
	sortedText := sortString(text)
	baloonMapCount := make(map[byte]int)

	for _, value := range sortedText {
		if value == 'b' { baloonMapCount['b']++}
		if value == 'a' { baloonMapCount['a']++}
		if value == 'l' { baloonMapCount['l']++}
		if value == 'o' { baloonMapCount['o']++}
		if value == 'n' { baloonMapCount['n']++}
	}

	if len(baloonMapCount) != 5 { return 0 }

	baloonMapCount['o'] /= 2
	baloonMapCount['l'] /= 2

	return min(
		baloonMapCount['b'],
		baloonMapCount['a'],
		baloonMapCount['l'],
		baloonMapCount['o'],
		baloonMapCount['n'],)
}

func validPalindrome2(s string) bool {
	i, j := 0, len(s)-1
	isAValueDeleted := false

	for i <= j {
		if s[i] != s[j] {
			if isAValueDeleted {
				return false
			}
			if s[i] == s[j-1] && s[i+1] == s[j] {
				j -= 2
				i += 2
				isAValueDeleted = true
			} else if s[i] == s[j-1] {
				j--
				isAValueDeleted = true
			} else if s[i+1] == s[j] {
				i++
				isAValueDeleted = true
			} else {
				return false
			}
		}
		i++
		j--
	}
	return true
}

func validPalindrome(s string) bool {
	for i, j := 0, len(s)-1; i < j; i, j = i+1, j-1 {
		if s[i] != s[j] {
			return validPalindromeHelper(s, i+1, j) || validPalindromeHelper(s, i, j-1)
		}
	}
	return true
}

func validPalindromeHelper(s string, i, j int) bool {
	for i < j{
		if s[i] != s[j] { return false }
		i++
		j--
	}
	return true
}

type pair struct {
	key int
	occurrence int
}

//! retorna cierta cantidad de elementos dependiendo su ocurrencia <<<
func sortByOccurrence(m map[int]int) []pair { // <<<

	pairs := make([]pair, len(m))
	i := 0
	for k, v := range m {
		pairs[i] = pair{k, v}
		i++
	}

	sort.Slice(pairs, func(i, j int) bool {
		return pairs[i].occurrence > pairs[j].occurrence
	})


	return pairs
}

func topKFrequent(nums []int, k int) []int {
	occurrencesMap := make(map[int]int)

	for _, value := range nums {
		occurrencesMap[value]++
	}

	sortedMap := sortByOccurrence(occurrencesMap)
	var response []int

	for _, value := range sortedMap {
		if k == 0 { break }
		response = append(response, value.key)
		k--
	}
	return response
}

func sumElements(nums []int) int {
	var response int
	for _, value := range nums {
		response += value
	}
	return response
}

func pivotIndex(nums []int) int {
	rightValue := sumElements(nums)
	var leftvalue int

	for i, value := range nums {
		if leftvalue == rightValue - value {
			return i
		} else {
			rightValue -= value
			leftvalue += value
		}
	}

	return -1
}

func findDisappearedNumbers(nums []int) []int {
	hashRange := make(map[int]bool)

	for i := 1; i <= len(nums); i++ { hashRange[i] = false }
	for _, value := range nums { hashRange[value] = true }

	var response []int
	for key, isFound := range hashRange {
		if !isFound { response = append(response, key) }
	}

	return response
}

func absolute(n int) int {
	if n < 0 { return n * -1 }
	return n
}

func findDisappearedNumbers_s(nums []int) []int { //<<<
	for _, n := range nums {
		i := absolute(n) - 1
		nums[i] = -1 * absolute(nums[i])
	}

	var res []int
	for i, n := range nums {
		if n > 0 {
			res = append(res, i + 1)
		}
	}
	return res
}



func longestConsecutive_f(nums []int) int {
	if len(nums) == 0 { return 0 }

	nextValueMap := make(map[int]int)
	for _, value := range nums {
		nextValueMap[value] = value + 1
	}

	response := 1
	for _, num := range nums {
		currenValue := num
		iterationCount := 0
		nextValue, ok := nextValueMap[currenValue]

		for ok {
			iterationCount++
			currenValue = nextValue
			nextValue, ok = nextValueMap[currenValue]
		}

		if iterationCount > response { response = iterationCount }
	}

	return response
}

func longestConsecutive_m(nums []int) int {
	debug.SetGCPercent(1)
	if len(nums) == 0 { return 0 }

	set := make(map[int]bool)
	for _, value := range nums { set[value] = true }
	maxCount := 1

	for _, value := range nums {
		if set[value-1] { continue }

		iterationCount := 1
		current := value + 1
		for set[current] {
			iterationCount++
			current++
		}

		if iterationCount > maxCount { maxCount = iterationCount }
	}

	return maxCount
}

func longestConsecutive_s(nums []int) int {
	if len(nums) == 0 { return 0 }

	sort.Slice(nums, func (i, j int) bool {
		return nums[i] < nums[j]
	})

	longest := 1
	current := 1

	for i := 1; i < len(nums); i++ {
		if nums[i] == nums[i-1] + 1 {
			current++
		} else if nums[i] != nums[i -1] {
			current = 1
		}

		if current > longest {
			longest = current
		}
	}
	return longest
}

//! Verifica que un sudoku sea valido
func hasRepeatedElements(elements []byte) bool {
	hashMap := make(map[byte]bool)
	for _, value := range elements {
		if value == '.' { continue }
		if hashMap[value] {
			return true
		} else {
			hashMap[value] = true
		}
	}
	return false
}

func areValidRows(board [][]byte) bool {
	for _, row := range board {
		if hasRepeatedElements(row) { return false }
	}
	return true
}

func areValidColumns(board [][]byte) bool {
	for i := 0; i < len(board); i++ {
		var column []byte
		for j := 0; j < len(board); j++ {
			column = append(column, board[j][i])
		}
		if hasRepeatedElements(column) { return false }
	}
	return true
}

func areValidCuadrant(board [][]byte) bool {
	for i := 0; i < len(board); i = i+3 {
		var cuadrantValues []byte
		for j := 0; j < len(board); j = j+3 {
			cuadrantValues = append(cuadrantValues, board[j][i])
			cuadrantValues = append(cuadrantValues, board[j][i+1])
			cuadrantValues = append(cuadrantValues, board[j][i+2])
			cuadrantValues = append(cuadrantValues, board[j+1][i])
			cuadrantValues = append(cuadrantValues, board[j+1][i+1])
			cuadrantValues = append(cuadrantValues, board[j+1][i+2])
			cuadrantValues = append(cuadrantValues, board[j+2][i])
			cuadrantValues = append(cuadrantValues, board[j+2][i+1])
			cuadrantValues = append(cuadrantValues, board[j+2][i+2])

			if hasRepeatedElements(cuadrantValues) {return false}
			cuadrantValues = []byte{}
		}
	}
	return true
}

func isValidSudoku(board [][]byte) bool {
	return areValidRows(board) && areValidColumns(board) && areValidCuadrant(board)
}

func areValidCuadrantTest() {
	matrix := [][]byte{
		{'5', '3', '.', '.', '7', '.', '.', '.', '.'},
		{'6', '.', '.', '1', '9', '5', '.', '.', '.'},
		{'.', '9', '8', '.', '.', '.', '.', '6', '.'},
		{'8', '.', '.', '.', '6', '.', '.', '.', '3'},
		{'4', '.', '.', '8', '.', '3', '.', '.', '1'},
		{'7', '.', '.', '.', '2', '.', '.', '.', '6'},
		{'.', '6', '.', '.', '.', '.', '2', '8', '.'},
		{'.', '.', '.', '4', '1', '9', '.', '.', '5'},
		{'.', '.', '.', '.', '8', '.', '.', '7', '9'},
	}
	fmt.Println(isValidSudoku(matrix))
}

func sortColors(nums []int) {
	for c := 0; c < len(nums)/3; c++ {// repeat algorithm bellow
		for i, j := 0, len(nums)-1; i < len(nums) && j >= 0; i, j = i+1, j-1 {// left inc i, right decreasing j
			if nums[i] < nums[j] { // i < j -> swap
				nums[j], nums[i] = nums[i], nums[j]
			}
		}
		for i := 1; i < len(nums); i++ { //Two pointers i and i-1 swap
			if nums[i-1] > nums[i] {
				nums[i-1], nums[i] = nums[i], nums[i-1]
			}
		}
	}
}

func take(length int, s string) string {
	var response strings.Builder
	i := 0

	for _, value := range s {
		if i >= length { break }
		response.WriteRune(value)
		i++
	}

	return response.String()
}

func strStr(haystack string, needle string) int {
	for i := range haystack {
		if haystack[i] == needle[0] {
			if take(len(needle), haystack[i:]) == needle { return i }
		}
	}
	return -1
}

func subarraySum(nums []int, k int) int {//? <<< https://leetcode.com/problems/subarray-sum-equals-k/
	prefix := map[int]int{0:1}
	currentSum := 0
	response := 0
	for _, number := range nums {
		currentSum += number
		if _, ok := prefix[currentSum-k]; ok {
			response += prefix[currentSum-k]
		}
		prefix[currentSum]++
	}
	return response
}

func toString(a, b, c byte) string {
	return string([]byte{a,b,c})
}

func countPalindromicSubsequence(s string) int {
	set := map[string]bool{}
	for i := 0; i < len(s); i++ {
		for j := len(s)-1; j >= 0; j-- {
			if s[i] == s[j] {
				for x := i+1; x < j; x++ {
					set[toString(s[i],s[x],s[j])] = true
				}
			}
		}
	}
	return len(set)
}

func last(stack []byte) byte {
	return stack[len(stack)-1]
}

func isValid(s string) bool {
	var stack []byte

	for _, character := range s {
		switch character {
			case '(':
				stack = append(stack, '(')
			case '[':
				stack = append(stack, '[')
			case '{':
				stack = append(stack, '{')
			case ')':
				if len(stack) == 0 { return false }
				if last(stack) == '(' {
					stack = stack[:len(stack)-1]
				} else { return false }
			case ']':
				if len(stack) == 0 { return false }
				if last(stack) == '[' {
					stack = stack[:len(stack)-1]
				} else { return false }
			case '}':
				if len(stack) == 0 { return false }
				if last(stack) == '{' {
					stack = stack[:len(stack)-1]
				} else { return false }
		}
	}

	return len(stack) == 0
}

func isValid_s(s string) bool { //<<<
	pairs := map[byte]byte {
		'}': '{',
		']': '[',
		')': '(',
	}

	stack := make([]byte, 0)

	for _, char := range []byte(s) {
		pair, ok := pairs[char]

		if !ok {
			stack = append(stack, char)
			continue
		}

		if len(stack) == 0 { return false }

		if stack[len(stack)-1] != pair { return false }

		stack = stack[:len(stack)-1]
	}

	return len(stack) == 0
}


func mergeArray(list1 []int, list2[]int) []int {
	var response []int
	i, j := 0, 0

	for i < len(list1) && j < len(list2) {
		if list1[i] < list2[j] {
			response = append(response, list1[i])
			i++
		} else if list1[i] > list2[j] {
			response = append(response, list2[j])
			j++
		} else {
			response = append(response, list1[i])
			response = append(response, list2[j])
			i++; j++
		}
	}
	for i < len(list1) {
		response = append(response, list1[i])
		i++
	}
	for j < len(list2) {
		response = append(response, list2[j])
		j++
	}
	return response
}

func findMedian(list []int) float64 {
	size := len(list)
	for i, j := 0, size-1; i <= j; i, j = i+1, j-1 {
		if size % 2 == 1 && i == j { return float64(list[i]) }
		if size % 2 == 0 &&  j - i == 1 { return (float64(list[j]) + float64(list[i])) / 2 }
	}
	return -1
}

func findMedianSortedArrays(nums1 []int, nums2 []int) float64 {
	mergedArray := mergeArray(nums1, nums2)
	return findMedian(mergedArray)
}

func reorganizeString(s string) string {
	bytes := []byte(s)

	for i := 1; i < len(bytes)-1; i++ {
		if bytes[i-1] == bytes[i] {
			bytes[i], bytes[i+1] = bytes[i+1], bytes[i]
		}
	}

	for i := 1; i < len(bytes)-1; i++ {
		if bytes[i] == bytes[i-1] { return "" }
	}
	return string(bytes)
}

func getSum(a int, b int) int {
	response := 0
	for a != 0 {
		if a > 0 {
			response++
			a--
		} else {
			response--
			a++
		}
	}
	for b != 0 {
		if b > 0 {
			response++
			b--
		} else {
			response--
			b++
		}
	}
	return response
}

package main

import (
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

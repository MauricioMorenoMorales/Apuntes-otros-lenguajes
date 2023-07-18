package main

import "sort"

//! contains duplicate

func generateSet(list []int) []int {
	var setMap = map[int]bool{}
	for _, value := range list {
		setMap[value] = true
	}

	var response []int
	for key := range setMap {
		response = append(response, key)
	}
	return response
}

func containsDuplicate(nums []int) bool {
	listWithoutRepetitionsSize := len(generateSet(nums))
	listSize := len(nums)

	return listWithoutRepetitionsSize != listSize
}

//? Speed -----------------------------------------------

func containsDuplicateS(nums []int) bool {
	sNums := make(map[int]bool)

	for _, v := range nums {
		if _, ok := sNums[v]; ok {
			return true
		}
		sNums[v] = true
	}
	return false
}

//? Memory ----------------------------------------

func containsDuplicateM(nums []int) bool {
	sort.Ints(nums)

	for i := 0; i < len(nums) - 1; i++ {
		if (nums[i] == nums[i + 1]) {
			return true
		}
	}
	return false
}

//! Is anagram

func isAnagram(s string, t string) bool {
	if len(s) != len(t) { return false }

	var freq [26]int

	for index := 0; index < len(s); index++ {
		freq[s[index] - 'a']++
		freq[t[index] - 'a']--
	}

	for i := 0; i < len(freq); i++ {
		if freq[i] != 0 { return false }
	}
	return true
}

//! Reemplaza el elemento con el numero mas grande a la derecha

func max(a, b int) int {
	if a > b { return a }
	return b
}

func replaceElements_s(arr []int) []int {
	previous := -1
	for i := len(arr) - 1; i >= 0; i-- {
		arr[i], previous = previous, max(previous, arr[i])
	}
	return arr
}

//! Retorna si un elemento es subsequencia de otro

func isSubsequence(s, t string) bool {
	if len(s) == 0 { return true }

	for i, j := 0, 0; i < len(t); i++ {
		if s[j] == s[i] { j++ }
		if j == len(s) { return true }
	}
	return false
}

//! retorna el tamaño de la ultima palabra dentro de un array

func lengthOfLastWord(s string) int {
	if len(s) == 1 { return 1 }
	var response int

	for isTailSpace, i := true, len(s) - 1; i >= 0; i-- {
		if s[i] != ' ' {
			isTailSpace = false
			response++
		}
		if s[i] == ' ' && !isTailSpace { break }
	}
	return response
}

//! reverse a String, muta el valor por puntero

//? Speed
func reverseString(s []byte) {
	var temp byte
	for i, j := 0, len(s) -1; i < j; i, j = 1+1, j-1 {
		temp = s[j]
		s[j], s[i] = s[i], temp
	}
}

//? Speed
func reverseString(s []byte) {
	i := 0
	j := len(s)-1

	for i < j {
		s[i], s[j] = s[j], s[i]
		i++
		j--
	}
}

//! Pasa todos los zeros al final de la lista
//? Velocidad

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

//? Memoria

func moveZeroes_m(nums []int) {
	i, j := 0, i+1

	for i < len(nums) && j < len(nums) {
		if nums[i] == 0 && nums[j] != 0 {
			nums[i], nums[j] = nums[j], nums[i]
			i++
			j++
		} else if nums[i] == 0 && nums[j] == 0 {
			j++
		} else {
			i++
			j++
		}
	}
}

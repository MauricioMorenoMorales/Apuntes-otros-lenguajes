package main

import (
	"sort"
	"strings"
	"unicode"
)

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
	i := 0
	j := i + 1

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

//! verifica que sea un palindromo

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

// ! Busca el elemento mas comun dentro de un array

func majorityElemen(nums []int) int {
	var mostOcurrent = -1
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
		if count > mostOcurrent {
			mostOcurrent = count
			response = key
		}
	}

	return response
}

func majorityElement_s(nums []int) int { // <<<
	var candidate, count int

	for _, num := range nums {
		if count == 0 {
			candidate = num
			count = 1
		} else if num == candidate {
			count++
		} else {
			count--
		}
	}

	return candidate
}

func majorityElements_m(nums []int) int { //<<<
	l := len(nums) / 2
	ec := make(map[int]int, l)

	for _, n := range nums {
		if _, ok := ec[n]; !ok {
			ec[n] = 0
		}
		ec[n] += 1

		if ec[n] > l {
			return n
		}
	}
	return 0
}

//! Verifica cual es el maximo nivel de prefijos en comun entre varias palabras

func longestCommonPrefix(strs []string) string {
	var res strings.Builder

	for letterPosition := 0; letterPosition < len(strs[0]); letterPosition++ {
		for _, selectedString := range(strs) {
			if letterPosition >= len(selectedString) || selectedString[letterPosition] != strs[0][letterPosition] {
				return res.String()
			}
		}
		res.WriteByte(strs[0][letterPosition])
	}
	return res.String()
}

func removeElement(nums []int, value int) []int {
	var response []int

	for _, current := range nums {
		if current != value {
			response = append(response, value)
		}
	}

	return response
}

func removeElem(nums []int, val int) int {
	var response int

	for i, j := 0, 0; i < len(nums); i++ {
		if nums[i] != val {
			nums[j] = nums[i]
			j++
			response++
		}
	}

	return response
}

//! retorna el elemento mas grande de un array en la segunda parte
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

//! verifica que un email sea valido
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

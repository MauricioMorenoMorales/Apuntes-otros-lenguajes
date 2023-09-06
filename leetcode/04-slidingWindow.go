package main

import "fmt"

func lengthOfLongestSubstring_f(s string) int {
	if len(s) <= 1 { return len(s) }
	if len(s) == 2 && s[0] == s[1] { return 1 }

	var response int
	hashMap := make(map[byte]int8)
	left, right := 0, 1
	hashMap[s[0]]++
	currentCount := len(hashMap)

	i := 1

	for right < len(s) {
		if right == left {right++; currentCount++ }
		if right >= len(s) { break }
		_, ok := hashMap[s[right]]
		fmt.Printf("Iteration number %d: ", i)
		fmt.Printf("%t", ok)
		fmt.Printf(", with currentCount %d\n", currentCount)

		if ok {
			hashMap[s[left]]--
			if s[left] == 0 { delete(hashMap, s[left]) }
			left++
		} else {
			hashMap[s[right]]++
			right++
		}

		currentCount = len(hashMap)
		if currentCount > response { response = currentCount }
		i++
	}

	return response
}

func lengthOfLongestSubstring(s string) int {
	charSet := make(map[byte]bool)
	var left int
	var response int
	
	for right := range s {
			for charSet[s[right]] {
					delete(charSet,s[left])
					left++
			}
			charSet[s[right]] = true
			response = max(response, right-left+1)
	}
	return response
}

func max(a,b int) int {
	if a > b{
			return a
	}
	return b
}
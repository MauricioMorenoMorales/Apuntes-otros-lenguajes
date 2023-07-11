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

package main

import (
	"fmt"
	"strings"
)

func doIndexesEqualK(indexes []int, k int) bool {
	for i := 0; i < len(indexes); i++ {
		for j := i+1; j < len(indexes); j++ {
			if indexes[j] - indexes[i] <= k { return true }
		}
	}
	return false
}

func containsNearbyDuplicate(nums []int, k int) bool {
	numberIndexRegister := make(map[int][]int)
	for index, number := range nums {
		numberIndexRegister[number] = append(numberIndexRegister[number], index)
	}

	for _, indexes := range numberIndexRegister {
		fmt.Println(indexes)
		if found := doIndexesEqualK(indexes, k); found {
			return true
		}
	}

	return false
}

func removeStars(s string) string {
	var starCount int16
	var letters []byte
	for i := len(s)-1; i >= 0; i-- {
		if s[i] == '*' { starCount++; continue }
		if starCount > 0 { starCount--; continue }
		letters = append(letters, s[i])
	}

	var response strings.Builder
	for i := len(letters)-1; i >= 0; i-- {
		response.WriteByte(letters[i])
	}
	return response.String()
}

func maxValue(values map[int]int) int {
	maxValue := 0
	for _ , value := range values {
		if value > maxValue { maxValue = value }
	}
	return maxValue
}

func leastBricks(wall [][]int) int {
	sumRegister := make(map[int]int)
	for _, row := range wall {
		currentSize := 0
		for _, brick := range row[:len(row)-1] {
			currentSize += brick
			sumRegister[currentSize]++
		}
	}

	return len(wall) - maxValue(sumRegister)
}

func main() {
	// fmt.Println(containsNearbyDuplicate([]int{1,2,3,1}, 3))
	// fmt.Println(containsNearbyDuplicate([]int{1,0,1,1}, 1))
	// fmt.Println(containsNearbyDuplicate([]int{1,2,3,1,2,3}, 2))
	// fmt.Println(containsNearbyDuplicate([]int{99,99}, 2))
	// fmt.Println(containsNearbyDuplicate([]int{1,2,3,1,2,3}, 2))
	fmt.Printf("Response: ")
	fmt.Println(leastBricks([][]int{
		{1, 2, 2, 1},
		{3, 1, 2},
		{1, 3, 2},
		{2, 4},
		{3, 1, 2},
		{1, 3, 1, 1},
	}))
	fmt.Printf("Response: ")
	fmt.Println(leastBricks([][]int{
		{1},
		{1},
		{1},
	}))
}

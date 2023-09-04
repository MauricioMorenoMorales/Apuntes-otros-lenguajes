package main

import (
	"strings"
)

func mergeAlternately(word1 string, word2 string) string {
	var response strings.Builder
	for i := 0; i < len(word1) || i < len(word2); i++ {
		if i < len(word1) { response.WriteByte(word1[i]) }
		if i < len(word2) { response.WriteByte(word2[i]) }
	}
	return response.String()
}

func absolute(n int) int {
	if n > 0 { return n }
	return n * -1
}

func rotate(nums []int, k int) {
	k = k % len(nums)
	if k != 0 {
		newValue := make([]int, len(nums))

		pointer := len(nums)-k % len(nums)
		for i := range newValue {
			newValue[i] = nums[pointer]

			pointer = (pointer+1) % len(nums)
		}

		for i := range newValue { nums[i] = newValue[i] }
	}
}

func rotate_s(nums []int, k int) {
	k = k % len(nums) // quita sobrante con el modulo
	reverse(nums, 0, len(nums) -1)// cero--final
	reverse(nums, 0, k-1)// cero k
	reverse(nums, k, len(nums)-1) // k final

}

func reverse(nums []int, start, end int) {
	for start <= end { // swapea start con end
		nums[start], nums[end] = nums[end], nums[start]
		start++ // aumenta inicio reduce fin
		end--
	}
}

func max(a,b int) int {
	if a > b { return a }
	return b
}

func maxProfit(prices []int) int {
	l := 0; r := 1
	response := 0
	for l < len(prices) && r < len(prices) {
		if prices[l] < prices[r] {
			profit := prices[r] - prices[l]
			response = max(response, profit)
		} else { l += 1 }
		r += 1
	}
	return response
}

func mergeArray(list1 []int, list2[]int) []int {
	var response []int
	i, j := 0, 0

	for i < len(list1) && j < len(list2) {
		if list1[i] < list2[j] {
			response = append(response, list1[i])
			i++
		} else if list1[i] > list2[j] {
			response = append(response, list[j])
			j++
		} else {
			response = append(response, list1[i])
			response = append(response, list[j])
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

func findMedianSortedArrays(nums1 []int, nums2 []int) float64 {
	mergedArray := 
}

func productExceptSelf(nums []int) []int {// <<<
	response := make([]int, len(nums))
	prefix := 1
	for i, number := range nums {
		response[i] = prefix // agrega el prefijo anterior a la respuesta
		prefix *= number // el prefijo se multiplica con el actual
	}
	fmt.Println(response)
	postfix := 1
	for i := len(nums)-1; i >= 0; i-- { // en reversa
		fmt.Printf("Multiplica response[i] %d por prefix %d y guarda %d \n", response[i], postfix, response[i] * postfix)
		response[i] *= postfix // A la respuesta le asigna el postfijo
		postfix *= nums[i] // El postfijo toma el valor del postfijo anterior
		fmt.Printf("Postfix ahora vale %d antes valia: %d\n", response[i], postfix)
		fmt.Println("FITER -------------------")
	}
	fmt.Printf("El resultado es %v\n", response)
	return response //fin :)
}

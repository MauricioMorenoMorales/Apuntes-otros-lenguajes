package main

//! 217. Contains Duplicate
func containsDuplicate(nums []int) bool {
	hashMap := make(map[int]uint8, len(nums))

	for _, value := range nums {
		if hashMap[value]++; hashMap[value] > 1 {
			return true
		}
	}
	return false
}

//! Notes %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%5

// Sortear
// Dos punteros
// Por extremos
// Por hacer reverse
// Nesting for loop
// Conditional nested for

// Cuando busques balances usa un 0 suma y resta dependiendo el balance

/* Si tu iteracion ocupa obtener informacion de tanto el lado derecho o izquierdo puedes conocoerlo
usando tablas de hash */



func search(nums []int, target int) int {
	L, R := 0, len(nums)-1

	for L <= R {
		M := (L + R) >> 1
		number := nums[M]
		if number == target {
			return M
		} else if number < target {
			L = M+1
		} else {
			R = M-1
		}
	}
	return -1
}

//! Busca en que lugar debe de ir un valor, dentro de un array sorteado
func searchInsert(nums []int, target int) int {
	left, right := 0, len(nums)-1
	middle := (left + right) >> 1

	if target > nums[right] { return right+1 }
	if target < nums[left] { return 0 }

	for left <= right {
		middle = (left + right) >> 1
		current := nums[middle]

		if current == target {
			return middle
		} else if current < target {
			left = middle+1
		} else {
			right = middle-1
		}
	}
	return left
}

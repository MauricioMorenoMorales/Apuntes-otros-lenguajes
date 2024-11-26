function removeElement(nums: number[], val: number): number {
  let response = 0
  let i = 0, j = 0
  
  while (i < nums.length) {
    if (nums[i] !== val) {
      nums[j] = nums[i]
      j++
      response++
    }
    i++
  }
  return response
}

console.log(generate(3))

function removeElement(nums: number[], val: number): number {
  let response = 0
  for(let i = 0, j = 0; i < nums.length; i++) if (nums[i] !== val) {
    nums[j] = nums [i]
    j++; response++
  }
  return response
}

function removeElement(nums: number[], val: number): number {
  let response = 0
  for (let i = 0, j = 0; i < nums.length; i++) if (nums[i] !== val) {
    nums[j] = nums[i]
    j++; response++;
  }
}

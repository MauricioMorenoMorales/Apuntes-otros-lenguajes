function permute(nums: number[]): number[][] {
  const result: number[][] = [];
  const used: boolean[] = Array(nums.length).fill(false);

  function backtrack(path: number[]) {
    if (path.length === nums.length) {
      result.push([...path]);
      return;
    }
    for (let i = 0; i < nums.length; i++) {
      if (used[i]) continue;
      used[i] = true;
      path.push(nums[i]);
      backtrack(path);
      path.pop();
      used[i] = false;
    }
  }

  backtrack([]);
  return result;
}

// Ejemplo:
console.log(permute([1, 2, 3]));
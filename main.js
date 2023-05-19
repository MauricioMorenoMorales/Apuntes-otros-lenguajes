const testing = test => func => {

}

const _ = data => {
  const functor = {
    convert: func => _(func(data)),
    log: () => {
      console.log(data);
      return _(data);
    },
    value: data
  };

  // Get all string method names
  const dataTypeMethods = [
    Object.getOwnPropertyNames(String.prototype),
    Object.getOwnPropertyNames(Array.prototype),
    Object.getOwnPropertyNames(Object.prototype)
  ]

  // Add string methods to the functor
  dataTypeMethods.forEach(datatype =>
    datatype.forEach(method => {
      functor[method] = (...args) => _(data[method](...args));
    })
  )

  return functor;
};

const test = _(123)
  .convert(String)
  .split('')
  .map(Number)
  .map(element => element * element)
  .reverse()
  .join('')
  .convert(Number)
  .value


console.log('..............')

console.log(test)

console.log(Object.getOwnPropertyNames(String.prototype))
console.log(String)

const recurFibo = number => {
  const fibo = (current, next, count) =>
    count === 0
      ? current
      : fibo(next, (current + next), --count)

  return fibo(0, 1, number)
}

console.log(recurFibo(1))
console.log(recurFibo(2))
console.log(recurFibo(3))
console.log(recurFibo(4))
console.log(recurFibo(5))
console.log(recurFibo(6))
console.log(recurFibo(7))
console.log(recurFibo(8))
console.log(recurFibo(9))

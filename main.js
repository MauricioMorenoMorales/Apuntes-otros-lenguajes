const testing = test => func => {

}

const _ = data => ({
  convert: func => _(func(data)),
  split: string => _(data.split(string)),
  join: string => _(data.join(string)),
  reverse: () => _(data.reverse()),
  map: func => _(data.map(func)),
  log: () => {
    console.log(data)
    return Functor(data)
  },
  value: data
})

const test = _(123)
  .convert(String)
  .split('')
  .map(Number)
  .map(element => element * element)
  .reverse()
  .join('')
  .convert(Number)
  .value

const recurFibo = number => {
  function fib (current, next, number) {
    if(number === 0)
  }
}

console.log(test)

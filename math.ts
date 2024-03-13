const _ = (value: any): any => (...functions: any[]) : any =>
  functions.reduce((response, func) => func(response), value)

const reverseNumber = (parameter: number): number =>
  _(parameter)(
    (x: number): string => x
      .toString()
      .split('')
      .reverse()
      .join(''),
    Number)

const multiplyEachDigit = (parameter: number): number =>
  _(parameter)(
    (x: string): string => x
      .toString()
      .split('')
      .map(Number)
      .map(x => x * x)
      .map(String)
      .join(''),
    Number)

const digitalRoot = (parameter: number): number => parameter < 10
  ? parameter
  : _(parameter)(
      (x: number): number => x
        .toString()
        .split('')
        .map(Number)
        .reduce((response, current) => response + current ,0),
      digitalRoot)

console.log(reverseNumber(1234))
console.log(reverseNumber(5678))

console.log(multiplyEachDigit(1234))

console.log(digitalRoot(3333))
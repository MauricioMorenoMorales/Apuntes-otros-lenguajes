const fs = require('fs')

const orders = `

`

const orderNumbersList = orders
  .replace(/ORD/g, "%ORD")
  .split("%")
  .map(test => test.trim())
  .filter(Boolean)
  .map(test => ({testId: test, type: "ngs"}))//! Change to needed type

console.log(JSON.stringify(orderNumbersList))

function generateJsonFormat(objectArray, fileName) {
  const completeJsonFormat = {
    "instructions": "Object example for reports array: {testId: 'ORD-666666-01', sampleId: 'INHGCS'}",
    "reports": objectArray
  }
  const jsonData = JSON.stringify(completeJsonFormat, null, 2)

  fs.writeFile(`./${fileName}.json`, jsonData, 'utf8', error => {
    if (error) {
      console.error('Error generating the JSON', error)
      return
    }
    console.log(`File ${fileName}.json was generated successfully`)
  })
}

generateJsonFormat(orderNumbersList, "backfill")
